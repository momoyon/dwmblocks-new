#!/bin/sh

 if mpc status 2>/dev/null | grep -q "playing"; then
   printf "\x0c  \x0b"
   printf "\x0b %s \x0b" "$(mpc current 2>/dev/null)"
 fi

