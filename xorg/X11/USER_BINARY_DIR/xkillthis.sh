#!/bin/sh

ID=$(xdotool selectwindow 2> /dev/null)
[ "$ID" ] && xkill -id $ID

