#!/usr/bin/env bash

# herdr port of tmux-sessionkiller.sh.
# Concept mapping: tmux session -> herdr workspace.
# Picks a workspace (by label), switches focus away from it, then closes it.
# Requires a running herdr server (it drives the socket API via `herdr`).

if ! command -v jq >/dev/null 2>&1; then
    echo "herdr-sessionkiller: jq is required" >&2
    exit 1
fi

workspaces=$(herdr workspace list 2>/dev/null | jq -r '.result.workspaces[] | "\(.workspace_id)\t\(.label)"')

if [[ -z "$workspaces" ]]; then
    exit 0
fi

if [[ $# -eq 1 ]]; then
    # Accept either a workspace id (w1) or a label.
    selected=$(awk -F'\t' -v arg="$1" '$1 == arg || $2 == arg { print $1; exit }' <<<"$workspaces")
else
    selected=$(fzf --no-preview --with-nth=2 --delimiter='\t' <<<"$workspaces" | cut -f1)
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

# Move focus off the workspace we're about to close: prefer one labeled "main",
# otherwise any other live workspace.
others=$(awk -F'\t' -v skip="$selected" '$1 != skip' <<<"$workspaces")
fallback=$(awk -F'\t' '$2 == "main" { print $1; exit }' <<<"$others")
if [[ -z "$fallback" ]]; then
    fallback=$(head -n1 <<<"$others" | cut -f1)
fi

if [[ -n "$fallback" ]]; then
    herdr workspace focus "$fallback" >/dev/null
fi

herdr workspace close "$selected"
