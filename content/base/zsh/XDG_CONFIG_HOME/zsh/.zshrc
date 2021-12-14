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
# Auxilliary functions {{{

_color ()
{
    if [ -n "$1" -a -z "$2" ]
    then echo -en "\033[38;5;${1}m"
    elif [ -n "$1" -a -n "$2" ]
    then echo -en "\033[38;5;${1}m\033[48;5;${2}m"
    elif [ -z "$1" -a -n "$2" ]
    then echo -en "\033[48;5;${2}m"
    else echo -en "\033[0m"
    fi
}

separator ()
{
    echo "$(_color 15)$(dd if=/dev/zero bs=1 count=${1:-$COLUMNS} status=none | sed "s/./·/g")${_color_reset}"
}

sudo_shell ()
{
    sudo -s --preserve-env="$SUDO_PRESERVE_ENV" "$@"
}

his () # command history
{
    unset "_p_buffers[$_p_command_number]"
    unset _p_command_executed

    [ "${#_p_buffers}" -eq 0 ] && return

    for n in {1..$#_p_buffers}; do
        if [ -z "$*" ] || echo "${_p_buffers[$n]}" | grep -q "$*"
        then
            print $(_color 1)$n:${_color_reset} ${_p_buffers[$n]};
        fi
    done
}

. "$ZDOTDIR/functions"

# }}}
# Default aliases {{{

alias d='dirs -v | head'
alias 0=':'
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

alias pwd_='printf "%q\n" "$(pwd)"'

alias sudo='sudo '
alias sudoenv="sudo --preserve-env=$SUDO_PRESERVE_ENV "
alias sush='sudo_shell '

alias si='shell_info'
alias sep='separator'

alias ls='ls --group-directories-first --color=auto'
alias ll='ls --group-directories-first -alF'
alias la='ls --group-directories-first -A'
alias l='ls --group-directories-first -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# }}}
# Configuration of interactive session {{{

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
