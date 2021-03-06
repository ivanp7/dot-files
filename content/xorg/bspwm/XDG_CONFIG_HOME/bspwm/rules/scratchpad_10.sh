#!/bin/sh

if [ -z "$SCRATCHPAD10_RECTANGLE" ]
then
    [ "$SCRATCHPAD10_WIDTH" ] && export WIDTH=$SCRATCHPAD10_WIDTH || export WIDTH=
    [ "$SCRATCHPAD10_HEIGHT" ] && export HEIGHT=$SCRATCHPAD10_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD10_X" ] && export X=$SCRATCHPAD10_X || export X=
    [ "$SCRATCHPAD10_Y" ] && export Y=$SCRATCHPAD10_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD10_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

