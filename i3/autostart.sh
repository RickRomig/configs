#!/usr/bin/env bash

# for hp-850-g3
# wifi_ssid=$(/sbin/iw dev wlp2s0 link | awk '/SSID/ {print $2}')

start() {
  [[ -z "$(pidof -x "$1")" ]] && ${2:-$1} &
}

run_feh() {
  local wifi_ssid
  wifi_ssid=$(/sbin/iw dev wlp2s0 link | awk '/SSID/ {print $2}')
  if [[ "$wifi_ssid" == "mosfanet" ]]; then
    while true; do feh --bg-fill --no-fehbg --randomize ~/Pictures/wallpaper/*; sleep 300; done &
  else
    while true; do feh --bg-fill --no-fehbg --randomize ~/.config/backgrounds/*; sleep 300; done &
  fi
}

# Autostart applications
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# bar start
~/.config/i3/polybar-i3 &
# ~/.config/polybar/polybar-i3 &
# wallpaper
# [[ -z "$(pidof -x feh)" ]] && run_feh
[[ -z "$(pidof -x feh)" ]] && while true; do feh --bg-fill --no-fehbg --randomize ~/Pictures/wallpaper/*; sleep 300; done &
# feh --bg-max ~/.config/backgrounds/blackcat_1920x1080.png &

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
