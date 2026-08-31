# Global Agent Context

Harness-agnostic instructions. Symlinked into every agent that reads a global
context file:
- Claude Code — `~/.claude/AGENTS.md` (imported by `~/.claude/CLAUDE.md`)
- Codex — `~/.codex/AGENTS.md`
- pi — `~/.pi/agent/AGENTS.md`
- opencode — `~/.config/opencode/AGENTS.md` (not otherwise wired up yet)

Keep anything tool-specific out of this file — it belongs in the per-harness overlay.

## Who I Am
- DevOps/infrastructure engineer focused on observability and coding.
- I work across AWS/GCP mostly, owner of a homelab running in k3s.
- Develop mainly on a mac but also use Windows WSL2.

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
- **doit** is a task manager exposed over MCP. Exact tool names vary by harness; check the
  available MCP tools for the `doit` server. No API key needed.

## Delegating to sub-agents
- For live/interactive k8s debugging, handle it directly — sub-agents are too slow for active troubleshooting.
- Use sub-agents only for planning/documentation tasks like migration guides.
- Long deliverables from a sub-agent: have it write the full output to a markdown file and reply with only the path.

## Commits
- Never run `git commit` or `git push` without explicit user confirmation. Stage changes and summarize, then wait.

## Environment Variables
- Check for required env vars at the start of any skill/command that calls external APIs (non-MCP).

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
At session start, surface any fixes or relevant entries to the current task from the vault.
