#!/bin/sh

: ${GENERATED_CONFIG:="00-dot-files"}

consolidate ()
{
    [ -d "$1" ] || return 0

    cd "$1"

    [ -f "$GENERATED_CONFIG" ] && rm -f "$GENERATED_CONFIG"

    for config in $(find . -type f -printf '%P\n' | sort)
    do
        echo "# $config {{{" >> "$GENERATED_CONFIG"
        echo >> "$GENERATED_CONFIG"
        cat "$config" >> "$GENERATED_CONFIG"
        rm -f "$config"
        echo "# }}}" >> "$GENERATED_CONFIG"
    done

    echo "" >> "$GENERATED_CONFIG"
    echo "# vim: foldmethod=marker:" >> "$GENERATED_CONFIG"

    cd -- "$OLDPWD"
}

consolidate "XDG_CONFIG_HOME/sxhkd/conf"

