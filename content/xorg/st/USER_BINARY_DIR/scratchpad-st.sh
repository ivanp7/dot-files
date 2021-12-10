#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_ST:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-st.sh "$@"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

