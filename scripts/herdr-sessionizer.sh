#!/usr/bin/env bash

# herdr port of tmux-sessionizer.sh.
# Concept mapping: tmux session -> herdr workspace.
# Picks a project dir, then focuses its workspace if one already exists
# (matched by label) or creates a new workspace rooted at that dir.
# Requires a running herdr server (it drives the socket API via `herdr`).

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(find ~/git -maxdepth 3 -type d | fzf --no-preview)
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

if ! command -v jq >/dev/null 2>&1; then
    echo "herdr-sessionizer: jq is required" >&2
    exit 1
fi

selected_name=$(basename "$selected" | tr . _)

# Match an existing workspace by label (workspaces are keyed by opaque id).
existing_id=$(herdr workspace list 2>/dev/null \
    | jq -r --arg name "$selected_name" \
        'first(.result.workspaces[] | select(.label == $name) | .workspace_id) // empty')

if [[ -n "$existing_id" ]]; then
    herdr workspace focus "$existing_id"
else
    herdr workspace create --cwd "$selected" --label "$selected_name" --focus
fi
