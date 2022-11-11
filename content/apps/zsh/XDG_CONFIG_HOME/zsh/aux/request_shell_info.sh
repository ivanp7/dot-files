#!/bin/sh

: ${TTY:="$(tty)"}

if [ -n "$PARENT_SHELL_PID_EXPORTED" -a -f "$TMPDIR_SESSION/active_prompt/$TTY/$PARENT_SHELL_PID_EXPORTED" ]
then
    rm -- "$TMPDIR_SESSION/active_prompt/$TTY/$PARENT_SHELL_PID_EXPORTED"
    rmdir --ignore-fail-on-non-empty -p -- "$TMPDIR_SESSION/active_prompt/$TTY"
fi

