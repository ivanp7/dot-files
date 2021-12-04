#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

if [ "$#" -gt 0 ]
then
    for url in "$@"
    do
        surf.sh -e "$TABBED_XID" -- "$url"
    done
else
    surf.sh -e "$TABBED_XID"
fi

