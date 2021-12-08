#!/bin/sh

: ${SXHKD_GENERATED_CONFIG:="00-dot-files"}

[ -d "XDG_CONFIG_HOME/sxhkd/conf" ] || exit

cd "XDG_CONFIG_HOME/sxhkd/conf"

[ -f "$SXHKD_GENERATED_CONFIG" ] && rm -f "$SXHKD_GENERATED_CONFIG"

for config in $(find . -type f -printf '%P\n' | sort)
do
    echo "# $config {{{" >> "$SXHKD_GENERATED_CONFIG"
    echo >> "$SXHKD_GENERATED_CONFIG"
    cat "$config" >> "$SXHKD_GENERATED_CONFIG"
    rm -f "$config"
    echo "# }}}" >> "$SXHKD_GENERATED_CONFIG"
done

echo "" >> "$SXHKD_GENERATED_CONFIG"
echo "# vim: foldmethod=marker:" >> "$SXHKD_GENERATED_CONFIG"

