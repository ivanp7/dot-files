#!/bin/sh

[ "$1" ] && TARGET="-t $1" || TARGET=
exec xclip -selection clipboard $TARGET

