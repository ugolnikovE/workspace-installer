#!/bin/sh
STATUS="$(ifconfig en0 2>/dev/null | awk '/status:/{print $2}')"

if [ "$STATUS" = "active" ]; then
  sketchybar --set "$NAME" icon="" label="wifi"
else
  sketchybar --set "$NAME" icon="" label="no wifi"
fi
