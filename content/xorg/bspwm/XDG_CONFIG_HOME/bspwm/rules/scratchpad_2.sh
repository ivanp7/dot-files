#!/bin/sh

if [ -z "$SCRATCHPAD2_RECTANGLE" ]
then
    [ "$SCRATCHPAD2_WIDTH" ] && export WIDTH=$SCRATCHPAD2_WIDTH || export WIDTH=
    [ "$SCRATCHPAD2_HEIGHT" ] && export HEIGHT=$SCRATCHPAD2_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD2_X" ] && export X=$SCRATCHPAD2_X || export X=
    [ "$SCRATCHPAD2_Y" ] && export Y=$SCRATCHPAD2_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD2_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

