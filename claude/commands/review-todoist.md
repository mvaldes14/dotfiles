---
description: Reviews all Todoist tasks for hygiene, prioritization, and actionability
---

Perform a comprehensive review of my Todoist tasks following productivity best practices. Use the todoist MCP tools to gather data, then produce an actionable report.

## Data Collection

Run the following steps in order, gathering as much data as possible:

1. **Get user info** — fetch timezone, goals, and plan details
2. **Get today's tasks** — use `find-tasks-by-date` with `startDate: "today"` and `include-overdue` to see what's due and overdue
3. **Get the full overview** — use `get-overview` (no projectId) to see all projects, sections, and task hierarchy
4. **Get upcoming week** — use `find-tasks-by-date` with `startDate: "today"` and `daysCount: 7` to see the next 7 days
5. **Find inbox tasks** — use `find-tasks` with `projectId: "inbox"` and a high limit to find unorganized tasks
6. **Find tasks without due dates** — use `find-tasks` across projects with no date filtering to compare against dated tasks
7. **Recent completions** — use `find-completed-tasks` for the last 7 days to understand velocity

## Analysis & Report

After collecting data, produce a structured report with these sections:

### 1. Daily Focus (Today)
- List today's tasks grouped by priority
- Flag any overdue tasks with how many days overdue
- Assess if the day is overloaded (more than 5-7 tasks) or underloaded

### 2. Inbox Triage
- Count tasks sitting in the inbox
- For each inbox task, suggest: move to a project, add a due date, or delete
- Inbox should ideally be empty — it's a capture point, not a holding area

### 3. Priority Hygiene
- Flag tasks marked p1 (urgent) that have been sitting for more than 3 days — they may not be truly urgent
- Flag tasks with no priority set (p4/default) that have upcoming due dates — they may need escalation
- Check for priority inflation (too many p1/p2 tasks dilute focus)

### 4. Stale & Overdue Tasks
- List all overdue tasks sorted by how many days overdue
- For tasks overdue by more than 7 days, recommend: reschedule, delegate, or delete
- Flag tasks with no recent activity that may be abandoned

### 5. Upcoming Week Preview
- Summarize task load per day for the next 7 days
- Flag days that are overloaded (more than 7 tasks)
- Flag days with zero tasks (opportunity to redistribute)

### 6. Project Health
- For each project, report: total open tasks, tasks with due dates vs without, priority distribution
- Flag projects with more than 20 open tasks (may need breaking down)
- Flag projects with zero activity in the last 2 weeks (stalled?)

### 7. Actionability Check
- Flag tasks with vague titles (e.g., single words, no verb, too generic)
- Good tasks start with a verb: "Write", "Fix", "Review", "Call", "Research"
- Suggest rewording for the top offenders

### 8. Completion Velocity
- How many tasks were completed in the last 7 days?
- Compare against the number of tasks added (are you keeping up?)
- Note any trends (completing mostly easy tasks? neglecting a specific project?)

## Output Format

Present the report as a clean markdown document with:
- A **TL;DR** at the top with 3-5 key takeaways
- Each section with counts and specific task names/IDs
- A **Quick Wins** section at the bottom: 3-5 small actions the user can take right now to improve task hygiene
- Offer to help execute any of the recommended changes (reschedule, reprioritize, move tasks, etc.)

## Save Report

After presenting the report, **always** save it as a markdown file:
- **Path:** `~/Obsidian/wiki/07-Personal/Reviews/YYYY-MM-DD.md` (using today's date)
- Create the directory if it doesn't exist
- After saving, **always** output the full file path so the user knows where to find it

## Tone

Be direct and practical. This is a personal productivity review, not a corporate report. Call out what needs attention without being preachy.
