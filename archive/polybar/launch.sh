#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
~/dotfiles/polybar/scripts/weather.py
polybar -q -c $HOME/dotfiles/polybar/config main &
