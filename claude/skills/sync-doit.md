---
name: Sync tasks from GitHub to doit
description: Daily sync — pull open GitHub issues assigned to @me and create any missing ones in doit
tags:
  - ai
---
# Daily Task Sync

Sync open GitHub issues assigned to `@me` from `signoz/platform-pod` into doit (`https://doit.mvaldes.dev`). Deduplicates against existing tasks.

## Configuration

**API Base URL:** `https://doit.mvaldes.dev`
**Auth:** `Authorization: Bearer $TD_API_KEY` (env var)
**GitHub Repo:** `signoz/platform-pod`
**Project mapping:** GitHub issues → Work project in doit

If `$TD_API_KEY` is not set, stop and ask the user to set it.

---

## Instructions

### Step 1: Fetch Current State (parallel)

```bash
curl -s https://doit.mvaldes.dev/api/tasks -H "Authorization: Bearer $TD_API_KEY"
curl -s https://doit.mvaldes.dev/api/projects -H "Authorization: Bearer $TD_API_KEY"
gh issue list --assignee @me --state open -R signoz/platform-pod \
  --json number,title,url,labels,createdAt,updatedAt --limit 100
```

### Step 2: Resolve Work Project ID

From the `/api/projects` response, find the project named `Work` and extract its `id`.

### Step 3: Sync Missing Issues to Doit

For each GH issue where `[GH-<number>]` does not already exist in doit task titles (case-insensitive match):

```bash
curl -s -X POST https://doit.mvaldes.dev/api/tasks \
  -H "Authorization: Bearer $TD_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "[GH-<number>] <issue title>",
    "description": "",
    "status": "todo",
    "project_id": "<Work project ID>",
    "tags": [],
    "links": [{"label": "GitHub Issue", "url": "<issue URL>"}]
  }'
```

Task creation must be sequential to avoid duplicates.

### Step 4: Close Resolved Issues in Doit

From the doit tasks, collect all tasks with titles matching `[GH-<number>]` that are **not** `done`.

Build a set of open GH issue numbers from Step 1. For any doit task whose GH number is **not** in that set (issue was closed or unassigned), mark it done:

```bash
curl -s -X PATCH https://doit.mvaldes.dev/api/tasks/<task_id> \
  -H "Authorization: Bearer $TD_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"status": "done"}'
```

### Step 5: Output Sync Summary

- ✅ Issues added: count + `[GH-number] title` for each
- ✅ Issues closed in doit: count + `[GH-number] title` for each
- ⏭️ Already in sync: count
- ⚠️ Errors: any failed creates, patches, or auth issues
