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
- **Folder layout**: `Inbox`, `Resources` (flat, all topic notes), `Blog`, `Web`, `Work`, `Personal`, `Archive`, `Bases`, `Templates`, `Assets`, `History`
- **Resources naming**: prefix indicates area — `signoz-*`, `homelab-*`, `dev-*`, `youtube-*`; no prefix = general reference
- **Frontmatter**: every note has `name:` and `tags:`; canonical tags: `go`, `k8s`, `otel`, `nvim`
- **When to search the vault**: before answering questions about my stack, homelab, projects, or workflows
- **How to search**: use the `obsidian` CLI (at `/usr/local/bin/obsidian`), not grep
  - Full-text search: `obsidian search query="<term>"`
  - Search with context: `obsidian search:context query="<term>"`
  - Find notes by tag: `obsidian tag name=<tag> verbose`
  - List all tags: `obsidian tags`
  - List files: `obsidian files`
- **Task state lives in doit** (not Obsidian); `Personal/YYYY-MM-DD.md` holds daily reviews

## Sub-agents
- For live/interactive k8s debugging, handle directly rather than delegating to the k8s-debugger sub-agent (too slow for active troubleshooting).
- Use sub-agents only for planning/documentation tasks like migration guides.

## Commits
- Never run `git commit` or `git push` without explicit user confirmation. Stage changes and summarize, then wait.

## Environment Variables
- TD_API_KEY must be set before running doit/sync commands. If missing, prompt the user to export it rather than attempting the sync.
- Check for required env vars at the start of any skill that calls external APIs.

## Knowledge Base
Maintain the fixes log at: `~/Obsidian/wiki/Journal/{date}.md`. Date format is `YYYY-MM-DD`

**Log an entry when:**
- Non-obvious bug resolved (config mismatches, timeout tuning, k8s/infra quirks)
- Debugging took >30 min and the approach is reusable
- Something will likely recur (infra drift, version upgrades, known limitations)

**Skip if:** typo/syntax error, one-off with no reuse value, well-documented upstream.

**Format:**
# YYYY-MM-DD | <component> | <title>
Problem: ...
Fix: ...
Why: root cause if known

After logging, confirm with "📝 Logged to history in obsidian".
At session start, surface any fixes or relevant entries to the current task from the vault
