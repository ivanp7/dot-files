#!/bin/sh

if [ -z "$SCRATCHPAD0_RECTANGLE" ]
then
    [ "$SCRATCHPAD0_WIDTH" ] && export WIDTH=$SCRATCHPAD0_WIDTH || export WIDTH=
    [ "$SCRATCHPAD0_HEIGHT" ] && export HEIGHT=$SCRATCHPAD0_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD0_X" ] && export X=$SCRATCHPAD0_X || export X=
    [ "$SCRATCHPAD0_Y" ] && export Y=$SCRATCHPAD0_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD0_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

