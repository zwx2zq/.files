#!/bin/sh

DATE=$(date +"%Y-%m-%d %R")

VOLUME=$(pactl get-sink-volume \@DEFAULT_SINK@ | head -n1 | awk '{print $5}')

BRIGHTNESS_VALUE=$(brightnessctl get)

echo "$(($BRIGHTNESS_VALUE / 5))%" "|" $VOLUME "|" $DATE
