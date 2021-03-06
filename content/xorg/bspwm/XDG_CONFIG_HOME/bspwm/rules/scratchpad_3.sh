#!/bin/sh

if [ -z "$SCRATCHPAD3_RECTANGLE" ]
then
    [ "$SCRATCHPAD3_WIDTH" ] && export WIDTH=$SCRATCHPAD3_WIDTH || export WIDTH=
    [ "$SCRATCHPAD3_HEIGHT" ] && export HEIGHT=$SCRATCHPAD3_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD3_X" ] && export X=$SCRATCHPAD3_X || export X=
    [ "$SCRATCHPAD3_Y" ] && export Y=$SCRATCHPAD3_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD3_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

