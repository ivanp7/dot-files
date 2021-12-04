#!/bin/sh

# request display of shell info
PIDFILE="$TMPDIR_CURRENT/shell_info/$(tty)/$PARENT_SHELL_PID_EXPORTED"
[ -n "$PARENT_SHELL_PID_EXPORTED" -a -f "$PIDFILE" ] && rm "$PIDFILE" || true

# preparations
mkdir -p -- "$TMPDIR/x_desktop"
trap 'rm -f "$TTY_DISPLAY_FILE"' EXIT
cd

# server start
startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc"

