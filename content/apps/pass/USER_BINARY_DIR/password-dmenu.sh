#!/bin/sh

DMENU_PROMPT=Password
DMENU_LINES=10
DMENU_COLUMNS=3

cd -- "$PASSWORD_STORE_DIR"

export PINENTRY_USER_DATA=X
find . -path "./.git" -prune -o -type f -name "*.gpg" -print |
    sed 's@^\./@@; s@\.gpg@@' |
    dmenu.sh -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1 | xargs -r pass -c

