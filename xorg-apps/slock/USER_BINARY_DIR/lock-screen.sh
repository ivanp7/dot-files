#!/bin/sh

command -v slock > /dev/null || exit 1

lock_screen ()
{
    # switch keyboard to the default state
    kbd-language.sh english
    kbd-layout.sh qwerty

    # lock
    slock

    # restore keymap
    xmodmap "$XDG_CONFIG_HOME/X11/xmodmap"
}

STATUS_FILE="/tmp/no-screen-lock_$USER"
case "$1" in
    -on) rm $STATUS_FILE ;;
    -off) touch $STATUS_FILE ;;
    -force) shift 1; lock_screen & $@ ;;
    -*) [ -f "$STATUS_FILE" ] && echo disabled || echo enabled ;;
    *) [ -f "$STATUS_FILE" ] || lock_screen & $@
esac

