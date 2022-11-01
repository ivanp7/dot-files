#!/bin/sh

cd -- "$(dirname -- "$0")"

rm -fv PKGBUILD
rm -fv dot-files.install

rm -rfv src
rm -rfv pkg
rm -fv *.pkg.tar.zst

