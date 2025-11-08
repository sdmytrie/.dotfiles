#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if type "xrandr"; then
  for m in $(xrandr --query | grep -v " connected primary" | cut -d" " -f1); do
    echo $m
    [ $m == "HDMI-1-0" ] && SECONDARY="HDMI-1-0" polybar --reload bar2 &
  done
  for m in $(xrandr --query | grep " connected primary" | cut -d" " -f1); do
    echo $m
    MONITOR=$m polybar --reload bar1 &
  done
else
  polybar --reload bar2 &
  polybar --reload bar1 &
fi
#polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
