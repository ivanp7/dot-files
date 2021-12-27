#!/bin/sh

PID_FILE="$TMPDIR_SESSION/ffmpeg-capture.pid"

NOTIFY_TIME=3000

if [ -f "$PID_FILE" ]
then
    kill -INT "$(head -1 -- "$PID_FILE")"
    notify-send -t $NOTIFY_TIME "Capture saved as $(tail -1 -- "$PID_FILE")"
    rm -f -- "$PID_FILE"
    exit
fi

DMENU_PROMPT="Directory"
DMENU_LINES=10
DMENU_COLUMNS=4

HISTORY_FILE="$XDG_CACHE_HOME/capture-history"
touch -- "$HISTORY_FILE"

INPUT=$(tac -- "$HISTORY_FILE" | dmenu.sh -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1)

if [ -z "$INPUT" ]
then
    notify-send -t $NOTIFY_TIME "Capturing canceled."
    exit
elif [ ! -d "$INPUT" ]
then
    notify-send -u critical -t $NOTIFY_TIME "$INPUT is not a directory."
    exit
fi

TYPE="$1"
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
                ;;
            *)
                [ "$AREA" = "+" ] && AREA="$(slop)"

                SIZE="${AREA%%+*}"
                AREA="${AREA#*+}"
                DISPL="+${AREA%+*},${AREA#*+}"
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
        : ${FILENAME_PREFIX:="record"}
        : ${FILENAME_EXT:="aac"}

        AUDIO_FLAGS="$MIC_FLAGS $AUDIO_FLAGS"
        ;;
esac

: ${FILENAME:="${FILENAME_PREFIX}_$(date "+%F_%T").${FILENAME_EXT}"}

ffmpeg -y "$@" $AUDIO_FLAGS $VIDEO_FLAGS "$INPUT/$FILENAME" > /dev/null 2>&1 &
PID=$!

if [ -d "/proc/$PID" ]
then
    echo "$PID" > "$PID_FILE"
    echo "$INPUT/$FILENAME" >> "$PID_FILE"
    { grep -Fv "$INPUT" -- "$HISTORY_FILE"; echo "$INPUT"; } | sponge -- "$HISTORY_FILE"
else
    notify-send -u critical -t $NOTIFY_TIME "Error, capture could not be started"
fi

