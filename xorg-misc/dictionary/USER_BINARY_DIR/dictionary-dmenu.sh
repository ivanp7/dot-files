#!/bin/sh

DMENU_PROMPT=Word
DMENU_LINES=10
DMENU_COLUMNS=10

HISTORY_FILE="$SDCV_HISTFILE"
touch "$HISTORY_FILE"

INPUT=$(tac "$HISTORY_FILE" | uniq | dmenu -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1)
[ -z "$INPUT" ] && exit

OUTPUT_FILE=$(mktemp -p /tmp dictionary.XXXXXXXX)
dictionary.sh -n "$INPUT" > "$OUTPUT_FILE"

: ${SCRATCHPAD:=10}
export SCRATCHPAD
exec scratchpad-st.sh -t "$INPUT" -e less -mr "$OUTPUT_FILE"

sleep 2
rm -f -- "$OUTPUT_FILE"

