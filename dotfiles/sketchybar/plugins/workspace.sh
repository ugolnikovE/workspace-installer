#!/bin/sh
FOCUSED="$(aerospace list-workspaces --focused)"
SPACE_ID="${NAME##*.}"

if [ "$SPACE_ID" = "$FOCUSED" ]; then
  sketchybar --set "$NAME" background.color=0x40ffffff background.drawing=on
else
  sketchybar --set "$NAME" background.color=0x00ffffff background.drawing=off
fi
