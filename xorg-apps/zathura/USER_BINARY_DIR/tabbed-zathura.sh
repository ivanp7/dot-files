#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

exec zathura.sh -e "$TABBED_XID" "$@"

