#!/bin/sh
TOTAL=$(sysctl -n hw.memsize)
PAGES_FREE=$(vm_stat | awk '/Pages free/{gsub(/\./,""); print $3}')
PAGES_INACTIVE=$(vm_stat | awk '/Pages inactive/{gsub(/\./,""); print $3}')
PAGES_SPECULATIVE=$(vm_stat | awk '/Pages speculative/{gsub(/\./,""); print $3}')

FREE=$(( (PAGES_FREE + PAGES_INACTIVE + PAGES_SPECULATIVE) * 4096 ))
USED=$(( TOTAL - FREE ))
PERCENT=$(( USED * 100 / TOTAL ))

sketchybar --set "$NAME" icon="" label="RAM ${PERCENT}%"
