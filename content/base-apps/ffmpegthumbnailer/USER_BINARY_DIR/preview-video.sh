#!/bin/sh

CACHE="$(mktemp /tmp/thumb_cache.XXXXX.png)"
trap 'rm "$CACHE"' EXIT

ffmpegthumbnailer -i "$1" -o "$CACHE" -s 0 -c png
"$VIEWER" "$CACHE"

