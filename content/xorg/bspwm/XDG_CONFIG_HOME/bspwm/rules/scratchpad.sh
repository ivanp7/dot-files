#!/bin/sh

WINDOW_ID="$1"
INSTANCE_NAME="$2"
shift 2

if [ -z "$RECTANGLE" ]
then
    bspwm-monitor-info.sh area | read MONITOR_WIDTH MONITOR_HEIGHT MONITOR_X MONITOR_Y

    : ${WIDTH:=$(($MONITOR_WIDTH * 3 / 4))}
    : ${HEIGHT:=$(($MONITOR_HEIGHT * 3 / 4))}

    : ${X:=$(($MONITOR_X + ($MONITOR_WIDTH - $WIDTH) / 2))}
    [ "$X" -lt 0 ] && X=$(($MONITOR_X + $MONITOR_WIDTH - $WIDTH + $X))

    : ${Y:=$(($MONITOR_Y + ($MONITOR_HEIGHT - $HEIGHT) / 2))}
    [ "$Y" -lt 0 ] && Y=$(($MONITOR_Y + $MONITOR_HEIGHT - $HEIGHT + $Y))

    RECTANGLE="${WIDTH}x${HEIGHT}+${X}+${Y}"
fi

echo "$@" "sticky=on locked=on state=floating hidden=on rectangle=$RECTANGLE"

