#!/usr/bin/env bash
# Autostart applications
# /usr/lib/x86_64-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1 &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
~/.local/bin/polybar-i3 &
# nitrogen --restore; sleep 1;
feh --bg-fill ~/.config/backgrounds/blackcat_1920x1080.png &
# while true; do feh --bg-fill --no-fehbg --randomize ~/Pictures/wallpaper/*; sleep 600; done &
picom -b &
udiskie &
numlockx on &
nm-applet &
volumeicon &
dunst &
lsusb | grep -iq blue && blueman-applet &

# sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
