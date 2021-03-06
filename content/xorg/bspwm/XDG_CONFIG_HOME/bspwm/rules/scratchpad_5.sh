#!/bin/sh

if [ -z "$SCRATCHPAD5_RECTANGLE" ]
then
    [ "$SCRATCHPAD5_WIDTH" ] && export WIDTH=$SCRATCHPAD5_WIDTH || export WIDTH=
    [ "$SCRATCHPAD5_HEIGHT" ] && export HEIGHT=$SCRATCHPAD5_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD5_X" ] && export X=$SCRATCHPAD5_X || export X=
    [ "$SCRATCHPAD5_Y" ] && export Y=$SCRATCHPAD5_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD5_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

