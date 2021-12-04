#!/bin/sh

preview_image ()
{
    command -v image2text > /dev/null ||
        { echo "Error: image2text is not available"; exit 1; }

    [ "$2" ] && image2text -r -x $(tput cols) -y $(tput lines) -f $2 "$1" ||
        image2text -r -x $(tput cols) -y $(tput lines) "$1"
    return
}

if ! mime_type=$(file --mime-type "$1" -bLE); then mime_type=""; fi
case $mime_type in
    image/*)
        case $(echo $mime_type | tail -c +7) in
            jpeg|pjpeg) FORMAT=jpeg ;;
            png) FORMAT=png ;;
            gif) FORMAT=gif ;;
            tiff|x-tiff) FORMAT=tiff ;;
            x-portable-pixmap) FORMAT=ppm ;;
            x-portable-greymap) FORMAT=pgm ;;
            x-portable-bitmap) FORMAT=pbm ;;
        esac
        preview_image "$1" $FORMAT
        ;;
esac

