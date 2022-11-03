#!/bin/bash

: ${TABBED_CLASS:="tabbed"}

[ "$TABBED_XID" ] || TABBED_XID="$(cat -- "$TABBED_DIR/$TABBED_CLASS" 2> /dev/null)"

if [ "$TABBED_XID" ]
then
    if [ "$#" -gt 0 ]
    then
        if [ "$TABBED_COMMAND_XID_ARG" ]
        then
            setsid -f "${@:1:$TABBED_COMMAND_XID_ARG}" "$TABBED_XID" "${@:$TABBED_COMMAND_XID_ARG+2}" > /dev/null 2>&1 &
        else
            setsid -f "$@" "$TABBED_XID" > /dev/null 2>&1 &
        fi
    fi
else
    setsid -f tabbed-wrapper.sh "$@" > /dev/null 2>&1 &

    while [ -z "$TABBED_XID" ]
    do
        TABBED_XID="$(cat -- "$TABBED_DIR/$TABBED_CLASS" 2> /dev/null)"
        sleep 0.25
    done
fi

echo "$TABBED_XID"

