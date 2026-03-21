---
name: Review and sync tasks with doit
description: Use this to retrieve tasks from doit (doit.mvaldes.dev), sync new Obsidian tasks into it, and provide a summary with analytics
tags:
  - ai
---
# Review & Sync Tasks with Doit

Retrieve tasks from the doit API at `https://doit.mvaldes.dev`, sync new Obsidian tasks into it, and provide a summary with analytics.

## Configuration

**API Base URL:** `https://doit.mvaldes.dev`
**Auth:** `Authorization: Bearer $TD_API_KEY` (env var)
**Obsidian Vault:** wiki
**Projects Base Path:** 01-Projects
**Project Mapping:**
- homelab → Homelab
- dev → Dev
- signoz → Work
- youtube → Content

**Sync Statuses:** backlog, in-progress, todo (skip tasks with status: done)

---

## Frontmatter Structure

Task files use YAML list syntax for `kind` and `status`:

```yaml
kind:
  - task
status:
  - backlog   # or: in-progress, todo, done
name: My Task Name
project: homelab
due: 2026-03-01
tags:
  - pending/homelab
```

---

## Instructions

### Step 1: Fetch Current State from Doit

Run these in parallel using `curl` via Bash:

1. **All tasks** — `GET /api/tasks` — build a set of existing titles (lowercased) for dedup
2. **Today's tasks** — `GET /api/tasks/today`
3. **Overdue tasks** — `GET /api/tasks/overdue`
4. **Upcoming tasks** — `GET /api/tasks/upcoming`
5. **Projects list** — `GET /api/projects` — use this to resolve project names → IDs

All requests use:
```
Authorization: Bearer $TD_API_KEY
```

Example:
```bash
curl -s https://doit.mvaldes.dev/api/tasks \
  -H "Authorization: Bearer $TD_API_KEY"
```

### Step 2: Find Obsidian Task Files

Use the Grep tool to find all markdown files with `kind:` frontmatter under `01-Projects`:

```
pattern: "^kind:"
path: 01-Projects
glob: **/*.md
output_mode: files_with_matches
```

### Step 3: Read and Parse Obsidian Tasks

For each file found:
1. Read the file to extract frontmatter
2. Extract: `name`, `project` (folder name), `status`, `tags`, `due`, `description`
3. `status` and `kind` are YAML lists — check for `- done` inside the list
4. Skip if status contains `done`
5. If no `name` field, derive it from the filename (strip date prefix and dashes)

### Step 4: Resolve Project IDs

From the `/api/projects` response, build a name → ID map. Use the project mapping above to translate Obsidian folder names to doit project names, then resolve the ID.

### Step 5: Sync New Tasks

For each Obsidian task **not already in doit** (compare lowercased title against existing task titles):

1. Build the Obsidian deep link:
   ```
   obsidian://open?vault=wiki&file=01-Projects%2F<folder>%2F<filename>.md
   ```
   (URL-encode path separators and spaces)

2. Create the task via `POST /api/tasks`:
```bash
curl -s -X POST https://doit.mvaldes.dev/api/tasks \
  -H "Authorization: Bearer $TD_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "<task name>",
    "description": "<frontmatter description>\n\nObsidian: obsidian://open?vault=wiki&file=...",
    "status": "todo",
    "project_id": "<resolved project ID>",
    "due_date": "<YYYY-MM-DD if present>",
    "tags": ["<tags from frontmatter>"]
  }'
```

### Step 6: Provide Summary & Analytics

After processing, output a structured report:

#### Sync Summary
- ✅ Tasks added (count + names)
- ⏭️ Tasks skipped — already exist in doit
- ⏭️ Tasks skipped — status is `done`

#### Task Analytics (from doit API data)
- **Today:** count and titles of tasks due today
- **Overdue:** count and titles of past-due tasks (flag these prominently)
- **Upcoming (7 days):** count and titles
- **By Status:** breakdown of todo / doing / done across all tasks
- **By Project:** task count per project
- **Completion rate:** `done / total * 100%`

---

## Notes
- Always fetch projects first so IDs are available before creating tasks
- URL-encode Obsidian link paths (spaces → `%20`, `/` → `%2F` inside the file param)
- If a project mapping is not found, default to the Inbox project
- Batch reads in parallel where possible; task creation must be sequential to avoid duplicates
- If `$TD_API_KEY` is not set, stop and ask the user to set it
