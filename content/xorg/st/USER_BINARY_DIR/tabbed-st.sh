#!/bin/sh

: ${TABBED_CLASS:="st_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS
TABBED_COMMAND_XID_ARG=2 exec tabbed.sh st -w xid "$@"

