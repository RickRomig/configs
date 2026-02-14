#!/usr/bin/env bash
###############################################################################
# Script Name  : autostart.sh
# Description  : i3 autostart script
# Dependencies : None
# Arguments    : None
# Author       : Copyright © 2025, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 18 Nov 2021
# Last updated : 14 Feb 2026
# Version      : 2.2.26045
# Comments     : New installs - sxhkdrc will be in i3 directory not sxhkd subdirectory
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
###############################################################################
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

start() {
  [[ -z "$(pgrep -f "$1")" ]] && ${2:-$1} &
}

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
~/.config/polybar/polybar-i3 &
nm-applet &
start volumeicon &
killall -q xfce4-power-manager
xfce4-power-manager --daemon
grep -iq blue <(lsusb) && blueman-applet &
picom -b &
numlockx off &
dunst &
# sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
sxhkd -c ~/.config/i3/sxhkdrc &
pgrep -f udiskie &>/dev/null || udiskie &
pgrep -f redshift | xargs -n1 kill -9
redshift -c ~/.config/redshift.conf &
# pgrep -f backgrounds.sh &>/dev/null || ~/.config/i3/backgrounds.sh
pgrep -f backgrounds.sh &>/dev/null || ~/.config/i3/scripts/backgrounds.sh
