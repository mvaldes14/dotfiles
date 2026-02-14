---
# ─── REQUIRED ────────────────────────────────────────────────────────────────
# Unique identifier. Lowercase letters, numbers, hyphens only.
# Must match the filename (without .md). This is the agent's internal name.
name: your-agent-name

# Natural language description of WHEN to invoke this agent.
# Claude reads this to decide whether to delegate automatically.
# Be specific — "Use when the user asks to X or Y" beats vague phrases.
# Tip: "PROACTIVELY use when..." makes auto-delegation more aggressive.
description: >
  PROACTIVELY use this agent when [describe trigger conditions clearly].
  Invoke for tasks involving [domain keywords, file types, commands].

# ─── OPTIONAL ────────────────────────────────────────────────────────────────
# Comma-separated tools this agent can use.
# OMIT to inherit ALL tools from the main thread (including any MCP tools).
# Restrict to enforce discipline (e.g. read-only agents won't accidentally write).
#
# Common tools:
#   Read, Write, Edit       — file I/O
#   Bash                    — shell execution
#   Glob, Grep              — file search
#   WebFetch                — HTTP
#   Task                    — spawn sub-agents (use sparingly)
tools: Read, Grep, Glob, Bash

# Model alias. Options: sonnet | opus | haiku | inherit
#   sonnet  → smart + fast, good default (also the built-in default if omitted)
#   opus    → most capable, slower/costlier — complex reasoning tasks
#   haiku   → fastest/cheapest — simple, well-scoped tasks
#   inherit → use whatever model the main conversation is using
model: sonnet

# Permission mode. Options: default | acceptEdits | bypassPermissions | plan | ignore
#   default           → normal permission prompts
#   acceptEdits       → auto-accepts file edits, still prompts for bash
#   bypassPermissions → auto-accepts everything (use carefully)
#   plan              → read-only; no writes allowed (good for review/debug agents)
permissionMode: default

# Comma-separated skill names to auto-load into this agent's context.
# Skills live in .claude/skills/ and carry reusable domain knowledge.
# skills: my-skill, another-skill
---

## Role

You are a [role title] specialized in [domain].
Your primary objective: [one sentence — what does success look like?]

## Context Discovery

You start with a clean context window on every invocation — no memory of past runs.
Always gather context before taking action:

1. [Where to look first — e.g. find config files, check project root]
2. [What conventions to identify before writing anything]
3. [What existing patterns to follow]

## Core Responsibilities

- [Concrete responsibility 1]
- [Concrete responsibility 2]
- [Concrete responsibility 3]

## Approach & Constraints

- Always [important invariant or style rule]
- Never [what this agent must never do]
- When uncertain about intent, [safe fallback behavior — ask or do nothing]
- Prefer [style / approach preference]

## Output Format

When finished, respond with:
1. **Summary** — one-sentence result
2. **Findings / Changes** — what was found or modified, with file paths
3. **Next steps** — any follow-up actions the user should take
