#!/bin/sh

FILE="$1"
MODE=$2
START=$3

[ "$FILE" ] || exit 1

# kill animated wallpaper, if it is displayed
pkill xwinwrap

set_classic_wallpaper ()
{
    feh --no-fehbg --bg-scale "$1"
}

start_animated_wallpaper ()
{
    [ -z "$2" ] && RAND=$(shuf -i 0-99 -n 1) || RAND=$(($2 % 100))
    MPV_OPTS="$MPV_OPTIONS --osc=no --osd-level=0 --no-input-default-bindings --mute=yes --loop=inf --start=$RAND%"

    # dependency: shantz-xwinwrap-bzr from AUR
    [ -f "$1" ] && exec $VIDEO_ACCELERATOR xwinwrap -ov -g "$(monitor-info.sh slop | head -1)" -- mpv -wid WID $MPV_OPTS "$1" > /dev/null 2>&1 &
}

if [ -z "$MODE" ]
then
    mime_type=$(file --mime-type "$FILE" -bLE) || mime_type=""
    case $mime_type in
        video/*) start_animated_wallpaper "$FILE" $START ;;
        image/*) set_classic_wallpaper "$FILE" ;;
        *) exit 1 ;;
    esac
else
    case "$MODE" in
        animated) start_animated_wallpaper "$FILE" $START ;;
        classic) set_classic_wallpaper "$FILE" ;;
        *) exit 1 ;;
    esac
fi

