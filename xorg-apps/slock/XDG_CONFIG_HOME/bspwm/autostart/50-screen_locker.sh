#!/bin/sh

CHECK_INTERVAL=60
STATUS_FILE="/tmp/no-screen-lock_$USER"

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
        date >> /tmp/screen-lock_$USER.log
        lock-screen.sh
    fi
done

