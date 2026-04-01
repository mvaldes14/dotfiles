---
description: Lists open doit tasks and schedules one into a free Google Calendar slot
allowed-tools: Bash
---

## Step 1: Guard & Fetch Tasks

If `$TD_API_KEY` is not set, output: "TD_API_KEY is not set. Export it before running: export TD_API_KEY='...'" and stop.

Otherwise, fetch in parallel:
- `GET /api/tasks?status=todo`
- `GET /api/tasks?status=doing`
- `GET /api/projects`

All with `Authorization: Bearer $TD_API_KEY` header. If any call fails, report the error and stop.

Store the responses. Merge todo + doing tasks into one list. Resolve each task's `project_id` to its project name using the projects response (or "Inbox" if no project).

## Step 2: Display Task List

If the merged task list is empty, output: "No open tasks found." and stop.

Otherwise, render a table with columns: `#`, `Title`, `Project`, `Priority`, `Status`, `Due`.

Example:
```
#   Title                              Project     Priority   Status   Due
1   Fix prometheus scrape binding       Homelab     high       doing    2026-04-03
2   Write OTel gateway documentation   Work        medium     todo     —
3   Review ClickHouse merge settings    Homelab     low        todo     2026-04-07
```

**Pause here and ask the user: "Which task would you like to schedule? (enter task number)"**

Validate the user's input is a number and in range. If invalid, re-prompt.

Store the picked task. Extract its `id`, `title`, `project_id` (resolved name), and `priority`.

## Step 3: Ask Duration

**Pause and ask: "How long do you need? (enter as `30m`, `1h`, `2h`, default: `1h`)"**

Parse the input:
- `30m` or `0.5h` → 30 minutes
- `1h` or `1` or blank → 60 minutes (default)
- `2h` → 120 minutes
- `90m` → 90 minutes

If the input doesn't match any pattern, default to 60 minutes and note: "Using default duration: 1 hour."

Store the duration in minutes.

## Step 4: Query Calendar Free/Busy

Compute today's date and the date 7 days out in `YYYY-MM-DD` format (CT timezone).

Run a single Bash call to query free/busy:

```bash
gws calendar freebusy query --json '{
  "timeMin": "'$(date -u +%Y-%m-%d)'T00:00:00-05:00",
  "timeMax": "'$(date -u -v+7d +%Y-%m-%d)'T23:59:59-05:00",
  "timeZone": "America/Chicago",
  "items": [{"id": "primary"}]
}' --format json
```

If the call fails (non-zero exit), report the error and stop.

Parse the JSON response. Extract the `calendars.primary.busy` array (list of objects with `start` and `end` timestamps). If the array is empty or missing, assume no busy times.

## Step 5: Compute Free Slots

Use an inline Python script to find available slots. Pass the busy times JSON, duration, and current date/time.

The script should:
- Working hours: **9:00 AM to 6:00 PM CT, Monday–Friday only**
- Slot grid: 30-minute intervals (9:00, 9:30, 10:00, ..., 17:30)
- For each potential slot start time in the grid:
  - Compute slot end time = start + duration
  - If slot end time is past 6:00 PM: skip
  - If slot start time is in the past (before now, today only): skip
  - If slot overlaps any busy interval: skip
  - Otherwise: add to available list
- Collect the first 5 non-overlapping slots
- Format output as JSON array with fields: `date` (YYYY-MM-DD), `start` (HH:MM), `end` (HH:MM), `display` (human readable)
- Return JSON array

Run this Python command (substitute `<duration_minutes>`, `<busy_json>`, and `<now_iso>` with actual values):

