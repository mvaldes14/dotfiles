#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$(tmux ls -F "#S" | fzf --no-preview)
fi

if [[ -z $selected ]]; then
    exit 0
fi

tmux switch-client -t main
tmux kill-session -t $selected

