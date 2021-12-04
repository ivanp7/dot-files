#!/bin/sh

WINDOW_ID=$(xdotool selectwindow)
for node_id in $(bspc query -N -n .window)
do [ "$(bspc query -T -n $node_id | jq ".id")" = "$WINDOW_ID" ] && { echo $node_id; exit 0; }
done
exit 1

