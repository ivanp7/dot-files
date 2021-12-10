#!/bin/sh

: ${TABBED_CLASS:="status_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS
st.sh -w "$(TABBED_COMMAND_XID_ARG= tabbed.sh)" -t "calendar" -e calendar.sh

