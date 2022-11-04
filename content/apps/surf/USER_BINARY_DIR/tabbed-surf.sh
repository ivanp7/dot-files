#!/bin/sh

: ${TABBED_CLASS:="surf_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS

TABBED_COMMAND_XID_ARG=2 tabbed.sh surf -e xid # default command for tabbed
if [ "$#" -gt 0 ]
then
    for url in "$@"
    do
        surf.sh -e "$(TABBED_COMMAND_XID_ARG= tabbed.sh)" -- "$url"
    done
fi

