#!/bin/sh

DMENU_PROMPT="Expression"
DMENU_LINES=10
DMENU_COLUMNS=4

NOTIFY_TIME=3000

HISTORY_FILE="$XDG_CACHE_HOME/calculator-history"
touch -- "$HISTORY_FILE"

INPUT=$(tac -- "$HISTORY_FILE" | dmenu.sh -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1)
[ -z "$INPUT" ] && exit

TYPE="normal"
RESULT=$(calc.sh "$INPUT" 2>&1)
[ "$?" -ne 0 ] && TYPE="critical"
[ -z "$RESULT" ] && exit 1

notify-send -t $NOTIFY_TIME -u $TYPE "Calculator" "$RESULT"

[ "$TYPE" = "normal" ] && { grep -Fxv "$INPUT" -- "$HISTORY_FILE"; echo "$INPUT"; } | sponge -- "$HISTORY_FILE"

