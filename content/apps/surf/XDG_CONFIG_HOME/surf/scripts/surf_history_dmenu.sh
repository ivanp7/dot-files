#!/bin/sh

[ "$1" ] && WINDOW_ARG="-w $1" || WINDOW_ARG=
DMENU_PROMPT="${2:-History link}"

tac "$XDG_CONFIG_HOME/.config/surf/history.txt" |
    dmenu -p "$DMENU_PROMPT" -l 10 -i $WINDOW_ARG | head -1 | cut -d' ' -f3

