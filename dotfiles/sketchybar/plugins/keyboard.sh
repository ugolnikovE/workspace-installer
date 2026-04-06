#!/bin/sh

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null \
  | awk '/KeyboardLayout Name/{gsub(/[";]/, ""); print $NF}')

case "$LAYOUT" in
  ABC|U.S.*|US*|British*|Australian*|*English*)
    FLAG="en"
    ;;
  Russian*|RussianWin*)
    FLAG="ru"
    ;;
  *)
    FLAG="${LAYOUT:-?}"
    ;;
esac

sketchybar --set "$NAME" icon="$FLAG"
