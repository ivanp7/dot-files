#!/bin/sh

setsid -f surf "$@" > /dev/null 2>&1 &

