#!/bin/bash
export BROWSER=chromium
export DE=openbox

SESSION=ratpoison

xmodmap ~/.config/xorg/.xmodmaprx

case $1 in
openbox)
	SESSION=openbox-session
	;;
ratpoison)
	SESSION=ratpoison
	;;
esac

exec dbus-launch ${SESSION}

#exec ck-launch-session dbus-launch ${SESSION}
#exec ck-launch-session dbus-launch ratpoison
#exec ck-launch-session dbus-launch wmii
# until wmii; do
#     true
# done
