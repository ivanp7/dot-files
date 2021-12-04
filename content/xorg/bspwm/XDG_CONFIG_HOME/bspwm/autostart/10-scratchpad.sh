#!/bin/sh

keep_scratchpad ()
{
    while xhost > /dev/null 2>&1
    do
        tabbed -w "$1" > "$SCRATCHPAD_DIR/$1"
    done
}

for n in $(seq 0 12)
do
    keep_scratchpad "scratchpad_$n" &
done

