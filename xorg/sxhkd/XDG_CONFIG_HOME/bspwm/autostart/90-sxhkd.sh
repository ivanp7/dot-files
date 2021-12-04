#!/bin/sh

while xhost > /dev/null 2>&1
do
    sxhkd $(find "$XDG_CONFIG_HOME/sxhkd/conf/" -type f,l | sort)
done

