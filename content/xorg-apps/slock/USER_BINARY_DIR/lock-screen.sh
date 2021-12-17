#!/bin/sh

command -v slock > /dev/null || exit 1

lock_screen ()
{
    # switch keyboard to the default state
    kbd-language.sh english
    kbd-layout.sh qwerty

    # lock
    slock

    # reapply keymaps
    for file in $(find "$XDG_CONFIG_HOME/X11/xmodmap" -type f 2> /dev/null)
    do xmodmap "$file"; done
}

STATUS_FILE="$TMPDIR_SESSION/screen-lock.disabled"

case "$1" in
    -on) rm -f -- "$STATUS_FILE" ;;
    -off) touch -- "$STATUS_FILE" ;;
    "") [ -f "$STATUS_FILE" ] || lock_screen ;;
    -force) lock_screen ;;
    -async) shift 1; [ -f "$STATUS_FILE" ] || lock_screen & "$@" ;;
    -async-force) shift 1; lock_screen & "$@" ;;
    *) [ -f "$STATUS_FILE" ] && echo "disabled" || echo "enabled" ;;
esac

