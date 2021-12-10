#!/bin/sh

cd -- "$(dirname -- "$0")"

if [ "$(grep "^\s*pkgname=" PKGBUILD | cut -d'=' -f2)" != "$(grep "^PACKAGE_NAME=" dot-files.install | cut -d'=' -f2)" ]
then
    echo "Package names in PKGBUILD and dot-files.install do not match!"
    exit 1
fi

makepkg -Cfi

