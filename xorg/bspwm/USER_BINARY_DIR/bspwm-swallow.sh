#!/bin/sh

: ${WID:=$(bspc query -N -n focused)}

bspc node $WID --flag hidden=on

"$@"

bspc node $WID --flag hidden=off --focus

