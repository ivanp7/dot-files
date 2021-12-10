#!/bin/sh

CACHE="$(mktemp /tmp/thumb_cache.XXXXX.png)"
trap 'rm -f -- "$CACHE"' EXIT

ffmpegthumbnailer -i "$1" -o "$CACHE" -s 0 -c png
[ "$DISPLAY" ] && "$GUI_VIEWER" "$CACHE" || "$TERM_VIEWER" "$CACHE"

