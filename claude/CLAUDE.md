# Global Claude Context
## Who I Am
- DevOps/infrastructure engineer focused on observability and coding. 
- I work across AWS/GCP mostly, owner of a homelab running in k3s.
- Develop main on a mac but also use windows wsl2.

## Communication Preferences
- Be direct and technical — no hand-holding on fundamentals
- Prefer CLI-first approaches
- Skip boilerplate explanations unless I ask
- When debugging, lead with the most likely cause first
- Conventional commits, structured configs matter to me

## Primary Tech Stack
- **Kubernetes**: AWS/GKE (production), k3s (homelab)
- **GitOps**: FluxCD + Helm
- **Ingress**: Traefik (homelab)
- **Observability**: SigNoz, OpenTelemetry (collector, operator, OpAMP), Grafana, Victoriametrics
- **Storage/Streaming**: ClickHouse, Redpanda
- **IaC/Config**: Ansible, Nix/home-manager, CUE, Terraform
- **Languages**: Go (preferred), some Python, Bash

## Homelab (eva01/2/3/4)
- k3s multi node cluster
- FluxCD for GitOps
- Traefik ingress
- Running: Grafana, Signoz, Hashicorp Vault, Victoriametrics, Umami, Paperless-ngx, shlink, nocodb, home assistant, etc.

## Dev Environment
- **Mac**: Mac M5 and M4 Pro (primary)
- **Also**: WSL/NixOS, work laptop
- Dev environments using a mix of brew, devbox(nix)
- Shell tooling: fd, fzf, standard CLI-first setup

## Note-taking / Task Management
- **Obsidian**: primary notes + projects and knowledge management
- **Vault path**: `/Users/mvaldes/Obsidian/wiki`
- **Folder layout**: `Inbox`, `Resources` (flat, all topic notes), `Blog`, `Web`, `Work`, `Reviews`, `Logs`, `Archive`, `Templates`, `Assets`
- **Dashboards**: root-level `.base` files (`Main.base`, `Blog.base`, `Customers.base`, `OKRs.base`) — query views, not notes. **Ignore them when inventorying or searching content.**
- **Resources naming**: prefix indicates area — `signoz-*`, `homelab-*`, `dev-*`, `youtube-*`; no prefix = general reference
- **Frontmatter**: every note has `name:`; tags are only used in `Blog/` notes (YAML list, e.g. `tags:\n  - go\n  - k8s`)
- **When to search the vault**: before answering questions about my stack, homelab, projects, or workflows
- **How to search**: use the `obsidian` CLI (at `/usr/local/bin/obsidian`), not grep
  - Full-text search: `obsidian search query="<term>"`
  - Search with context: `obsidian search:context query="<term>"`
  - Find notes by tag: `obsidian tag name=<tag> verbose`
  - List all tags: `obsidian tags`
  - List files: `obsidian files`
  - **The Obsidian app must be running** for the CLI to respond. If a command fails, check `pgrep -x Obsidian` before assuming the CLI is broken — report which it is, don't silently fall back to `rg`.
- **Task state lives in doit** (not Obsidian); `Reviews/weekly-YYYY-MM-DD.md` holds weekly reviews

## Sub-agents
- For live/interactive k8s debugging, handle directly rather than delegating to the `kate` sub-agent (too slow for active troubleshooting).
- Use sub-agents only for planning/documentation tasks like migration guides.
- **One named agent goes in its own herdr pane. Two or more at once stay inline.** A pane is visible, steerable, and outlives the turn. Inline subagents return clean structured results and fan out cheaply. Parallel panes lose on both counts: they carve up the screen and force terminal scraping.
- Paned agents carry their persona with `--agent <name>` and need `--permission-mode acceptEdits`, or they stall on approval prompts. Both go after `--`:
  `herdr agent start mike --kind claude --pane <id> -- --agent mike --permission-mode acceptEdits`
- Claude Code renders on the alternate screen, so a paned agent's long output scrolls beyond `herdr agent read` and raising `--lines` will not recover it. If a paned agent is expected to produce a long deliverable, tell it up front to write the full response to a markdown file and reply with only the path.
- `herdr agent read` returns plain text, not JSON. Close panes you created by explicit id, never `herdr pane close --current`.

## Commits
- Never run `git commit` or `git push` without explicit user confirmation. Stage changes and summarize, then wait.

## Environment Variables
- doit is accessed via the `mcp__doit__*` MCP tools — no API key needed.
- Check for required env vars at the start of any skill that calls external APIs (non-MCP).

## Knowledge Base
Maintain the log at: `~/Obsidian/wiki/Logs/{date}.md`. Date format is `YYYY-MM-DD`. High bar, not a session transcript — most sessions should end with nothing logged.

**Default is: don't log.** Only write an entry when ALL of these hold:
- Root cause was non-obvious and cost real investigation (>30 min of actual debugging, not just a long session)
- Future-me would burn that time again without the note
- It isn't recoverable from the code, config, git history, or upstream docs

**Never log:** setup or install steps, tool configuration that already lives in a config file, "how I wired X up" walkthroughs, anything re-derivable by reading the file just edited, typos, one-offs.

**Logs/ only.** Do not create notes in `Resources/` or elsewhere in the vault unless explicitly asked. No new docs as a side effect of finishing a task.

Borderline? Ask "worth logging?" instead of writing.

**Format:**
```
---
name: <short descriptive title>
type: fix | note | session
---
# YYYY-MM-DD | <component> | <title>
Problem: ...
Fix: ...
Why: root cause if known
```

After logging, confirm with "📝 Logged to history in obsidian".
At session start, surface any fixes or relevant entries to the current task from the vault
