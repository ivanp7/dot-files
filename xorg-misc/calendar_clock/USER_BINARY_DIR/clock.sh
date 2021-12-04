#!/bin/sh

command -v tty-clock || { sleep 1; exit 1; }

tty-clock -cn -C 7

