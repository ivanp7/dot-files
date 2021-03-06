#!/bin/sh

if [ -z "$SCRATCHPAD9_RECTANGLE" ]
then
    [ "$SCRATCHPAD9_WIDTH" ] && export WIDTH=$SCRATCHPAD9_WIDTH || export WIDTH=
    [ "$SCRATCHPAD9_HEIGHT" ] && export HEIGHT=$SCRATCHPAD9_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD9_X" ] && export X=$SCRATCHPAD9_X || export X=
    [ "$SCRATCHPAD9_Y" ] && export Y=$SCRATCHPAD9_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD9_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

