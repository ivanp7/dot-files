#!/bin/sh

if [ -z "$SCRATCHPAD4_RECTANGLE" ]
then
    [ "$SCRATCHPAD4_WIDTH" ] && export WIDTH=$SCRATCHPAD4_WIDTH || export WIDTH=
    [ "$SCRATCHPAD4_HEIGHT" ] && export HEIGHT=$SCRATCHPAD4_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD4_X" ] && export X=$SCRATCHPAD4_X || export X=
    [ "$SCRATCHPAD4_Y" ] && export Y=$SCRATCHPAD4_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD4_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

