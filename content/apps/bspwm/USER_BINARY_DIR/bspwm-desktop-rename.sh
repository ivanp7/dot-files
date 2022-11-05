#!/bin/sh

DESKTOP_NAME="$(dmenu.sh -p "Desktop name: " < /dev/null)"

[ "$DESKTOP_NAME" ] && bspc desktop -n "$DESKTOP_NAME"

