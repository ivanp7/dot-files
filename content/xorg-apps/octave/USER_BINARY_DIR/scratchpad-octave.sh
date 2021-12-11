#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_OCTAVE:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-octave.sh
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

