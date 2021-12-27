#!/bin/sh

if [ ! -t 1 ] # pipe
then
    maim "$@"
    exit "$?"
fi

NOTIFY_TIME=3000

: ${FILENAME_PREFIX:="screenshot"}
: ${FILENAME:="${FILENAME_PREFIX}_$(date "+%F_%T").png"}

DIRECTORY="$TMPDIR_SESSION/screenshot"

mkdir -p -- "$DIRECTORY"

if ! maim "$@" -- "$DIRECTORY/$FILENAME"
then
    notify-send -u critical -t $NOTIFY_TIME "Error, screenshot not saved"
    exit 1
fi

DMENU_PROMPT="Screenshot directory"
DMENU_LINES=10
DMENU_COLUMNS=4

HISTORY_FILE="$XDG_CACHE_HOME/screenshot-history"
touch -- "$HISTORY_FILE"

INPUT=$(tac -- "$HISTORY_FILE" | dmenu.sh -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1)
if [ -z "$INPUT" ] || ! cp -t "$INPUT" -- "$DIRECTORY/$FILENAME"
then
    notify-send -t $NOTIFY_TIME "Screenshot saved as $DIRECTORY/$FILENAME"
    exit
fi

{ grep -Fv "$INPUT" -- "$HISTORY_FILE"; echo "$INPUT"; } | sponge -- "$HISTORY_FILE"

notify-send -t $NOTIFY_TIME "Screenshot saved as $INPUT/$FILENAME"

