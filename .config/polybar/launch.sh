#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=$m polybar -q -c $HOME/git/dotfiles/polybar/config.ini main &
done
