#!/bin/sh

STEP=10

BRIGHTNESS=$(xbacklight -get | sed "s/\..*//")

case "$1" in
    "") echo "$BRIGHTNESS%" ;;
    up) xbacklight -inc $STEP ;;
    down) xbacklight -dec $STEP ;;
    *) xbacklight -set $1 ;;
esac

