#!/bin/sh

case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
  up)   printf "\x0c 󰤨 \x0b" ;;
  down) printf "\x0c 󰤭 \x0b" ;;
esac

ssid=$(nmcli -t -f active,ssid dev wifi | grep -E '^yes' | cut -d\' -f2 | sed 's/.*://g')
[ -z "$ssid" ] && ssid="Not Connected"

printf "\x0b %s \x0b" $ssid
