#!/bin/sh

if [ -z "$SCRATCHPAD6_RECTANGLE" ]
then
    [ "$SCRATCHPAD6_WIDTH" ] && export WIDTH=$SCRATCHPAD6_WIDTH || export WIDTH=
    [ "$SCRATCHPAD6_HEIGHT" ] && export HEIGHT=$SCRATCHPAD6_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD6_X" ] && export X=$SCRATCHPAD6_X || export X=
    [ "$SCRATCHPAD6_Y" ] && export Y=$SCRATCHPAD6_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD6_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

