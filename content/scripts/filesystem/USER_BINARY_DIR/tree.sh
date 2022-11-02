#!/bin/sh

tree -ad -L 3 -I ".git" -n $1 | sed 's/ / /g' | "$PAGER"

