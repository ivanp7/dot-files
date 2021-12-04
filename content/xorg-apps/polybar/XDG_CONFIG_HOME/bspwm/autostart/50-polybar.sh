#!/bin/sh

export WINDOW_TITLE_FORMAT="%title:0:$(($(monitor-info.sh | head -1 | cut -d' ' -f 1) / $DEFAULT_FONT_WIDTH * 5/12)):...%"
export FONT="$DEFAULT_FONT;0"

export SCRIPT_TTY="$XDG_CONFIG_HOME/polybar/tty.sh"

keep_polybar ()
{
    while xhost > /dev/null 2>&1
    do
        if xrandr | grep -q "^$1 .* [0-9]\+x[0-9]\++[0-9]\++[0-9]\+ "
        then
            [ "$1" = "$PRIMARY_MONITOR" ] &&
                MONITOR="$1" TRAY_POS=right polybar --reload top ||
                MONITOR="$1" polybar --reload top
        else
            sleep 8
        fi
        sleep 2
    done
}

for m in $(polybar --list-monitors | cut -d":" -f1)
do
    keep_polybar "$m" &
done

