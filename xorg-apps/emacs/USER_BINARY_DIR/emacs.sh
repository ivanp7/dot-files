#!/bin/sh

[ "$(pidof emacs)" ] && exec emacsclient "$@" || exec emacs "$@"

