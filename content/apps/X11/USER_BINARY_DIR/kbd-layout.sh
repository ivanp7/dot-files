#!/bin/sh

set_layout ()
{
    setxkbmap -layout "us,ru" -variant "$1,winkeys" -option "grp:win_space_toggle" -option "caps:none"
}

CURRENT_LAYOUT=$(setxkbmap -query | grep -q "^variant:.*colemak.*" && echo "colemak" || echo "qwerty")

case "$1" in
    "") echo "$CURRENT_LAYOUT" ;;
    qwerty) set_layout "basic" ;;
    colemak) set_layout "colemak" ;;
    toggle) [ "$CURRENT_LAYOUT" = "qwerty" ] && set_layout "colemak" || set_layout "basic" ;;
esac

