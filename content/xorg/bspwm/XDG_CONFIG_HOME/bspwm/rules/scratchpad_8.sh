#!/bin/sh

if [ -z "$SCRATCHPAD8_RECTANGLE" ]
then
    [ "$SCRATCHPAD8_WIDTH" ] && export WIDTH=$SCRATCHPAD8_WIDTH || export WIDTH=
    [ "$SCRATCHPAD8_HEIGHT" ] && export HEIGHT=$SCRATCHPAD8_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD8_X" ] && export X=$SCRATCHPAD8_X || export X=
    [ "$SCRATCHPAD8_Y" ] && export Y=$SCRATCHPAD8_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD8_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

