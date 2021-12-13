#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_CALENDAR:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show
tabbed-calendar.sh

