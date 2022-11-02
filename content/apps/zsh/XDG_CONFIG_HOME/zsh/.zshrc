# Auxilliary variables {{{

PARENT_SHELL_PID=$PARENT_SHELL_PID_EXPORTED
export PARENT_SHELL_PID_EXPORTED=$$

_pstree="$(exec pstree -ls $$)"
_pstree="$(echo "$_pstree" | head -1 | sed -E "s/-(-|[+])-/---/g; s/^---//; s/---pstree$//$ZSH_SHELL_INFO_PSTREE_SED")"

_colors=$(tput colors)

_color_reset="\033[0m"
_color_underline="\033[4m"
_color_no_underline="\033[24m"
_color_strike="\033[9m"
_color_no_strike="\033[29m"
_color_blink="\033[5m"
_color_no_blink="\033[25m"

# }}}
# Base configuration {{{

. "$ZDOTDIR/functions"

[ "$NON_INTERACTIVE" ] || . "$ZDOTDIR/interactive"

# }}}
# Extra configuration {{{

_ZSH_RC_DIR="$(realpath -L "$ZDOTDIR/rc")"
if [ -d "$_ZSH_RC_DIR" ]
then
    for file in $(find "$_ZSH_RC_DIR/" -type f,l | sort)
    do . "$file"
    done
fi
unset _ZSH_RC_DIR

# }}}

# vim: ft=zsh: foldmethod=marker:
