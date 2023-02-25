#!/bin/sh

# take random picture from selected range
cd -- "$HOME/wallpapers"
WALLPAPER="$(find -L . -path "./.git" -prune -o -type f -o -type l | sed 's@^\./@@' |
    while read file
    do file --mime-type -bLE "$file" | grep -q "^image/" && echo "$file"
    done | nsxiv -tio | shuf -n 1)"

pkill xwinwrap
wallpaper.sh "$WALLPAPER" classic

