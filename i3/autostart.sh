#!/usr/bin/env bash

start() {
  [[ -z "$(pgrep -f "$1")" ]] && ${2:-$1} &
}

# Autostart applications
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# status bar start
~/.config/polybar/polybar-i3 &

# Systray apps
nm-applet &
start volumeicon &
killall -q xfce4-power-manager
xfce4-power-manager --daemon
# xset -dpms
lsusb | grep -iq blue && blueman-applet &

# compositor and notifications
picom -b &
numlockx off &
dunst &

# sxhkd
# sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
sxhkd -c ~/.config/i3/sxhkdrc &

# Utilities in the background
pgrep udiskie &>/dev/null || udiskie &
pgrep -f redshift | xargs -n1 kill -9
redshift -c ~/.config/redshift.conf &

# wallpapers
pgrep -f backgrounds.sh &>/dev/null || ~/.config/i3/backgrounds.sh
