#!/bin/bash
export BROWSER=chromium
export DE=xfce
sudo VBoxClient-all &

SESSION=openbox-session

xmodmap ~/.config/xorg/.xmodmaprx

case $1 in
openbox)
	SESSION=openbox-session
	;;
wmii)
	SESSION=wmii
	;;
ratpoison)
	SESSION=ratpoison
	;;
esac

exec ck-launch-session dbus-launch ${SESSION}
#exec ck-launch-session dbus-launch ratpoison
#exec ck-launch-session dbus-launch wmii
# until wmii; do
#     true
# done
