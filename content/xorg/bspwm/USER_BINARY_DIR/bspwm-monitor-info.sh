#!/bin/sh

INFO_TYPE="$1"
SELECTOR=$2
: ${SELECTOR:=primary}

MONITOR_JSON="$(bspc query -T -m $SELECTOR)"
MONITOR_NAME="$(echo "$MONITOR_JSON" | jq --raw-output ".name")"
MONITOR_RECTANGLE="$(echo "$MONITOR_JSON" | jq ".rectangle")"
MONITOR_X="$(echo "$MONITOR_RECTANGLE" | jq ".x")"
MONITOR_Y="$(echo "$MONITOR_RECTANGLE" | jq ".y")"
MONITOR_WIDTH="$(echo "$MONITOR_RECTANGLE" | jq ".width")"
MONITOR_HEIGHT="$(echo "$MONITOR_RECTANGLE" | jq ".height")"

case "$INFO_TYPE" in
    slop) echo "${MONITOR_WIDTH}x${MONITOR_HEIGHT}+${MONITOR_X}+${MONITOR_Y}" ;;
    name) echo "$MONITOR_NAME" ;;
    area) echo "$MONITOR_WIDTH $MONITOR_HEIGHT $MONITOR_X $MONITOR_Y" ;;
    *) echo "$MONITOR_WIDTH $MONITOR_HEIGHT $MONITOR_X $MONITOR_Y $MONITOR_NAME" ;;
esac

