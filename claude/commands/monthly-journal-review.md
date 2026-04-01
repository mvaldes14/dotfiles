---
description: Synthesizes weekly reviews and work journal into a monthly summary
---

Perform a monthly journal review for the current month. Read all source material, synthesize it, and write the summary directly into the existing month file — no new files.

## Data Collection

Run all of the following reads in parallel:

1. **Work journal** — read `~/Obsidian/wiki/06-Work/YYYY-MM.md` for the current month

Use today's date to determine the correct month.

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

Edit `~/Obsidian/wiki/06-Work/YYYY-MM.md` to replace the `# Summary` section content. Specifically, replace the placeholder comment:

```
<!-- End-of-month reflection: wins, blockers, learnings -->
```

with the full synthesized summary. Leave the `# Summary` heading and all weekly sections below it untouched.

Use the Edit tool to make this change in-place. Do not create a new file.

After writing, confirm the file path where the summary was saved.
