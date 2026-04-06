#!/bin/sh
DEVICE="$(system_profiler SPBluetoothDataType 2>/dev/null \
  | sed -n '/^      Connected:/,/^      Not Connected:/p' \
  | sed -n '2p' | sed 's/^ *//; s/:$//')"

if [ -n "$DEVICE" ]; then
  sketchybar --set "$NAME" icon="󰋋" label="" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi
