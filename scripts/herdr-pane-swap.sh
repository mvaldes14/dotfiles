#!/usr/bin/env bash
# Swap the focused pane with the previous/next pane in layout order, wrapping
# around. Orientation-agnostic, unlike `herdr pane swap --direction`.
# tmux equivalent: prefix + { (swap-pane -U) and prefix + } (swap-pane -D)
#
# Usage: herdr-pane-swap.sh prev|next [pane_id]
set -euo pipefail

case "${1:-}" in
  prev | next) step="$1" ;;
  *)
    echo "usage: $(basename "$0") prev|next [pane_id]" >&2
    exit 2
    ;;
esac

# Optional pane id argument, mostly for testing; keybindings use the focused pane.
if [ $# -gt 1 ]; then
  layout=$(herdr pane layout --pane "$2")
  cur="$2"
else
  layout=$(herdr pane layout --current)
  cur=$(printf '%s' "$layout" | jq -r '.result.layout.focused_pane_id')
fi

count=$(printf '%s' "$layout" | jq -r '.result.layout.panes | length')
[ "$count" -lt 2 ] && exit 0

read -r source target < <(printf '%s' "$layout" | jq -r --arg step "$step" --arg cur "$cur" '
  .result.layout as $l
  | ($l.panes | sort_by(.rect.y, .rect.x) | map(.pane_id)) as $ids
  | ($ids | index($cur)) as $i
  | (if $step == "next" then $i + 1 else $i - 1 end) as $j
  | "\($ids[$i]) \($ids[($j % ($ids | length) + ($ids | length)) % ($ids | length)])"')

herdr pane swap --source-pane "$source" --target-pane "$target" >/dev/null
