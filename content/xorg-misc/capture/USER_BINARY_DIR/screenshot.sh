#!/bin/sh

if [ ! -t 1 ] # pipe
then
    maim "$@"
    exit
fi

: ${FILENAME_PREFIX:="screenshot"}
: ${FILENAME:="${FILENAME_PREFIX}_$(date "+%F_%T").png"}

: ${CAPTURE_DIRECTORY:="screenshot"}
: ${DIRECTORY:="$HOME/capture/$CAPTURE_DIRECTORY"}
mkdir -p -- "$DIRECTORY"

maim "$@" "$DIRECTORY/$FILENAME" &&
    notify-send -t 3000 "Screenshot saved as $DIRECTORY/$FILENAME" ||
    notify-send -u critical -t 2000 "Error, screenshot not saved"

