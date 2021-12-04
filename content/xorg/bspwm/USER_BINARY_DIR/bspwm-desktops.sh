#!/bin/sh

MONITOR=$2

N=$(bspc query -D -m $MONITOR | wc -l)

: ${DESKTOP_1:="I"}
: ${DESKTOP_2:="II"}
: ${DESKTOP_3:="III"}
: ${DESKTOP_4:="IV"}
: ${DESKTOP_5:="V"}
: ${DESKTOP_6:="VI"}
: ${DESKTOP_7:="VII"}
: ${DESKTOP_8:="VIII"}
: ${DESKTOP_9:="IX"}
: ${DESKTOP_10:="X"}

desktops ()
{
    case $1 in
        0|1) echo "$DESKTOP_1" ;;
        2) echo "$DESKTOP_1 $DESKTOP_2" ;;
        3) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3" ;;
        4) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4" ;;
        5) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4 $DESKTOP_5" ;;
        6) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4 $DESKTOP_5 $DESKTOP_6" ;;
        7) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4 $DESKTOP_5 $DESKTOP_6 $DESKTOP_7" ;;
        8) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4 $DESKTOP_5 $DESKTOP_6 $DESKTOP_7 $DESKTOP_8" ;;
        9) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4 $DESKTOP_5 $DESKTOP_6 $DESKTOP_7 $DESKTOP_8 $DESKTOP_9" ;;
        10|*) echo "$DESKTOP_1 $DESKTOP_2 $DESKTOP_3 $DESKTOP_4 $DESKTOP_5 $DESKTOP_6 $DESKTOP_7 $DESKTOP_8 $DESKTOP_9 $DESKTOP_10" ;;
    esac
}

case $1 in
    "") echo $N ;;
    inc) [ "$N" -lt 10 ] && bspc monitor $MONITOR -d $(desktops $(($N + 1))) ;;
    dec) [ "$N" -gt 1 ] && bspc monitor $MONITOR -d $(desktops $(($N - 1))) ;;
    *) bspc monitor $MONITOR -d $(desktops $1) ;;
esac

