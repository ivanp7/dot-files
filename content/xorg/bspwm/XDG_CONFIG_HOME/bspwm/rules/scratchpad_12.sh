#!/bin/sh

if [ -z "$SCRATCHPAD12_RECTANGLE" ]
then
    [ "$SCRATCHPAD12_WIDTH" ] && export WIDTH=$SCRATCHPAD12_WIDTH || export WIDTH=
    [ "$SCRATCHPAD12_HEIGHT" ] && export HEIGHT=$SCRATCHPAD12_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD12_X" ] && export X=$SCRATCHPAD12_X || export X=
    [ "$SCRATCHPAD12_Y" ] && export Y=$SCRATCHPAD12_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD12_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

