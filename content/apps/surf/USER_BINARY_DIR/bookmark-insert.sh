#!/bin/sh

"$XDG_CONFIG_HOME/surf/scripts/surf_add_bookmark.sh" "$(xclip -o -selection clipboard | dmenu | head -1)"

