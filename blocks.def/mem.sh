#!/bin/sh 

printf "\x0c  \x0b"
printf "\x0b %s\x0b" $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)
