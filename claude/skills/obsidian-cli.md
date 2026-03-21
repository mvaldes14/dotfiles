---
name: Obsidian CLI
description: Use this skill whenever the user asks about vault health, orphans, dead-ends, unresolved links, tags, tasks, files, or any vault-wide query. Always prefer the obsidian CLI over manual file searches.
tags:
  - ai
---
# Obsidian CLI

The `obsidian` binary is installed at `/Applications/Obsidian.app/Contents/MacOS/obsidian` and is also available as `obsidian` on PATH. Always use it for vault queries instead of grep/glob when a dedicated command exists.

> **Note:** Every invocation prints a loading line to stderr. Pipe output through `2>/dev/null | grep -v "Loading updated"` when showing results to the user.

## Vault

```bash
obsidian vault                  # show vault name, path, file/folder counts
obsidian vaults                 # list all known vaults
```

## Vault Health

```bash
obsidian orphans                # files with NO incoming links
obsidian orphans total          # count only
obsidian orphans all            # include non-markdown files

obsidian deadends               # files with NO outgoing links
obsidian deadends total

obsidian unresolved             # broken wikilinks
obsidian unresolved total
obsidian unresolved verbose     # include source files
obsidian unresolved format=json
```

## Files & Folders

```bash
obsidian files                          # all files
obsidian files folder=01-Projects       # filter by folder
obsidian files ext=md                   # filter by extension
obsidian files total

obsidian folders
obsidian folders folder=01-Projects     # sub-folders only
```

## Search

```bash
obsidian search query="kubernetes"
obsidian search query="kubernetes" path=02-Resources
obsidian search query="kubernetes" limit=20
obsidian search:context query="flux"    # includes surrounding line context
```

## Tags

```bash
obsidian tags                           # all tags in vault
obsidian tags counts sort=count         # sorted by frequency
obsidian tags file="20251218-k8s-lsp"  # tags for a specific note
```

## Backlinks & Links

```bash
obsidian backlinks file="Dashboard"     # what links TO a file
obsidian backlinks path=Dashboard.md counts

obsidian links file="Dashboard"         # outgoing links FROM a file
obsidian links path=01-Projects/homelab/20251218-k8s-lsp.md total
```

## Tasks

```bash
obsidian tasks                          # all tasks in vault
obsidian tasks todo                     # incomplete only
obsidian tasks done                     # completed only
obsidian tasks path=06-Work/2026-02.md  # tasks in a specific file
obsidian tasks format=json
```

## Reading & Writing Notes

```bash
obsidian read file="20251218-k8s-lsp"   # read by name (fuzzy)
obsidian read path=01-Projects/homelab/20251218-k8s-lsp.md

obsidian append path=<path> content="text"
obsidian prepend path=<path> content="text"

obsidian create name="new-note" content="..." template="notes"
obsidian create path=00-Inbox/20260223-new.md content="..."
```

## Properties / Frontmatter

```bash
obsidian properties                     # all properties in vault
obsidian properties counts sort=count
obsidian properties file="note-name"    # properties for one file

obsidian property:read name=status path=01-Projects/homelab/20251218-k8s-lsp.md
obsidian property:set name=status value=done path=<path>
obsidian property:remove name=status path=<path>
```

## Aliases & Outlines

```bash
obsidian aliases verbose                # all aliases + file paths
obsidian outline file="Dashboard"       # heading tree
obsidian outline file="Dashboard" format=json
```

## Common Workflows

### Find all orphans in a specific folder
```bash
obsidian orphans 2>/dev/null | grep "^01-Projects/"
```

### Find all notes tagged with a specific tag
```bash
obsidian search query="#homelab" 2>/dev/null
```

### Count tasks by status across the vault
```bash
obsidian tasks todo total 2>/dev/null
obsidian tasks done total 2>/dev/null
```

### Check a note's backlinks before deleting
```bash
obsidian backlinks file="note-name" 2>/dev/null
```

## Notes
- `file=<name>` resolves by name (like wikilinks, fuzzy) — use for convenience
- `path=<path>` is exact relative path from vault root — use when names are ambiguous
- Quote values with spaces: `name="My Note"` or `path="06-Work/2026-02.md"`
- Default vault is whichever is active in Obsidian; use `vault=<name>` to target a specific one
