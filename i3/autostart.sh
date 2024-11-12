#!/usr/bin/env bash
start() {
  [[ -z "$(pidof -x z"$1")" ]] && ${2:-$1} &
}

# Autostart applications
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# bar start
~/.config/i3/polybar-i3 &
# ~/.config/polybar/polybar-i3 &

# wallpaper
# feh --bg-max ~/.config/backgrounds/blackcat_1920x1080.png &
while true; do feh --bg-fill --no-fehbg --randomize ~/Pictures/wallpaper/*; sleep 600; done &

# compositor and notifications
picom --animations -b &
# picom -b &
numlockx off &
dunst &
lsusb | grep -iq blue && blueman-applet &

# Systray apps
nm-applet &
start volumeicon &
killall -q xfce4-power-manager
xfce4-power-manager --daemon

# Utilities in the background
udiskie &
start redshift -c ~/.config/redshift.conf &

# sxhkd
# sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
sxhkd -c ~/.config/i3/sxhkdrc &
