#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Cron scipt to rotate through wallpapers on Debian i3 systems.
# Dependencies : export DISPLAY variable
# Arguments    : See help() function for available options.
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 08 Dec 2024, Version: 1.1.24343
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
##########################################################################

set -eu

## Functions ##

home_or_away() {
	# local wifi
	# wifi=$(/sbin/iw dev wlp2s0 link | awk '/SSID/ {print $2}')
	# if [[ "$wifi" == "mosfanet" ]]; then
	if grep -w up /sys/class/net/enp0s31f6/operstate; then
		notify-send -t 2500 "Baqckgrounds" "Pictures/wallpaper"
	  while true
	  	do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*
	  done &
	else
		notify-send -t 2500 "Baqckgrounds" ".config/backgrounds"
	  while true
	  	do feh --bg-fill --no-fehbg --randomize /home/rick/.config/backgrounds/*
	  done &
	fi
}

home_nsfw() {
	notify-send -t 2500 "Baqckgrounds" "Pictures/wallpaper"
	while true
		do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*
	done &
}

home_sfw() {
	notify-send -t 2500 "Baqckgrounds" ".config/backgrounds"
	while true
		do feh --bg-fill --no-fehbg --randomize /home/rick/.config/backgrounds/*
	done &
}

main() {
	local_host="${HOSTNAME:-$(hostname)}"
	case "$local_host" in
		hp-858-g3 ) home_or_away ;;
		hp-8300 ) home_sfw ;;
		* ) home_nsfw
	esac
}

main "$@"
