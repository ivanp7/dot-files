#!/bin/sh

cd

# request display of shell info
[ "$ZDOTDIR" ] && "$ZDOTDIR/aux/request_shell_info.sh"

# server start
exec startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc"

