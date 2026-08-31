@~/.claude/AGENTS.md

# Claude Code specifics

Everything harness-agnostic lives in `AGENTS.md` (imported above). This file only
holds things that depend on Claude Code + herdr.

## Sub-agents (herdr panes)
- The named agents live in `ai/claude/agents/*.md` (`kate`, `mike`, `gomez`, `pandey`, `rachel`).
- **One named agent goes in its own herdr pane. Two or more at once stay inline.** A pane is visible, steerable, and outlives the turn. Inline subagents return clean structured results and fan out cheaply. Parallel panes lose on both counts: they carve up the screen and force terminal scraping.
- Paned agents carry their persona with `--agent <name>` and need `--permission-mode acceptEdits`, or they stall on approval prompts. Both go after `--`:
  `herdr agent start mike --kind claude --pane <id> -- --agent mike --permission-mode acceptEdits`
- Claude Code renders on the alternate screen, so a paned agent's long output scrolls beyond `herdr agent read` and raising `--lines` will not recover it. If a paned agent is expected to produce a long deliverable, tell it up front to write the full response to a markdown file and reply with only the path.
- `herdr agent read` returns plain text, not JSON. Close panes you created by explicit id, never `herdr pane close --current`.

## Tools
- doit is accessed via the `mcp__doit__*` MCP tools — no API key needed.
