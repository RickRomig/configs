#!/usr/bin/env bash
###############################################################################
# Script Name  : power.sh
# Description  : suspend, lock screen, logout, reboot, power off, kill user script using rofi
# Dependencies : rofi, i3lock
# Arguments    : none
# Author       : Copyright © 2025, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 18 Nov 2021
# Last updated : 12 Apr 2026
# Version      : 3.0.26102
# Comments     :
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

local_host="${HOSTNAME:-$(hostname)}"

declare -rA tux_image=(
    [hp-850-g3]="tux-1920x1080.png"
    [e6500-deb]="tux-1280x800.png"
    [e-475m]="tux-1280x800.png"
    [hp-2560p]="tux-1366x768.png"
    [probook-6570b]="tux-1366x768.png"
    [hp-8300-usdt]="tux-1680x1050.png"
    [hp-850-g3]="tux-1920x1080.png"
)

option=$(echo -e "suspend\nlock screen\nlogout\nreboot\npoweroff\nKill user $USER" | rofi -width 600 -dmenu -p system)
case $option in
    suspend)
        sudo /usr/bin/systemctl suspend ;;
    'lock screen')
        i3lock -c 000000 -i ~/.config/backgrounds/lockscreen/"${tux_image[$local_host]}" ;;
    logout)
        i3-nagbar -t warning -m 'Are you sure you want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit' ;;
    reboot)
        /usr/bin/systemctl reboot ;;
    poweroff)
        /usr/bin/systemctl poweroff ;;
    "kill user $USER")
        loginctl kill-user "$USER" ;;
esac
