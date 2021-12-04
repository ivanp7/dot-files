#!/bin/sh

: ${ZSH_GENERATED_CONFIG:="00-dot-files"}

consolidate ()
{
    [ -d "$1" ] || return

    cd "$1"

    [ -f "$ZSH_GENERATED_CONFIG" ] && rm -f "$ZSH_GENERATED_CONFIG"

    for config in $(find . -type f -printf '%P\n' | sort)
    do
        echo "# $config {{{" >> "$ZSH_GENERATED_CONFIG"
        echo >> "$ZSH_GENERATED_CONFIG"
        cat "$config" >> "$ZSH_GENERATED_CONFIG"
        rm -f "$config"
        echo "# }}}" >> "$ZSH_GENERATED_CONFIG"
    done

    echo "" >> "$ZSH_GENERATED_CONFIG"
    echo "# vim: foldmethod=marker:" >> "$ZSH_GENERATED_CONFIG"

    cd -- "$OLDPWD"
}

consolidate "XDG_CONFIG_HOME/zsh/env"
consolidate "XDG_CONFIG_HOME/zsh/rc"
consolidate "XDG_CONFIG_HOME/zsh/login"

