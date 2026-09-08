# AI Agent Config

Shared configuration and reusable instructions for local AI coding agents.

## Layout

```text
ai/
├── bootstrap.sh              # Creates/updates symlinks into each agent home
├── README.md
├── shared/                   # Harness-agnostic content
│   ├── AGENTS.md             # Global preferences/context
│   └── skills/               # Agent Skills standard packages
│       └── <skill>/
│           └── SKILL.md
├── claude/                   # Claude Code-specific overlay
│   ├── CLAUDE.md             # Imports shared AGENTS.md + Claude/herdr rules
│   ├── agents/               # Claude Code subagents/personas
│   ├── settings.json         # Reference settings; not linked by bootstrap
│   └── *status_line.sh
└── pi/
    └── models.json           # Pi model/provider config
```

## Bootstrap

Run from anywhere:

```sh
~/git/dotfiles/ai/bootstrap.sh
```

The script is idempotent. It links only agent config that should be source-controlled and avoids auth/session/state files.

## Symlink map

| Source | Destination | Notes |
|---|---|---|
| `shared/AGENTS.md` | `~/.agents/AGENTS.md` | Shared global context for Pi-compatible/global agent path |
| `shared/AGENTS.md` | `~/.claude/AGENTS.md` | Imported by `~/.claude/CLAUDE.md` |
| `shared/AGENTS.md` | `~/.codex/AGENTS.md` | Codex global context |
| `shared/AGENTS.md` | `~/.pi/agent/AGENTS.md` | Pi agent context location |
| `shared/AGENTS.md` | `~/.config/opencode/AGENTS.md` | opencode global context |
| `shared/skills/<name>` | `~/.agents/skills/<name>` | Pi discovers `~/.agents/skills`; per-skill links allow third-party skills to coexist |
| `shared/skills/<name>` | `~/.claude/skills/<name>` | Claude Code skills |
| `shared/skills/<name>` | `~/.codex/skills/<name>` | Codex skills |
| `claude/CLAUDE.md` | `~/.claude/CLAUDE.md` | Claude Code-specific instructions |
| `claude/agents/<name>.md` | `~/.claude/agents/<name>.md` | Claude Code subagents |
| `pi/models.json` | `~/.pi/agent/models.json` | Pi model/provider config |

## What is intentionally not linked

- `~/.claude/settings.json`: machine/local settings can diverge; `claude/settings.json` is a reference copy.
- Auth, session, state, cache, history, and database files.
- Third-party installer-managed skills. The bootstrap script links shared skills per-skill so those can coexist.

## Guidelines

- Put reusable, harness-agnostic instructions in `shared/AGENTS.md`.
- Put task workflows in `shared/skills/<name>/SKILL.md` using the Agent Skills standard.
- Put harness-specific behavior in the matching harness directory (`claude/`, `pi/`, future `codex/`, `opencode/`).
- Keep one canonical source per file; deployed locations should be symlinks.
