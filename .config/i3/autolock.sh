#!/bin/bash

pkill xidlehook

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook --detect-sleep \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 300 'light -S 10' 'light -I' \
  --timer 10 'betterlockscreen -l dim' ''\
  --timer 1200 'systemctl suspend' '' \
    &

