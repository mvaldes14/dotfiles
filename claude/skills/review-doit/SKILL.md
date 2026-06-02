---
description: Reviews all doit tasks for hygiene, prioritization, and actionability
allowed-tools: mcp__doit__list_tasks, mcp__doit__get_today_tasks, mcp__doit__get_overdue_tasks, mcp__doit__list_projects, mcp__doit__update_task, mcp__doit__delete_task
---

Perform a comprehensive review of my tasks in doit following productivity best practices. Use the doit MCP tools to gather data, then give me pointers in chat I can action on. Do NOT save the report anywhere — output to chat only.

## Data Collection

Call all of the following in parallel using MCP tools:

1. **All tasks** — `mcp__doit__list_tasks` — full task list for counts, status breakdown, and stale detection
2. **Today's tasks** — `mcp__doit__get_today_tasks` — what's due today
3. **Overdue tasks** — `mcp__doit__get_overdue_tasks` — past-due items
4. **Projects** — `mcp__doit__list_projects` — project list with task counts

## Analysis & Report

After collecting data, produce a structured report with these sections:

### 1. Daily Focus (Today)
- List today's tasks (from `/api/tasks/today`)
- Flag any overdue tasks with how many days overdue
- Assess if the day is overloaded (more than 5–7 tasks) or underloaded

### 2. Inbox Triage
- List tasks with no `project_id` (unorganized / inbox tasks)
- For each, suggest: assign to a project, add a due date, or delete
- Inbox should ideally be empty — it's a capture point, not a holding area

### 3. Status Hygiene
- Flag tasks stuck in `doing` for more than 3 days (stale in-progress)
- Flag tasks in `todo` with a past due date that haven't moved to `doing`
- Check for overuse of `doing` status (too many active tasks dilutes focus)

### 4. Stale & Overdue Tasks
- List all overdue tasks (from `/api/tasks/overdue`) sorted by how many days overdue
- For tasks overdue by more than 7 days, recommend: reschedule, or delete
- Flag `todo` tasks with no `due_date` that have been sitting untouched

### 5. Upcoming Week Preview
- Summarize task load per day for the next 7 days
- Flag days that are overloaded (more than 7 tasks)
- Flag days with zero tasks (opportunity to redistribute)

### 6. Project Health
- For each project (from `/api/projects`), report: total open tasks, tasks with due dates vs without
- Flag projects with more than 20 open tasks (may need breaking down)
- Flag projects with zero open tasks (completed or abandoned?)

### 7. Actionability Check
- Flag tasks with vague titles (single words, no verb, too generic)
- Good tasks start with a verb: "Write", "Fix", "Review", "Call", "Research"
- Suggest rewording for the top offenders

### 8. Completion Velocity
- Count tasks currently in `done` status
- Compare against total open tasks (todo + doing) — are you keeping up?
- Note any trends (all done tasks in one project? others neglected?)

### 9. OKR Progress (Content project)
Most Content-project tasks contribute to the current quarter's OKRs via tag conventions. Reconcile OKR progress with completed Content tasks.

**Tag conventions:** short form, no `kr-` prefix — `video`, `blog`, `stream`. If any Content task is still tagged `kr-video`, `kr-blog`, or `kr-stream`, rename it in place via `mcp__doit__update_task` before computing progress, and call out the migration in the report.

1. Find the active OKR file: `/Users/mvaldes/Obsidian/wiki/Resources/okr-YYYY-qN.md` for the current quarter (today is in Q2 → `okr-2026-q2.md`). Read it to get the `key_results` list and tag → kr-id mapping (defined in the "doit tag conventions" section).
2. From the full task list, filter to tasks where `project` matches the **Content** project and `status == "done"`. Only count tasks completed in the current quarter (use `updated_at`/`completed_at` if present; if unavailable, count all `done` tasks in Content and note the caveat).
3. Bucket done tasks by tag (`video` → `kr-video`, `blog` → `kr-blog`, `stream` → kr-stream). A task with no matching tag is reported separately as "untagged Content done tasks — won't update OKRs".
4. For each KR, compare the new computed `progress` against the value currently in the OKR file's frontmatter. Show a diff table: `KR | current progress | computed progress | delta`.
5. If there are changes, update the OKR file in place using the Edit tool:
   - Update each KR's `progress:` field in the YAML frontmatter
   - Update the matching row in the markdown progress table
   - Re-evaluate `status:` (on-track / at-risk / off-track) based on `progress/target` and time remaining in the quarter; only change it if clearly warranted, and call out the change in the report
6. Report what was updated (or "no changes — OKRs already in sync") in the review output. Include the path of the OKR file edited.

If no active OKR file exists for the current quarter, skip this section and flag it as a quick win ("create OKR file for current quarter").

## Output Format

Present the report as a clean markdown document with:
- A **TL;DR** at the top with 3–5 key takeaways
- Each section with counts and specific task titles/IDs
- A **Quick Wins** section at the bottom: 3–5 small actions to take right now to improve task hygiene
- Offer to help execute any recommended changes (reschedule via `mcp__doit__update_task`, delete via `mcp__doit__delete_task`)

## Tone

Be direct and practical. This is a personal productivity review, not a corporate report. Call out what needs attention without being preachy.
