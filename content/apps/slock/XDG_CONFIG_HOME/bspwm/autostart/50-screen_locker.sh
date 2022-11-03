#!/bin/sh

CHECK_INTERVAL=60
STATUS_FILE="$TMPDIR_SESSION/screen-lock.disabled"

while true
do
    CHECK_COUNTER=$CHECK_INTERVAL
    while [ "$CHECK_COUNTER" -gt 0 ]
    do
        sleep 1
        CHECK_COUNTER=$(($CHECK_COUNTER - 1))

        xhost > /dev/null 2>&1 || exit
    done

    if [ ! -f "$STATUS_FILE" -a "$(xssstate -t)" -eq 0 ]
    then
        date >> "$TMPDIR_SESSION/screen-lock.log"
        lock-screen.sh
    fi
done

