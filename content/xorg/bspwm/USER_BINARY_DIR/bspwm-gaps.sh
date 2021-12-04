#!/bin/sh

STEP=5

gaps ()
{
    bspc config window_gap $1
}

show_gaps ()
{
    gaps | xargs -I {} notify-send -t 1000 -u low "Gaps: {}" 
}

case $1 in
    "") show_gaps ;;
    up) gaps $(($(gaps) + $STEP)); show_gaps;;
    down) gaps $(($(gaps) - $STEP)); show_gaps;;
    *) bspc config window_gap $1; show_gaps;;
esac

