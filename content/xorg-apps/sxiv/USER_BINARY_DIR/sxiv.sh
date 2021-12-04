#!/bin/bash

if [ "$#" -eq 0 ]
then
    setsid -f sxiv -t . > /dev/null 2>&1 &
elif [ -d "${@: -1}" ]
then
    setsid -f sxiv -t "$@" > /dev/null 2>&1 &
else
    setsid -f sxiv "$@" > /dev/null 2>&1 &
fi

