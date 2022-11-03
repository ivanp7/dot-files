#!/bin/sh

DMENU_PROMPT="Tmux buffer"
DMENU_LINES=20
DMENU_COLUMNS=2

BUFFER="$(tmux list-buffers | dmenu.sh -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1)"
[ -z "$BUFFER" ] && exit

BUFFER="$(echo "$BUFFER" | head -1 | cut -d':' -f 1)"
tmux save-buffer -b "$BUFFER" - | xclip -sel clip

