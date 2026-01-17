#!/bin/zsh

killall -9 swaync
killall -9 waybar
killall -9 linux-wallpaperengine

swaync &
waybar &
sleep 5 && linux-wallpaperengine 3504312917 --screen-root DP-1 --silent &
