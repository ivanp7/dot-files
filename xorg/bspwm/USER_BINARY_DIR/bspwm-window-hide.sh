#!/bin/sh

WINDOW_ID=$(bspc query -N -n .marked)
[ -z "$WINDOW_ID" ] &&
    WINDOW_ID=$(bspc query -N -n .focused)
for wid in $WINDOW_ID
do 
    bspc node $wid --flag hidden=on --flag marked=off
done

