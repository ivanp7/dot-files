#!/bin/sh

[ "$1" ] && URI=$1 || exit 1

[ "$2" ] && WINDOW_ARG="-w $2" || WINDOW_ARG=
DMENU_PROMPT_CATEGORY="${3:-Category}"

BOOKMARKS_DIR=$XDG_DATA_HOME/bookmarks

mkdir -p "$BOOKMARKS_DIR"
cd "$BOOKMARKS_DIR"

BOOKMARK_FILE=$(find . -path "./.git" -prune -o \! -name ".gitignore" \( -type f -o -type l \) -print |
    sed 's,^\./,,' | sort | dmenu -p "$DMENU_PROMPT_CATEGORY" -l 10 -i $WINDOW_ARG)

[ -z "$BOOKMARK_FILE" ] && exit 1
mkdir -p "$(dirname "$BOOKMARK_FILE")"
echo "$URI" >> "$BOOKMARK_FILE"

