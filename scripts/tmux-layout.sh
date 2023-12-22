#!/bin/bash
selected=$(find ~/git -maxdepth 3 -type d | fzf --no-preview)
name=$(basename "$selected")

if [[ -z $selected ]]; then
    exit 0
fi

# Known Programs
case "$name" in
  *chef*)
    prog="kitchen list"
    ;;
  *ansible*)
    prog="ansible-lint"
    ;;
  *terraform*)
    prog="terraform plan"
    ;;
  *)
    prog=$1
    ;;
esac

tmux neww -c "$selected" -n "$name"
tmux splitw -h  -c "$selected"
tmux send-keys -t "$name" "$prog" "Enter"
