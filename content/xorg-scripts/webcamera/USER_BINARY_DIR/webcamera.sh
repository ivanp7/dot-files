#!/bin/sh

DEVICE="/dev/video${1:-0}"
[ -r "$DEVICE" ] &&
    exec $VIDEO_ACCELERATOR mpv $MPV_OPTIONS --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:$DEVICE

