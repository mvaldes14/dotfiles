---
name: Journal review
description: Use this when the user asks for a review or summary of their monthly work journal
tags:
  - ai
---
# Journal Review

## Considerations
- Monthly journals are stored in `06-Work/` with format `YYYY-MM.md` (e.g., `2026-01.md`)
- Default to the current month's journal unless the user specifies a different month
- Journals contain daily entries with tasks, customer interactions, meeting notes, and general work activity
- Tasks within journals use standard Obsidian checkbox format (`- [ ]` / `- [x]`)

## Directions
- Read the target month's journal file from `06-Work/`
- Analyze all entries across the month
- Generate a structured review covering the sections below

## Output
Provide the following sections in clean markdown:

1. **Summary of completed tasks** - count and key achievements
2. **Pending tasks** - what's still open, any overdue items
3. **Customer activity** - summarize interactions per customer
4. **Patterns** - recurring themes, blockers, or wins
5. **Suggestions** - tasks that might need follow-up, upcoming deadlines, or items at risk

## Example Output Structure

```markdown
# Journal Review - YYYY-MM

## Completed Tasks (X)
- Key achievement 1
- Key achievement 2

## Pending Tasks (X)
- [ ] Task still open (noted on YYYY-MM-DD)
- [ ] Overdue item (was due YYYY-MM-DD)

## Customer Activity
### Customer A
- X interactions, summary of work

### Customer B
- Y interactions, summary of work

## Patterns
- Recurring theme or blocker
- Notable wins

## Suggestions
- Follow up on X
- Y deadline approaching
```

## Important Notes
- Use the current system date to determine "overdue" or "upcoming"
- If the journal file for the requested month does not exist, let the user know
- Keep the review concise and actionable — focus on insights, not restating every line
