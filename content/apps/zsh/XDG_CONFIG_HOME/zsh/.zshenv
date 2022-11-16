export USER_BINARY_DIR="$HOME/.local/bin"

# PATH
if [ -z "$USERPATH" ]
then
    export USERPATH="$USER_BINARY_DIR:$USER_BINARY_DIR/local"
    export PATH="$PATH:$USERPATH"
fi

# XDG directories

: ${XDG_CONFIG_HOME:="$HOME/.config"}
: ${XDG_CACHE_HOME:="$HOME/.cache"}
: ${XDG_DATA_HOME:="$HOME/.local/share"}
: ${XDG_STATE_HOME:="$HOME/.local/state"}
: ${XDG_DATA_DIRS:="/usr/local/share:/usr/share"}
: ${XDG_CONFIG_DIRS:="/etc/xdg"}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_DATA_DIRS XDG_CONFIG_DIRS

# tmpfs directory

export TMPDIR="/tmp"
[ -z "$TMPDIR_SESSION" ] && export TMPDIR_SESSION="$(mktemp -d -p "$TMPDIR" "session.XXXXXX")"

# sudo configuration

export SUDO_PRESERVE_ENV="SSH_TTY,STATUS,TMPDIR_SESSION,PARENT_SHELL_PID_EXPORTED"

# virtual terminal

export VT="$(cat "/sys/class/tty/tty0/active")"

# extra configuration

_ZSH_ENV_DIR="$(realpath -L "$ZDOTDIR/env")"
if [ -d "$_ZSH_ENV_DIR" ]
then
    for file in $(find "$_ZSH_ENV_DIR/" -type f,l | sort)
    do . "$file"
    done
fi
unset _ZSH_ENV_DIR

# vim: ft=zsh:
