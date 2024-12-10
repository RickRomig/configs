#!/usr/bin/env bash

start() {
  [[ -z "$(pidof -x "$1")" ]] && ${2:-$1} &
}

# shellcheck disable=SC2009
start_feh() {
  ps -aux | grep -v 'grep' | grep 'backgrounds.sh' || ~/.config/i3/backgrounds.sh
}

# Autostart applications
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# bar start
~/.config/i3/polybar-i3 &
# ~/.config/polybar/polybar-i3 &

# Systray apps
nm-applet &
start volumeicon &
killall -q xfce4-power-manager
xfce4-power-manager --daemon
lsusb | grep -iq blue && blueman-applet &

# compositor and notifications
picom -b &
numlockx off &
dunst &

# sxhkd
# sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
sxhkd -c ~/.config/i3/sxhkdrc &

# Utilities in the background
udiskie &
start redshift -c ~/.config/redshift.conf &

# wallpaper
start_feh
# feh --bg-max ~/.config/backgrounds/blackcat_1920x1080.png &
