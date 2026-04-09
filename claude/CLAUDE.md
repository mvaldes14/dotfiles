# Global Claude Context
## Who I Am
DevOps/infrastructure engineer focused on observability and coding. I work across AWS/GCP mostly, owner of a homelab running in k3s.
Develop main on a mac but also use windows wsl2.

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

## ClickHouse Context
- Running SigNoz’s ClickHouse schema
- Known issues: MEMORY_LIMIT_EXCEEDED errors, stuck merges, background merge pool tuning
- Familiar with: system.merges, system.metrics, MergeTree internals, thread pool settings

## OTel Collector Context
- Use both standalone collectors and OTel Operator (OpAMP-managed)
- Known gotcha: env var syntax differences — Kubernetes-style `$(VAR)` vs OTel-style `${env:VAR}`
- Prometheus scrape binding issues (0.0.0.0 vs localhost)
- OpAMP config override behavior

## Homelab (eva01/2/3/4)
- k3s multi node cluster
- FluxCD for GitOps
- Traefik ingress
- Running: Grafana, Signoz, Hashicorp Vault, Victoriametrics, Umami, Paperless-ngx, shlink, nocodb, home assistant, etc/

## Dev Environment
- **Mac**: Mac M5 and M4 Pro (primary)
- **Also**: WSL/NixOS, work laptop
- Dev environments using a mix of brew, devbox(nix)
- Shell tooling: fd, fzf, standard CLI-first setup

## Note-taking / Task Management
- **Obsidian**: primary notes + projects and knowledge management
- **Vault path**: `/Users/mvaldes/Obsidian/wiki`
- **Folder layout**: `Inbox`, `Resources` (flat, all topic notes), `Blog`, `Web`, `Work`, `Personal`, `Archive`, `Bases`, `Templates`, `Assets`
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

## Current Focus Areas
1. SigNoz production deployments — hardening and tuning
2. ClickHouse operational stability — merge health, memory pressure
3. OTel gateway reliability — health checks, BackendConfig
4. Claude Code agent templates and portable config
