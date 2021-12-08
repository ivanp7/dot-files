#!/bin/sh

TTY_FILE="/sys/class/tty/tty0/active"

while true
do
    cat "$(id -un)@$TTY_FILE"
    inotifywait -e modify "$TTY_FILE" 2> /dev/null
done

