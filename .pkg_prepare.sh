#!/bin/sh

: ${DOT_FILES_CONSOLIDATED_CONFIG:="00-dot-files.cfg"}

consolidate ()
{
    [ "$2" ] || return 1
    local comment="$2"

    [ -d "$1" ] || return 0
    cd -- "$1"

    [ -f "$DOT_FILES_CONSOLIDATED_CONFIG" ] && rm -f -- "$DOT_FILES_CONSOLIDATED_CONFIG"

    for config in $(find . -type f -printf '%P\n' | sort)
    do
        echo "$comment $config {{{" >> "$DOT_FILES_CONSOLIDATED_CONFIG"
        echo >> "$DOT_FILES_CONSOLIDATED_CONFIG"
        cat -- "$config" >> "$DOT_FILES_CONSOLIDATED_CONFIG"
        rm -f -- "$config"
        echo "$comment }}}" >> "$DOT_FILES_CONSOLIDATED_CONFIG"
    done

    echo "" >> "$DOT_FILES_CONSOLIDATED_CONFIG"
    echo "$comment vim: foldmethod=marker:" >> "$DOT_FILES_CONSOLIDATED_CONFIG"

    cd -- "$OLDPWD"
}

# run custom preparation scripts
PACKAGE_DIR="$PWD"

for script in $(find "../pkg_prepare" -type f -name "*.sh" 2> /dev/null | sort)
do
    . "$script"
    cd -- "$PACKAGE_DIR"
done

