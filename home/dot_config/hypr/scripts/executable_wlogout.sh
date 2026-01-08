#!/usr/bin/env bash
A_1080=1700
B_1080=1700
L_1080=3000
R_1080=3000

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Detect monitor resolution and scaling factor
resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')
wlogout -C $HOME/.config/wlogout/nova.css -l $HOME/.config/wlogout/layout \
    --protocol layer-shell -b 4 \
    -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") \
    -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") \
    -L $(awk "BEGIN {printf \"%.0f\", $L_1080 * 1080 * $hypr_scale / $resolution}") \
    -R $(awk "BEGIN {printf \"%.0f\", $R_1080 * 1080 * $hypr_scale / $resolution}") \
    &