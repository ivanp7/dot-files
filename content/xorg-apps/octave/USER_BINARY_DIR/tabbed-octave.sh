#!/bin/sh

: ${TABBED_CLASS:="octave_$(($(xdotool get_desktop)+1))"}
export TABBED_CLASS
exec tabbed-st.sh -t "octave" -e octave

