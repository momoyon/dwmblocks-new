#!/bin/sh
 get_capacity="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage" | awk '{print $2}' | tr -d %)"
 printf "\x0c %s \x0b" $(battery_icon)
 printf " %s " $get_capacity
