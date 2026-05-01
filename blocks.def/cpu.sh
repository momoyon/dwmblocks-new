#!/bin/sh

cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

printf " CPU "
printf " $cpu_val"
