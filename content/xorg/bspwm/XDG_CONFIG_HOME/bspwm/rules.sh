#!/bin/sh

WINDOW_ID="$1"
CLASS_NAME="$2"
INSTANCE_NAME="$3"
shift 3

SCRIPT="$XDG_CONFIG_HOME/bspwm/rules/$CLASS_NAME.sh"

if [ -x "$SCRIPT" ]
then
    # executing $SHELL to update the environment
    exec "$SHELL" -c "exec \"$SCRIPT\" \"$WINDOW_ID\" \"$INSTANCE_NAME\" \"$@\""
else
    echo "$@"
fi

