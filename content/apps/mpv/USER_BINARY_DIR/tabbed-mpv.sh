#!/bin/sh

: ${TABBED_CLASS:="mpv_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS
exec mpv.sh --wid="$(TABBED_COMMAND_XID_ARG= tabbed.sh)" "$@"

