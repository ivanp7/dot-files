#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_MPV:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-mpv.sh "$@"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

