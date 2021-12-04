#!/bin/sh

set_lang ()
{
    case "$1" in
        english) xkb-switch -s "$(xkb-switch -l | grep "^us")" ;;
        russian) xkb-switch -s "$(xkb-switch -l | grep "^ru")" ;;
    esac
}

case "$(xkb-switch -p)" in
    us*) CURRENT_LANG="english" ;;
    ru*) CURRENT_LANG="russian" ;;
esac

case "$1" in
    "") echo "$CURRENT_LANG" ;;
    english) set_lang "english" ;;
    russian) set_lang "russian" ;;
    toggle) [ "$CURRENT_LANG" = "english" ] && set_lang "russian" || set_lang "english" ;;
esac

