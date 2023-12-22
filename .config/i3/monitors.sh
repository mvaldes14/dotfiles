#!/bin/bash

mode=$1
mon1=`xrandr --current | grep "DP-2 connected"`
mon2=`xrandr --current | grep "DP-1-2 connected"`

monitor_changer(){
  case $mode in
    laptop)
    xrandr --output eDP-1 --auto --primary
    xrandr --output DP-1-2 --off
    xrandr --output DP-2 --off
    notify-send "laptop mode launched"
    exit 0
      ;;

    docked)
    xrandr --output eDP-1 --off
    xrandr --output DP-2 --mode 3840x2160 --pos 0x0
    xrandr --output DP-1-2 --mode 3840x2160 --pos 3840x0
    notify-send "docked mode launched"
    exit 0
      ;;
esac
}

if [[ $# -eq 0 ]]; then
  notify-send "no arguments provided"
  exit 0
fi

if [[ $mode = "auto" ]]; then
   if [[ $mon1 ]] && [[ $mon2 ]]; then
     mode="docked"
     monitor_changer
   else
      mode="laptop"
      monitor_changer
   fi
fi

