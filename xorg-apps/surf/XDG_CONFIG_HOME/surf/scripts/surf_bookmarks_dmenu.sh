#!/bin/sh

[ "$1" ] && WINDOW_ARG="-w $1" || WINDOW_ARG=
DMENU_PROMPT_BOOKMARK="${2:-Bookmark}"
DMENU_PROMPT_CATEGORY="${3:-Category}"

DMENU_LINES=10
DMENU_COLUMNS=3

BOOKMARKS_DIR=$XDG_DATA_HOME/bookmarks
cd "$BOOKMARKS_DIR" || exit 1

find . -path "./.git" -prune -o \! -name ".gitignore" -print | sed 's,^\./,,' | sort |
    dmenu.sh -p "$DMENU_PROMPT_CATEGORY" -l $DMENU_LINES -g $DMENU_COLUMNS -i $WINDOW_ARG | head -1 |
    xargs -I {} find {} -path "./.git" -prune -o \! -name ".gitignore" -type f -print |
    xargs -I {} cat {} | sed -E 's/\s*".*//; /^\s*$/d' | sed -E 's/^([^ ]*) *(.*)/\2 <\1>/' |
    ifne dmenu -p "$DMENU_PROMPT_BOOKMARK" -l $DMENU_LINES -i $WINDOW_ARG | head -1 |
    sed -E 's/.*<([^ ]*)>$/\1/'

