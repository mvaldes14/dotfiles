#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$(find ~/git -maxdepth 3 -type d | fzf --no-preview)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
   tmux new-window -n "$selected_name" -c "$selected" nvim
exit 0
fi

if ! tmux has-session -t $selected_name 2> /dev/null; then
   tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name

