#!/bin/sh

FLAG_FILE="$TMPDIR_SESSION/mouse_buttons_swapped"

normal ()
{
    rm -f -- "$FLAG_FILE"
    xmodmap -e "pointer = 1 2 3" 2> /dev/null
}

reverse ()
{
    touch -- "$FLAG_FILE"
    xmodmap -e "pointer = 3 2 1" 2> /dev/null
}

case "$1" in
    normal) normal ;;
    reverse) reverse ;;
    *) [ -f "$FLAG_FILE" ] && normal || reverse ;;
esac

