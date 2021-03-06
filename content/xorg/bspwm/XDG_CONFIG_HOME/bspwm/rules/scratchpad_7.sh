#!/bin/sh

if [ -z "$SCRATCHPAD7_RECTANGLE" ]
then
    [ "$SCRATCHPAD7_WIDTH" ] && export WIDTH=$SCRATCHPAD7_WIDTH || export WIDTH=
    [ "$SCRATCHPAD7_HEIGHT" ] && export HEIGHT=$SCRATCHPAD7_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD7_X" ] && export X=$SCRATCHPAD7_X || export X=
    [ "$SCRATCHPAD7_Y" ] && export Y=$SCRATCHPAD7_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD7_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

