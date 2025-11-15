#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the three bars with config path
polybar leftbar --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar-left.log & disown
polybar centerbar --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar-center.log & disown
polybar rightbar --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar-right.log & disown

echo "Polybars launched..."
