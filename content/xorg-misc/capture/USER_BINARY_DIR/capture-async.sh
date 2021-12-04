#!/bin/sh

TYPE="$1"

PID=$(pgrep -u $USER -f "/sh .*/capture.sh" | head -1)

if [ -z "$PID" ]
then
    notify-send -t 900 "Starting $TYPE capturing in a second."
    sleep 1
    setsid -f capture.sh "$@" > /dev/null 2>&1 &
else
    sleep 1
    PID=$(pstree -cpT $PID | sed 's/.*ffmpeg(\([0-9]\+\)).*/\1/')
    kill -INT $PID
fi

