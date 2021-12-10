#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_CLOCK:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-clock.sh
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

