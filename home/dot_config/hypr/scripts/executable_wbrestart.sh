#!/bin/zsh

pkill -9 swaync
pkill -9 waybar
pkill -9 linux-wallpaperengine

swaync &
waybar &
linux-wallpaperengine 3504312917 --screen-root DP-1 &
