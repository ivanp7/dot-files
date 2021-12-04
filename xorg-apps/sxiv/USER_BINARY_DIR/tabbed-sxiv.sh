#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

sxiv.sh -e "$TABBED_XID" "$@"

