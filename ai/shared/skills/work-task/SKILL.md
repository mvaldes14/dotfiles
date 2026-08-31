---
description: Pick up a code-related doit task, load its Obsidian spec, dispatch a subagent to implement it in an isolated worktree, and open a PR for review. Use when the user says "work task <id or search>", "pick up that ticket", or points at a doit task to be implemented.
allowed-tools: mcp__doit__get_task, mcp__doit__list_tasks, mcp__doit__update_task, mcp__doit__update_subtask, mcp__doit__store_task_ai_result, Read, Write, Edit, Bash, Grep, Glob, WebFetch, Agent
---

Implement a doit task end-to-end: doit ticket → Obsidian spec → subagent → PR.

`$ARGUMENTS` is a doit task ID or a search string. If empty, ask which task.

The user's role in this loop is **reviewing the PR**, not babysitting the implementation. Get to a reviewable PR or a clear explanation of why you couldn't.

## Phase 1 — Resolve the task

- Task ID (UUID) → `mcp__doit__get_task`
- Anything else → `mcp__doit__list_tasks(search=...)`. One match, proceed. Several, list them and ask. None, say so and stop.

Keep the `id`, `title`, `description`, `subtasks[]` (with their IDs), `tags`, `links[]`.

## Phase 2 — Find and load the spec

The spec is an Obsidian note. Look in this order:

1. `links[]` on the task — an `obsidian://` URL or vault path
2. `description` — a `[[wikilink]]` or a `spec:` line
3. Failing both, search the vault for a note matching the task title

Use the `obsidian` CLI, not `rg`. `file=` resolves by name exactly like a wikilink, so a `[[spec-foo]]` in the description maps straight to `file="spec-foo"`:

```
obsidian read file="<spec-name>"              # load the spec
obsidian links file="<spec-name>"             # outgoing links, for the one-hop follow
obsidian search:context query="<title>" limit=5   # fallback discovery
obsidian search:context query="<component>" path=Logs   # prior fixes
```

**The Obsidian app must be running.** If a command fails, check `pgrep -x Obsidian` and report which problem it is rather than silently falling back to `rg`.

Read the spec, then `obsidian read` each note from `links` that looks relevant — one hop only, don't spider the vault. Fetch any `References` URLs with WebFetch. Search `Logs` for prior entries on the same component; past fixes are frequently the reason a task exists.

**If there is no spec note, stop and say so.** Do not infer a spec from a one-line task title. Offer to scaffold one from `Templates/code-spec.md` and let the user fill it in. A guessed spec produces a PR that wastes review time.

Pull `repo`, `base`, and `branch` from the spec's frontmatter. If `repo` is missing, ask — do not guess. Note that the session's working directory is the Obsidian vault, not the repo.

## Phase 3 — Preflight

Before dispatching, verify in the repo:

- the path exists and is a git repo
- `gh auth status` succeeds
- resolve the real default branch: `gh repo view --json defaultBranchRef -q .defaultBranchRef.name`
- the working tree state — you will branch from `base`, not from whatever is checked out

Set the task to `doing` via `mcp__doit__update_task`.

## Phase 4 — Dispatch

Route by content:

| Task | Agent |
|---|---|
| Go | `gomez` |
| Kubernetes, Flux, Helm, Traefik | `kate` |
| Needs a design decision first | `mike`, then an implementer |
| Everything else | `general-purpose` |

Pass `isolation: "worktree"` so the agent works on an isolated copy and never touches the user's checkout.

**The prompt must be self-contained.** Subagents start cold: they cannot read doit, they have no vault context, and `gomez`/`kate` have no MCP tools at all. Inline the full text of:

- the spec note
- relevant excerpts from linked notes and fetched references
- the subtask list as the implementation checklist
- the acceptance criteria, verbatim
- the verification commands
- the repo path, `base` branch, and branch name `task/<first-8-of-task-id>-<slug>`

Instruct the agent to: branch from `base`, implement, run the verification commands, commit with conventional-commit messages, and report back the worktree path, branch name, files changed, verification output, and a per-line pass/fail against the acceptance criteria. Tell it to commit but **not** to push.

## Phase 5 — Push and open the PR

Do this from the orchestrator, not the agent, so there is one enforcement point.

Guardrails, no exceptions:

- **Never push to the default branch.** Re-check the branch name against the value resolved in Phase 3.
- **Never merge**, and never enable auto-merge.
- If any acceptance criterion failed, open the PR as a **draft** and say which ones failed in the PR body and in chat.

The user has standing authorization for commit-and-push-to-a-branch and PR creation *within this skill* — that is the point of the workflow, and it overrides the global "confirm before commit/push" rule for this path only. Everything else about that rule still applies.

PR body: goal from the spec, acceptance criteria as a checklist with actual pass/fail, verification output, link back to the spec note, and the doit task ID.

## Phase 6 — Write back

- `mcp__doit__store_task_ai_result` — PR URL, summary of the change, anything the reviewer should look at first
- `mcp__doit__update_subtask(completed=true)` for each subtask the agent actually finished — not the ones it skipped
- Leave the task at `doing`. It becomes `done` when the PR merges, which is the user's call, not yours.
- Append to `~/Obsidian/wiki/Logs/<today>.md` only if the work clears the knowledge-base bar in CLAUDE.md (non-obvious bug, >30min debugging, likely to recur). Routine feature work does not. If you log, confirm with "📝 Logged to history in obsidian".

## Report

In chat, short: PR URL, what changed, acceptance criteria pass/fail, and anything you had to assume. Lead with anything that needs the user's judgment.
