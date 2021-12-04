#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_SURF:=5}}
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show
TABBED_XID="$(cat "$SCRATCHPAD_DIR/$SCRATCHPAD" 2> /dev/null)" exec tabbed-surf.sh "$@"

