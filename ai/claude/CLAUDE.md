@~/.claude/AGENTS.md

# Claude Code specifics

Everything harness-agnostic lives in `AGENTS.md` (imported above). This file only
holds things that depend on Claude Code.

## Sub-agents
- The named agents live in `ai/claude/agents/*.md` (`kate`, `mike`, `gomez`, `pandey`, `rachel`).

## Tools
- doit is accessed via the `mcp__doit__*` MCP tools — no API key needed.
