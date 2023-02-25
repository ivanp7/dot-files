#!/bin/sh

FILE="$1"
MODE="$2"

ANIM_GEOMETRY="$3"
ANIM_START_POS="$4"

set_classic_wallpaper ()
{
    feh --no-fehbg --bg-scale "$FILE"
}

start_animated_wallpaper ()
{
    [ -z "$ANIM_START_POS" ] &&
        ANIM_START_POS="$(shuf -i 0-99 -n 1)" ||
        ANIM_START_POS="$(($ANIM_START_POS % 100))"

    MPV_OPTS="$MPV_OPTIONS --osc=no --osd-level=0 --no-input-default-bindings --mute=yes --loop=inf --start=${ANIM_START_POS}%"

    # dependency: shantz-xwinwrap-bzr from AUR
    setsid -f $VIDEO_ACCELERATOR xwinwrap -ov ${ANIM_GEOMETRY:+-g "$ANIM_GEOMETRY"} -- mpv -wid WID $MPV_OPTS "$FILE" > /dev/null 2>&1 &
}

[ -r "$FILE" ] || exit 1

if [ -z "$MODE" ]
then
    mime_type=$(file --mime-type "$FILE" -bLE) || mime_type=""
    case $mime_type in
        image/*) set_classic_wallpaper ;;
        video/*) start_animated_wallpaper ;;
        *) exit 1 ;;
    esac
else
    case "$MODE" in
        classic) set_classic_wallpaper ;;
        animated) start_animated_wallpaper ;;
        *) exit 1 ;;
    esac
fi

