#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_SURF:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-surf.sh "$@"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

