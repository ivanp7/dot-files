#!/bin/sh

WINDOW_ID="$1"
CLASS_NAME="$2"
INSTANCE_NAME="$3"
shift 3

SCRIPT="$XDG_CONFIG_HOME/bspwm/rules/$CLASS_NAME.sh"

if [ -x "$SCRIPT" ]
then exec "$SCRIPT" "$WINDOW_ID" "$INSTANCE_NAME" "$@"
else echo "$@"
fi

