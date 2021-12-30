#!/bin/sh

sleep 1

# load keymaps
sysmodmap="/etc/X11/xinit/.Xmodmap"
[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"

usermodmap="$XDG_CONFIG_HOME/X11/xmodmap"
for file in $(find "$usermodmap" -type f 2> /dev/null)
do xmodmap "$file"; done

