#!/bin/sh

: ${TABBED_CLASS:="nsxiv_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS
exec nsxiv.sh -e "$(TABBED_COMMAND_XID_ARG= tabbed.sh)" "$@"

