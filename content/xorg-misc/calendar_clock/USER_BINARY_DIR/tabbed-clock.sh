#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

exec st -w "$TABBED_XID" -t "clock" -e clock.sh

