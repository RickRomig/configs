#!/usr/bin/env bash
start() {
  [[ -z "$(pidof -x z"$1")" ]] && ${2:-$1} &
}

# Autostart applications
# /usr/lib/x86_64-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1 &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
~/.config/polybar/polybar-i3 &
# nitrogen --restore; sleep 1;
# feh --bg-max ~/.config/backgrounds/blackcat_1920x1080.png &
while true; do feh --bg-fill --no-fehbg --randomize ~/Pictures/wallpaper/*; sleep 600; done &

# Systray apps
nm-applet &
start volumeicon &
lsusb | grep -iq blue && blueman-applet &
killall -q xfce4-power-manager
xfce4-power-manager --daemon

# Utilities in the background
picom -b &
udiskie &
numlockx off &
dunst &
redshift -c ~/.config/redshift.conf &

# sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
