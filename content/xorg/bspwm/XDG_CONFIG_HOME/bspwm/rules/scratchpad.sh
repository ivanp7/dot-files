#!/bin/sh

WINDOW_ID="$1"
INSTANCE_NAME="$2"
shift 2

if [ -z "$RECTANGLE" ]
then
    MONITOR_AREA="$(bspwm-monitor-info.sh area)"
    MONITOR_WIDTH="${MONITOR_AREA%% *}"
    MONITOR_AREA="${MONITOR_AREA#* }"
    MONITOR_HEIGHT="${MONITOR_AREA%% *}"
    MONITOR_AREA="${MONITOR_AREA#* }"
    MONITOR_X="${MONITOR_AREA%% *}"
    MONITOR_Y="${MONITOR_AREA#* }"

    : ${WIDTH:=$(($MONITOR_WIDTH * 3 / 4))}
    : ${HEIGHT:=$(($MONITOR_HEIGHT * 3 / 4))}

    : ${X:=$(($MONITOR_X + ($MONITOR_WIDTH - $WIDTH) / 2))}
    [ "$X" -lt 0 ] && X=$(($MONITOR_X + $MONITOR_WIDTH - $WIDTH + $X))

    : ${Y:=$(($MONITOR_Y + ($MONITOR_HEIGHT - $HEIGHT) / 2))}
    [ "$Y" -lt 0 ] && Y=$(($MONITOR_Y + $MONITOR_HEIGHT - $HEIGHT + $Y))

    RECTANGLE="${WIDTH}x${HEIGHT}+${X}+${Y}"
fi

echo "state=floating sticky=on locked=on rectangle=$RECTANGLE"

