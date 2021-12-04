# Maintainer : Ivan Podmazov <ivanpzv [eight] at gmail com>

pkgname=dot-files
pkgdesc="Auto-managed dot-files"
arch=('any')
license=('Unlicense')

pkgver=2021.12.05
pkgrel=1
pkgver ()
{
    date +'%Y.%m.%d'
}

prepare ()
{
    : ${DOT_FILES_DIR:="../content"}
    : ${DOT_FILES_PKG_PREPARE:-"../prepare"}

    # check dot-files directory existence
    [ -d "$DOT_FILES_DIR" ] || { echo "DOT_FILES_DIR is not a directory"; exit 1; }

    # copy configuration to $srcdir
    [ -f "$srcdir/install" ] && rm -f "$srcdir/install"
    [ -f "$srcdir/reinstall" ] && rm -f "$srcdir/reinstall"
    [ -f "$srcdir/uninstall" ] && rm -f "$srcdir/uninstall"

    IFS=$'\n'
    for group in $(find "$DOT_FILES_DIR" -mindepth 1 -maxdepth 1 -type d \! -name ".*" | sort)
    do
        for config in $(find "$group" -mindepth 1 -maxdepth 1 -type d \! -name ".*" | sort)
        do
            for dir in $(find "$config" -mindepth 1 -maxdepth 1 -type d \! -name ".*")
            do
                cp -Lnr --preserve=mode  -t "$srcdir" "$dir"
            done

            [ -f "$config/install" ] && cat "$config/install" >> "$srcdir/install"
            [ -f "$config/reinstall" ] && cat "$config/reinstall" >> "$srcdir/reinstall"
            [ -f "$config/uninstall" ] && cat "$config/uninstall" >> "$srcdir/uninstall"
        done
    done

    # run custom preparation scripts
    for script in $(find "$DOT_FILES_PKG_PREPARE" -type f -name "*.sh" 2> /dev/null | sort)
    do
        [ -x "$script" ] && "$script"
    done
}

package ()
{
    # create package tree
    mkdir -p -- "$pkgdir/usr/share/dot-files"
    mkdir -p -- "$pkgdir/usr/bin"

    # copy configuration to $pkgdir
    IFS=$'\n'
    for dir in $(find . -mindepth 1 -maxdepth 1 -type d \! -name ".*")
    do
        cp -Lnr --preserve=mode  -t "$pkgdir/usr/share/dot-files" "$dir"
    done

    # generate scripts

    # TODO
    # TODO: install hooks
}

