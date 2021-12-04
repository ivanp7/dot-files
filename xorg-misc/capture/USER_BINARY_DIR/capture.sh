#!/bin/sh

TYPE=$1
shift 1

: ${SOURCE_SOUND:=$(pactl list short sources | grep alsa_output | head -1 | sed 's/\s.*//')}
: ${SOURCE_MIC:=$(pactl list short sources | grep alsa_input | head -1 | sed 's/\s.*//')}

: ${ACODEC:="aac"}

SOUND_FLAGS="-f pulse -i $SOURCE_SOUND -acodec $ACODEC $SOUND_FLAGS"
MIC_FLAGS="-f pulse -i $SOURCE_MIC -acodec $ACODEC $MIC_FLAGS"

case $TYPE in
    screen*)
        AREA="$1"
        shift 1

        case "$AREA" in
            "#")
                bspwm-monitor-info.sh area | read MONITOR_WIDTH MONITOR_HEIGHT MONITOR_X MONITOR_Y

                SIZE="${MONITOR_WIDTH}x${MONITOR_HEIGHT}"
                DISPL="+${MONITOR_X},${MONITOR_Y}"

                case $TYPE in
                    *mic) : ${CAPTURE_DIRECTORY:="screencast/full/mic"} ;;
                    *) : ${CAPTURE_DIRECTORY:="screencast/full/sound"} ;;
                esac
                ;;
            *)
                [ "$AREA" = "+" ] && AREA="$(slop)"

                SIZE="${AREA%%+*}"
                AREA="${AREA#*+}"
                DISPL="+${AREA%+*},${AREA#*+}"

                case $TYPE in
                    *mic) : ${CAPTURE_DIRECTORY:="screencast/area/mic"} ;;
                    *) : ${CAPTURE_DIRECTORY:="screencast/area/sound"} ;;
                esac
        esac

        : ${FILENAME_PREFIX:="screencast"}
        : ${FILENAME_EXT:="mp4"}

        if command -v nvidia-smi > /dev/null && [ "$(nvidia-smi -L | wc -l)" -gt 0 ]
        then
            : ${VIDEO_CODEC:="h264_nvenc"}
        fi

        VIDEO_FLAGS="-f x11grab -r ${RATE:-30} -s $SIZE -i ${DISPLAY}${DISPL} -vcodec ${VIDEO_CODEC:-libx264} $VIDEO_FLAGS"

        case $TYPE in
            *mic) AUDIO_FLAGS="$MIC_FLAGS $AUDIO_FLAGS" ;;
            *) AUDIO_FLAGS="$SOUND_FLAGS $AUDIO_FLAGS" ;;
        esac
        ;;

    mic)
        : ${CAPTURE_DIRECTORY:="microphone"}

        : ${FILENAME_PREFIX:="record"}
        : ${FILENAME_EXT:="aac"}

        AUDIO_FLAGS="$MIC_FLAGS $AUDIO_FLAGS"
        ;;
esac

: ${FILENAME:="${FILENAME_PREFIX}_$(date "+%F_%T").${FILENAME_EXT}"}

: ${DIRECTORY:="$HOME/capture/$CAPTURE_DIRECTORY"}
mkdir -p -- "$DIRECTORY"

ffmpeg -y "$@" $AUDIO_FLAGS $VIDEO_FLAGS "$DIRECTORY/$FILENAME"
[ "$?" -eq 0 -o "$?" -eq 130 ] &&
    notify-send -t 3000 "Capture saved as $DIRECTORY/$FILENAME" ||
    notify-send -u critical -t 2000 "Error, capture not saved"

