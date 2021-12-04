#!/bin/sh

: ${TABBED_XID:="$(tabbed.sh)"}
export TABBED_XID

exec st.sh -w "$TABBED_XID" "$@"

