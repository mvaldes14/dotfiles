---
name: Sync tasks from GitHub to doit
description: Daily sync — pull open GitHub issues assigned to @me and create any missing ones in doit
tags:
  - ai
allowed-tools: mcp__doit__list_tasks, mcp__doit__list_projects, mcp__doit__create_task, mcp__doit__update_task, Bash
---
# Daily Task Sync

Sync open GitHub issues assigned to `@me` from `signoz/platform-pod` into doit. Deduplicates against existing tasks.

## Configuration

**GitHub Repo:** `signoz/platform-pod`
**Project mapping:** GitHub issues → Work project in doit

---

## Instructions

### Step 1: Fetch Current State (parallel)

Call in parallel:
- `mcp__doit__list_tasks` — all existing doit tasks
- `mcp__doit__list_projects` — to resolve the Work project ID
- `gh issue list --assignee @me --state open -R signoz/platform-pod --json number,title,url,labels,createdAt,updatedAt --limit 100` via Bash

### Step 2: Resolve Work Project ID

From `mcp__doit__list_projects`, find the project named `Work` and extract its `id`.

### Step 3: Sync Missing Issues to Doit

For each GH issue where `[GH-<number>]` does not already exist in doit task titles (case-insensitive match), call `mcp__doit__create_task` with:

```json
{
  "title": "[GH-<number>] <issue title>",
  "status": "todo",
  "project_id": "<Work project ID>",
  "links": [{"label": "GitHub Issue", "url": "<issue URL>"}]
}
```

Task creation must be sequential to avoid duplicates.

### Step 4: Close Resolved Issues in Doit

From the doit tasks, collect all tasks with titles matching `[GH-<number>]` that are **not** `done`.

Build a set of open GH issue numbers from Step 1. For any doit task whose GH number is **not** in that set (issue was closed or unassigned), call `mcp__doit__update_task` with `{"status": "done"}`.

### Step 5: Output Sync Summary

- ✅ Issues added: count + `[GH-number] title` for each
- ✅ Issues closed in doit: count + `[GH-number] title` for each
- ⏭️ Already in sync: count
- ⚠️ Errors: any failed creates, updates, or auth issues