```bash
python3 -c '
import json, sys
from datetime import datetime, timedelta
from zoneinfo import ZoneInfo

tz = ZoneInfo("America/Chicago")
now = datetime.fromisoformat("'<now_iso>'")
duration_min = <duration_minutes>
busy_json = '<busy_json>'

busy_list = json.loads(busy_json) if busy_json else []

# Parse busy times to datetime objects
busy_intervals = []
for b in busy_list:
    start = datetime.fromisoformat(b["start"]).astimezone(tz)
    end = datetime.fromisoformat(b["end"]).astimezone(tz)
    busy_intervals.append((start, end))

slots = []
current = now.replace(hour=9, minute=0, second=0, microsecond=0)
end_date = now + timedelta(days=7)

while len(slots) < 5 and current < end_date:
    # Skip weekends (weekday >= 5 = Sat/Sun)
    if current.weekday() < 5:
        # Skip if start time is past 6pm or in the past
        if current.hour < 18 and (current.date() > now.date() or (current.date() == now.date() and current.time() >= now.time())):
            slot_end = current + timedelta(minutes=duration_min)
            
            # Skip if end is past 6pm
            if slot_end.hour <= 18:
                # Check for overlap with busy times
                overlaps = False
                for busy_start, busy_end in busy_intervals:
                    if current < busy_end and slot_end > busy_start:
                        overlaps = True
                        break
                
                if not overlaps:
                    day_name = current.strftime("%A")
                    mon_dd = current.strftime("%b %d")
                    start_ampm = current.strftime("%I:%M %p").lstrip("0")
                    end_ampm = slot_end.strftime("%I:%M %p").lstrip("0")
                    
                    slots.append({
                        "date": current.strftime("%Y-%m-%d"),
                        "start": current.strftime("%H:%M"),
                        "end": slot_end.strftime("%H:%M"),
                        "display": f"{day_name} {mon_dd}  {start_ampm} – {end_ampm} CT"
                    })
    
    # Move to next 30-min interval
    current += timedelta(minutes=30)

print(json.dumps(slots))
'
```

Parse the JSON output. If the array is empty, output: "No available slots in working hours over the next 7 days. Consider a shorter duration or check your calendar." and stop.

If fewer than 5 slots are found (but at least 1), note: "Only N slots available in the next 7 days."

Display the slots in a numbered list:
```
Available time slots:
1. Wednesday Apr 02  9:00 AM – 10:00 AM CT
2. Wednesday Apr 02  10:30 AM – 11:30 AM CT
3. Wednesday Apr 02  2:00 PM – 3:00 PM CT
4. Thursday Apr 03   9:00 AM – 10:00 AM CT
5. Friday Apr 04     11:00 AM – 12:00 PM CT
```

**Pause and ask: "Which slot would you like? (enter number 1–N)"**

Validate the input and re-prompt if invalid.

Store the chosen slot's `date`, `start`, `end`, and `display` string.

## Step 6: Book Event

**Create the calendar event via gws:**

Format the slot times as ISO 8601 with CT offset. For April, use `-05:00` (CDT).

Example: slot starting at 9:00 AM on Apr 2 → `2026-04-02T09:00:00-05:00`

Run:
```bash
gws calendar +insert \
  --summary "<task_title>" \
  --start "<start_iso>" \
  --end "<end_iso>" \
  --description "doit ID: <task_id> | Project: <project_name> | Priority: <priority>" \
  --calendar primary
```

If this fails (non-zero exit), report the gws error and **stop without updating doit**.

If successful, continue to the next step.

**Update the doit task:**

Run:
```bash
curl -s -X PATCH "https://doit.mvaldes.dev/api/tasks/<task_id>" \
  -H "Authorization: Bearer $TD_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "due_date": "<YYYY-MM-DD>",
    "due_time": "<HH:MM>",
    "status": "doing"
  }'
```

Extract the `due_date` and `due_time` (HH:MM in 24-hour format) from the chosen slot.

If this fails (HTTP error or JSON parse error), report the error. Note: the calendar event has already been created, so the user may need to manually link them or contact support. Still proceed to Step 7 to show what was created.

## Step 7: Confirmation

Output a clean summary block:

```
✓ Scheduled: <task_title>
  Calendar: <Day> <Mon> <DD>  <HH>:<MM> AM/PM – <HH>:<MM> AM/PM CT
  Doit:     due_date=<YYYY-MM-DD>  due_time=<HH:MM>  status=doing
  Task ID:  <task_id>
```

Done.
