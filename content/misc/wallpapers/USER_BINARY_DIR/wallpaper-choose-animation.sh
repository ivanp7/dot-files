#!/bin/sh

# select video
cd -- "$HOME/wallpapers"
WALLPAPER="$(find -L . -path "./.git" -prune -o -type f -o -type l | sed 's@^\./@@' |
    while read file
    do file --mime-type -bLE "$file" | grep -E -q "^(video/.*|image/gif)$" && echo "$file"
    done | dmenu -l 10 -i | head -1)"

pkill xwinwrap
for monitor in $(bspc query -M)
do
    GEOMETRY="$(bspc query -m "$monitor" -T | jq ".rectangle.width,.rectangle.height,.rectangle.x,.rectangle.y" | paste -sd+ | sed 's/+/x/')"
    wallpaper.sh "$WALLPAPER" animated "$GEOMETRY"
done

