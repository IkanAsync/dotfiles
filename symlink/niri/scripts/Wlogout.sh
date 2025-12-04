#!/bin/bash
# Resolution-aware wlogout launcher for Niri

# Vars
A_2160=600
B_2160=600
A_1600=400
B_1600=400
A_1440=400
B_1440=400
A_1080=200
B_1080=200
A_720=50
B_720=50

# Kill if already running
if pgrep -x "wlogout" >/dev/null; then
  pkill -x "wlogout"
  exit 0
fi

# Get resolution (focused output)
resolution=$(wayland-info \
  | grep logical_width \
  | head -n 1 \
  | sed -E 's/.*logical_width: ([0-9]+),.*/\1/')

# Fallback if detection fails
if [ -z "$resolution" ]; then
  echo "Gagal deteksi resolusi, menjalankan default"
  wlogout &
  exit 0
fi

# Default scale = 1.0 (karena Niri belum expose scale API)
scale=1.0

# Convert parameter sesuai resolusi
if ((resolution >= 2160)); then
  T_val=$(awk "BEGIN {printf \"%.0f\", $A_2160 * 2160 * $scale / $resolution}")
  B_val=$(awk "BEGIN {printf \"%.0f\", $B_2160 * 2160 * $scale / $resolution}")
elif ((resolution >= 1600)); then
  T_val=$(awk "BEGIN {printf \"%.0f\", $A_1600 * 1600 * $scale / $resolution}")
  B_val=$(awk "BEGIN {printf \"%.0f\", $B_1600 * 1600 * $scale / $resolution}")
elif ((resolution >= 1440)); then
  T_val=$(awk "BEGIN {printf \"%.0f\", $A_1440 * 1440 * $scale / $resolution}")
  B_val=$(awk "BEGIN {printf \"%.0f\", $B_1440 * 1440 * $scale / $resolution}")
elif ((resolution >= 1080)); then
  T_val=$(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $scale / $resolution}")
  B_val=$(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $scale / $resolution}")
elif ((resolution >= 720)); then
  T_val=$(awk "BEGIN {printf \"%.0f\", $A_720 * 720 * $scale / $resolution}")
  B_val=$(awk "BEGIN {printf \"%.0f\", $B_720 * 720 * $scale / $resolution}")
else
  wlogout &
  exit
fi

# Launch wlogout
wlogout --protocol layer-shell -b 6 -T $T_val -B $B_val &
