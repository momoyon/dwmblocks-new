#!/bin/sh

nettraf_update() {
    sum=0
    for arg; do
        read -r i < "$arg"
        sum=$(( sum + i ))
    done
    cache=/tmp/${1##*/}
    [ -f "$cache" ] && read -r old < "$cache" || old=0
    printf %d\\n "$sum" > "$cache"
    printf %d\\n $(( sum - old ))
}

rx=$(nettraf_update /sys/class/net/[ew]*/statistics/rx_bytes)
tx=$(nettraf_update /sys/class/net/[ew]*/statistics/tx_bytes)

printf "\x0c  \x0d%04sB/s \x0c  \x0d%04sB/s\\n\x0b" $(numfmt --to=iec $rx $tx)
