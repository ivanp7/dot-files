#!/bin/sh

export WINDOW_TITLE_FORMAT="%title:0:$(($(bspwm-monitor-info.sh area | cut -d' ' -f1) / $DEFAULT_FONT_WIDTH * 5/12)):...%"
export FONT="$DEFAULT_FONT;0"

export PREFIX="$VT:$(id -un)"

keep_polybar ()
{
    while xhost > /dev/null 2>&1
    do
        xrandr | grep -q "^$1 .* [0-9]\+x[0-9]\++[0-9]\++[0-9]\+ " &&
            MONITOR="$1" TRAY_POS="$2" polybar --reload top || sleep 8
        sleep 2
    done
}

for m in $(polybar --list-monitors | cut -d":" -f1)
do
    keep_polybar "$m" "$([ "$m" = "$PRIMARY_MONITOR" ] && echo right || echo none)" &
done

