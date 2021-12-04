#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_MPV:=1}}
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show
TABBED_XID="$(cat "$SCRATCHPAD_DIR/$SCRATCHPAD" 2> /dev/null)" exec tabbed-mpv.sh "$@"

