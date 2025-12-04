#!/bin/bash

# Lokasi wallpaper
WALLPAPER="$HOME/Pictures/wallpaperflare.com_wallpaper.jpg"

# Matikan swaybg yang berjalan sebelumnya (kalau ada)
pkill swaybg

# Jalankan swaybg dengan wallpaper dan mode fill
swaybg -i "$WALLPAPER" -m fill &
