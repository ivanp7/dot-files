#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

exec mpv.sh --wid "$TABBED_XID" "$@"

