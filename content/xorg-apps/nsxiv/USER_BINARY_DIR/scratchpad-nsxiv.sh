#!/bin/sh

: ${SCRATCHPAD:=${SCRATCHPAD_NSXIV:-0}}
export TABBED_CLASS="scratchpad_$SCRATCHPAD"
bspwm-scratchpad.sh "scratchpad_$SCRATCHPAD" show
tabbed-nsxiv.sh "$@"

