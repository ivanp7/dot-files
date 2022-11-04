#!/bin/sh

: ${TABBED_CLASS:="zathura_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS
exec zathura.sh -e "$(TABBED_COMMAND_XID_ARG= tabbed.sh)" "$@"

