#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_ZATHURA:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-zathura.sh "$@"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

