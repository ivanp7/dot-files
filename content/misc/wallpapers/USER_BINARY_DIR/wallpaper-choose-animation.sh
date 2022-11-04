#!/bin/sh

# select video
cd -- "$HOME/wallpapers"
WALLPAPER="$(find -L . -path "./.git" -prune -o -type f -o -type l | sed 's@^\./@@' |
    while read file
    do file --mime-type -bLE "$file" | grep -E -q "^(video/.*|image/gif)$" && echo "$file"
    done | dmenu -l 10 -i | head -1)"

wallpaper.sh "$WALLPAPER" animated

