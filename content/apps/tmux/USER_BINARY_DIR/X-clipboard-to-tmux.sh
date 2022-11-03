#!/bin/sh

tmux set-buffer "$(xclip -sel clip -o)"

