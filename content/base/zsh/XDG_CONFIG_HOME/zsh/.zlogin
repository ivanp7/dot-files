case $(tty) in
    /dev/tty*) clear ;;
esac

_ZSH_LOGIN_DIR="$(realpath -L "$ZDOTDIR/login")"
if [ -d "$_ZSH_LOGIN_DIR" ]
then
    for file in $(find "$_ZSH_LOGIN_DIR/" -type f,l | sort)
    do . "$file"
    done
fi
unset _ZSH_LOGIN_DIR

separator
shell_info

