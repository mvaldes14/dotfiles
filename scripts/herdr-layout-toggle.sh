#!/usr/bin/env bash
# Toggle the focused tab's split orientation between side-by-side and stacked.
# Herdr has no next-layout action, so rebuild the layout with `herdr pane move`.
# tmux equivalent: prefix + space (select-layout next)
set -euo pipefail

# Optional pane id argument, mostly for testing; keybindings use the focused pane.
if [ $# -gt 0 ]; then
  layout=$(herdr pane layout --pane "$1")
else
  layout=$(herdr pane layout --current)
fi

count=$(printf '%s' "$layout" | jq -r '.result.layout.panes | length')
[ "$count" -lt 2 ] && exit 0

# Root split direction, falling back to the geometry of the first two panes.
dir=$(printf '%s' "$layout" | jq -r '
  .result.layout as $l
  | ($l.splits[] | select(.id | endswith("root")) | .direction)
    // ($l.splits[0].direction)
    // (if ($l.panes | sort_by(.rect.y, .rect.x) | .[0].rect.y)
          == ($l.panes | sort_by(.rect.y, .rect.x) | .[1].rect.y)
        then "right" else "down" end)')

case "$dir" in
  down | up) new_dir=right ;;
  right | left) new_dir=down ;;
  *) exit 0 ;;
esac

tab=$(printf '%s' "$layout" | jq -r '.result.layout.tab_id')

panes=()
while IFS= read -r id; do
  panes+=("$id")
done < <(printf '%s' "$layout" | jq -r '.result.layout.panes | sort_by(.rect.y, .rect.x) | .[].pane_id')

# Chain each pane onto the previous one in the new direction, sizing every split
# so the panes end up evenly divided. `pane move` refuses intra-tab moves
# (reason: same_tab), so each pane is parked in a scratch tab first; that tab
# disappears on its own once the pane moves back. --no-focus keeps focus put.
prev="${panes[0]}"
i=1
while [ "$i" -lt "$count" ]; do
  ratio=$(awk -v n="$((count - i + 1))" 'BEGIN { printf "%.4f", 1 / n }')
  herdr pane move "${panes[$i]}" --new-tab --label __layout_toggle --no-focus >/dev/null
  herdr pane move "${panes[$i]}" \
    --tab "$tab" \
    --target-pane "$prev" \
    --split "$new_dir" \
    --ratio "$ratio" \
    --no-focus >/dev/null
  prev="${panes[$i]}"
  i=$((i + 1))
done
