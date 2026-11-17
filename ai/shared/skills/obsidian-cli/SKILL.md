---
name: obsidian-cli
description: Use this skill whenever the user asks about vault notes, health, links, tags, tasks, files, or any vault-wide query. Access the always-available headless vault at ~/Obsidian/wiki.
tags:
  - ai
---
# Obsidian headless vault

Vault is always available at `~/Obsidian/wiki` and synchronized by `obsidian-headless` (`ob`). No Obsidian desktop process is required. Never gate vault access on `pgrep -x Obsidian`.

`ob` manages Sync only; it does not query note content. For note operations:
- Prefer native `obsidian_*` tools when available.
- Otherwise use filesystem tools against `~/Obsidian/wiki`: `rg`/`fd` for discovery, Read for inspection, Edit for targeted changes, Write only for new files or full rewrites.
- Ignore root-level `.base` files when inventorying or searching content.
- Do not run `ob sync` unless user asks for sync troubleshooting.

## Finding Files

Prefer full-text content search and filename/prefix matching. The vault has few tags (only `Blog/` notes use them), so **do not rely on tag search** to locate files.

```bash
rg -n -i 'kubernetes' ~/Obsidian/wiki -g '*.md' -g '!Archive/**'
rg -n -i 'flux' ~/Obsidian/wiki/Resources -g '*.md'
fd -e md . ~/Obsidian/wiki/Resources | grep '/homelab-'
```

When native tools are available, use `obsidian_search`, `obsidian_read`, `obsidian_write`, and related link/tag tools instead.

## Vault Health

Use native Obsidian tools for backlinks and tags. For vault-wide orphan, dead-end, or unresolved-link analysis, scan Markdown files and wikilinks under `~/Obsidian/wiki`; exclude `.base`, `Archive/`, and `Templates/` unless user requests them.

## Links & Tasks

- Backlinks: use `obsidian_list_backlinks`.
- Tags: use `obsidian_list_tags`; tags are normally only used in `Blog/`.
- Tasks: task state lives in doit, not Obsidian. Search Markdown checkboxes only when explicitly requested.

## Read & Write Notes

Use `obsidian_search` to resolve fuzzy names, then `obsidian_read` with exact vault-relative path. Before overwriting an existing note, read it first and confirm with user. Use `obsidian_append` for logs and journals.

## Frontmatter

Read YAML frontmatter with `obsidian_read(parse_frontmatter=true)`. Preserve existing fields and follow vault frontmatter conventions when editing.

## Notes
- Canonical vault path: `/home/mvaldes/Obsidian/wiki`.
- No desktop app/process check.
- `ob` binary means Obsidian Headless Sync client, not note-query CLI.
- Use exact vault-relative paths after resolving note names.
