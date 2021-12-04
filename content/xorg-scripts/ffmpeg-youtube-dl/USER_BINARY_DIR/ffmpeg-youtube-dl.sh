#!/bin/sh

if [ "$#" -eq 0 ]
then
    echo "capture-yt-video-segment.sh URL START_TIME END_TIME [FILENAME]"
    exit
fi

URL="$1"
START_TIME="$2"
END_TIME="$3"
FILENAME="$4"

youtube_urls=$(youtube-dl --youtube-skip-dash-manifest -g "$URL")
video_url=$(echo "$youtube_urls" | head -1)
audio_url=$(echo "$youtube_urls" | tail -1)

: ${FILENAME:="video_$(date "+%F_%T").mp4"}

: ${DIRECTORY:="$XDG_VIDEOS_DIR"}
mkdir -p -- "$DIRECTORY"

ffmpeg -y -ss "$START_TIME" -to "$END_TIME" -i "$video_url" -ss "$START_TIME" -to "$END_TIME" -i "$audio_url" -map 0:v -map 1:a -c:v libx264 -c:a aac "$DIRECTORY/$FILENAME"

