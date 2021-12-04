#!/bin/sh

while xhost > /dev/null 2>&1
do
    clear
    echo
    cal -3mw --color=auto
    sleep 60
done

