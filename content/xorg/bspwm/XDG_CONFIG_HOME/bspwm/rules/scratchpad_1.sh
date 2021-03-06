#!/bin/sh

if [ -z "$SCRATCHPAD1_RECTANGLE" ]
then
    [ "$SCRATCHPAD1_WIDTH" ] && export WIDTH=$SCRATCHPAD1_WIDTH || export WIDTH=
    [ "$SCRATCHPAD1_HEIGHT" ] && export HEIGHT=$SCRATCHPAD1_HEIGHT || export HEIGHT=
    [ "$SCRATCHPAD1_X" ] && export X=$SCRATCHPAD1_X || export X=
    [ "$SCRATCHPAD1_Y" ] && export Y=$SCRATCHPAD1_Y || export Y=
else
    export RECTANGLE="$SCRATCHPAD1_RECTANGLE"
fi

"$(dirname "$0")/scratchpad.sh" "$@"

