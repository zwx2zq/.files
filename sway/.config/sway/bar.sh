#!/bin/sh

DATE=$(date +"%Y-%m-%d %R")

VOLUME=$(pactl get-sink-volume \@DEFAULT_SINK@ | head -n1 | awk '{print $5}')

BRIGHTNESS_VALUE=$(brightnessctl get)

BATTERY_LEVEL=$(upower -i /org/freedesktop/UPower/devices/battery_macsmc_battery | grep -e percentage | awk '{print $2}')
BATTERY_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_macsmc_battery | grep -e state | awk '{print $2}')

echo B: "$(($BRIGHTNESS_VALUE / 5))%" "|" V: $VOLUME "|" C: $BATTERY_LEVEL "($BATTERY_STATE)" "|" $DATE
