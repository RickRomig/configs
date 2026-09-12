#!/usr/bin/env bash
###############################################################################
# Script Name  : power.sh
# Description  : suspend, lock screen, logout, reboot, power off, kill user script using rofi
# Dependencies : rofi, i3lock
# Arguments    : none
# Author       : Copyright © 2025, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 18 Nov 2021
# Last updated : 12 Sep 2026
# Version      : 3.2.26255
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
###############################################################################
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
###############################################################################

screen=$(awk '/connected primary/ {print $4}' < <(xrandr) | cut -d'x' -f1); declare -ri screen

declare -rA tux_image=(
    [1280]="tux-1280x800.png"
    [1366]="tux-1366x768.png"
    [1680]="tux-1680x1050.png"
	[1440]="tux-1440x900.png"
    [1920]="tux-1920x1080.png"
)

option=$(echo -e "suspend\nlock-screen\nlogout\nreboot\npoweroff\nKill user $USER" | rofi -width 600 -dmenu -p system)
case $option in
    suspend)
        sudo /usr/bin/systemctl suspend ;;
    'lock-screen')
        /usr/bin/i3lock -c 000000 -i ~/.config/backgrounds/lockscreen/"${tux_image[$screen]}" ;;
    logout)
        /usr/bin/i3-nagbar -t warning -m 'Are you sure you want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit' ;;
    reboot)
        /usr/bin/systemctl reboot ;;
    poweroff)
        /usr/bin/systemctl poweroff ;;
    "kill user $USER")
        /usr/bin/loginctl kill-user "$USER" ;;
esac
