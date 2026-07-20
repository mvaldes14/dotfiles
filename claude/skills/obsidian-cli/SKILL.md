---
name: Obsidian CLI
description: Use this skill whenever the user asks about vault health, orphans, dead-ends, unresolved links, tags, tasks, files, or any vault-wide query. Always prefer the obsidian CLI over manual file searches.
tags:
  - ai
---
# Obsidian CLI

The `obsidian` CLI is on PATH (`/usr/local/bin/obsidian`). Always use it for vault queries instead of grep/glob/Read/Write when a dedicated command exists.

> Every invocation prints a loading line to stderr. Pipe through `2>/dev/null` when showing results to the user.

**Inside the wiki vault, prefer these over the generic tools:**
- `obsidian read` instead of Read
- `obsidian create` / `obsidian append` instead of Write/Edit
- `obsidian search` / `obsidian files` instead of Grep/Glob

Most commands accept `total` (count only), `format=json`, and `verbose` modifiers.

## Finding Files

Prefer full-text content search and filename/prefix matching. The vault has few tags (only `Blog/` notes use them), so **do not rely on tag search** to locate files.

```bash
obsidian search query="kubernetes"              # full-text content search
obsidian search query="kubernetes" path=Resources limit=20
obsidian search:context query="flux"            # with surrounding lines
```

`obsidian files` only filters by `folder=` and `ext=` — there is no name/glob flag. To find files by area prefix (`signoz-*`, `homelab-*`, `dev-*`, `youtube-*`), pipe to grep:

```bash
obsidian files folder=Resources 2>/dev/null | grep '^Resources/signoz-'   # by area prefix
obsidian files 2>/dev/null | grep -i 'clickhouse'                          # by name substring
obsidian files folder=Resources ext=md                                     # all Resources notes
```

## Vault Health

```bash
obsidian orphans          # files with NO incoming links
obsidian deadends         # files with NO outgoing links
obsidian unresolved       # broken wikilinks (add verbose for source files)
```

## Links & Tasks

```bash
obsidian backlinks file="Dashboard"      # what links TO a file
obsidian links file="Dashboard"          # outgoing links FROM a file
obsidian tasks todo                       # incomplete tasks (done / path=<file> to filter)
obsidian tags                             # rarely useful — tags exist only in Blog/ notes
```

## Read & Write Notes

```bash
obsidian read file="20251218-k8s-lsp"    # fuzzy by name
obsidian read path=Resources/homelab-k8s-lsp.md
obsidian append path=<path> content="text"
obsidian prepend path=<path> content="text"
obsidian create path=Inbox/20260223-new.md content="..." template="notes"
```

## Frontmatter

```bash
obsidian properties file="note-name"                        # props on one file
obsidian property:read name=status path=<path>
obsidian property:set name=status value=done path=<path>
obsidian property:remove name=status path=<path>
```

## Notes
- `file=<name>` resolves fuzzily (like wikilinks); `path=<path>` is exact from vault root — use it when names are ambiguous.
- Quote values with spaces: `path="Work/2026-02.md"`.
- Default vault is whichever is active in Obsidian; use `vault=<name>` to target another.
