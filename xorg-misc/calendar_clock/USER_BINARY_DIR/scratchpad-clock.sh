#!/bin/sh

: ${SCRATCHPAD:=12}
TABBED_XID="$(cat "$SCRATCHPAD_DIR/$SCRATCHPAD" 2> /dev/null)" exec tabbed-clock.sh

