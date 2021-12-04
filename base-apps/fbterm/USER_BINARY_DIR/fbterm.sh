#!/bin/sh

[ "$TERM" = "linux" ] || exit

# request display of shell info
PIDFILE="$TMPDIR_CURRENT/shell_info/$(tty)/$PARENT_SHELL_PID_EXPORTED"
[ -n "$PARENT_SHELL_PID_EXPORTED" -a -f "$PIDFILE" ] && rm "$PIDFILE" || true

: ${FBTERM_WALLPAPER:="$HOME/wallpapers/fbterm"}

if [ -e "$FBTERM_WALLPAPER" ] && file --mime-type "$FBTERM_WALLPAPER" -bLE | grep -q "^image/"
then
    echo -ne "\e[?25l" # hide cursor
    fbv -ciuker "$FBTERM_WALLPAPER" << EOF
q
EOF
    export FBTERM_BACKGROUND_IMAGE=1
fi

exec fbterm -- "$XDG_CONFIG_HOME/fbterm/init.sh" "$1"

