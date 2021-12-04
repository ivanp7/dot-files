#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

exec st -w "$TABBED_XID" -t "calendar" -e calendar.sh

