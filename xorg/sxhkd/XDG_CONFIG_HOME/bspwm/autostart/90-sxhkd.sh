#!/bin/sh

while xhost > /dev/null 2>&1
do
    sxhkd $(find "$XDG_CONFIG_HOME/sxhkd/conf" -type f,l 2> /dev/null | sort)
done

