#!/bin/sh

setsid -f $VIDEO_ACCELERATOR mpv $MPV_OPTIONS "$@" > /dev/null 2>&1 &

