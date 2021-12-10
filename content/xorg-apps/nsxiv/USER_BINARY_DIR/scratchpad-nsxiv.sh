#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_NSXIV:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
tabbed-nsxiv.sh "$@"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show

