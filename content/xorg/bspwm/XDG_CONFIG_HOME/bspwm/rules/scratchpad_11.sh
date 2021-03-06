#!/bin/sh

if [ -z "$SCRATCHPAD11_RECTANGLE" ]
then
    [ "$SCRATCHPAD11_WIDTH" ] && export WIDTH=$SCRATCHPAD11_WIDTH || export WIDTH=
    [ "$SCRATCHPAD11_HEIGHT" ] && export HEIGHT=$SCRATCHPAD11_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD11_X" ] && export X=$SCRATCHPAD11_X || export X=
    [ "$SCRATCHPAD11_Y" ] && export Y=$SCRATCHPAD11_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD11_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

