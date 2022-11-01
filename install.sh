#!/bin/sh

cd -- "$(dirname -- "$0")"

cp -f PKGBUILD.template PKGBUILD
cp -f dot-files.install.template dot-files.install

: ${PACKAGE_POSTFIX:="$(git -C . rev-parse --abbrev-ref HEAD 2> /dev/null)"}
: ${PACKAGE_POSTFIX:="custom"}

sed -i "s:@@@@@:$PACKAGE_POSTFIX:g" PKGBUILD
sed -i "s:@@@@@:$PACKAGE_POSTFIX:g" dot-files.install

makepkg -Cfi

