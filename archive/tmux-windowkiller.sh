#!/usr/bin/env bash

if [[ $1 == 'a' ]]; then
    tmux kill-window -a
    exit 0
elif [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$(tmux list-windows -F "#W" | fzf --no-preview)
fi

if [[ -z $selected ]]; then
    exit 0
fi

tmux kill-window -t "$selected"
