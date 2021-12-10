#!/bin/sh

WINDOW_ID="$1"
INSTANCE_NAME="$2"
shift 2

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
: ${Y:=$(($MONITOR_Y + ($MONITOR_HEIGHT - $HEIGHT) / 2))}

RECTANGLE="${WIDTH}x${HEIGHT}+${X}+${Y}"

echo "state=floating rectangle=$RECTANGLE" "$@"

