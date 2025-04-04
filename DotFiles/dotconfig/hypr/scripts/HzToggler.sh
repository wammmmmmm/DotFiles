#!/bin/bash

# Define your monitor you can get it by typing hyprctl monitor
MONITOR="eDP-1"


CURRENT_RATE=$(hyprctl monitors | grep "$MONITOR" | grep -o '[0-9.]*Hz' | sed 's/Hz//')


# Define your two refresh rates you want to toggle between
RATE1="165.00200"
RATE2="60.02"


if [ "$(echo $CURRENT_RATE | bc)" == "$(echo $RATE1 | bc)" ]; then
  hyprctl keyword monitor $MONITOR,1920x1200@$RATE2,auto,1
else
  hyprctl keyword monitor $MONITOR,1920x1200@$RATE1,auto,1
fi
