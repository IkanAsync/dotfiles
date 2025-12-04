#!/bin/bash
if pgrep -x waybar >/dev/null; then
  pkill -x waybar
  sleep 0.2
fi

waybar -c ~/.config/waybar/configs/\[TOP\]\ Everforest  -s ~/.config/waybar/style/\[Dark\]\ Purpl.css &
