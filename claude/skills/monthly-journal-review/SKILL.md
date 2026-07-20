---
description: Synthesizes the work journal into a monthly summary
---

Perform a monthly journal review for the **last completed month**. Read all source material, synthesize it, and write the summary directly into the existing month file — no new files.

## Data Collection

Run all of the following reads in parallel:

1. **Work journal** — read `~/Obsidian/wiki/Work/YYYY-MM.md` for the target month

Determine the target month from today's date: the review targets the **previous** calendar month (e.g. if today is in July, review June). This is because the current month is usually still in progress and sparse. In January, the target is December of the prior year.

If the target month's file is empty or missing meaningful entries, tell the user and ask whether to review a different month instead of writing an empty summary.

## Synthesis

From the source material, extract:

**Wins** — things shipped, completed, or meaningfully progressed. Work only.

**Blockers** — recurring problems, unresolved issues, or things that slowed progress. Include patterns that appeared across multiple weeks.

**Learnings** — non-obvious takeaways from the month. Things to do differently, capacity or planning lessons, habits that did or didn't work.

**Numbers** — a small table of meaningful metrics (tasks completed, customers worked, reviews done, etc.).

**Focus for next month** — 3 to 5 concrete commitments, not observations.

## Output Format

Write the summary in plain prose and short lists. Do not use horizontal rules (`---`) between sections. Use `##` headers to separate sections. Keep it direct — this is a personal reflection, not a report.

## Write the Summary

Edit `~/Obsidian/wiki/Work/YYYY-MM.md` to replace the `# Summary` section content. Specifically, replace the placeholder comment:

```
<!-- End-of-month reflection: wins, blockers, learnings -->
```

with the full synthesized summary. Leave the `# Summary` heading and all weekly sections below it untouched.

Use the Edit tool to make this change in-place. Do not create a new file.

After writing, confirm the file path where the summary was saved.
