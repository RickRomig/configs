#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Cron scipt to rotate through wallpapers on Debian i3 systems.
# Dependencies : export DISPLAY variable
# Arguments    : See help() function for available options.
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 16 Dec 2024, Version: 1.3.24352
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
##########################################################################

set -eu

home_or_away() {
	local wifi
	wifi="$(/sbin/iw dev wlp2s0 link | awk '/SSID/ {print $2}')"
	if [[ "$wifi" == "mosfanet" ]]; then
		notify-send -t 3500 "Backgrounds" "NSFW"
		[[ -f /tmp/nsfw-bg ]] || touch /tmp/nsfw-bg
		[[ -f /tmp/sfw-bg ]] && rm /tmp/sfw-bg
	  while true;	do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*; sleep 300; done &
	else
		notify-send -t 2500 "Backgrounds" "SFW"
		[[ -f /tmp/sfw-bg ]] || touch /tmp/sfw-bg
		[[ -f /tmp/nsfw-bg ]] && rm /tmp/nsfw-bg
  while true;	do feh --bg-fill --no-fehbg --randomize /home/rick/.config/backgrounds/*;	sleep 300; done &
	fi
}

home_nsfw() {
	notify-send -t 3500 "Backgrounds" "NSFW"
	[[ -f /tmp/sfw-bg ]] && rm /tmp/sfw-bg
	touch /tmp/nsfw-bg
	while true;	do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*; sleep 300; done &
}

home_sfw() {
	notify-send -t 3500 "Backgrounds" "SFW"
	[[ -f /tmp/nsfw-bg ]] && rm /tmp/nsfw-bg
	touch /tmp/sfw-bg
	while true;	do feh --bg-fill --no-fehbg --randomize /home/rick/.config/backgrounds/*;	sleep 300; done &
}

main() {
	local_host="${HOSTNAME:-$(hostname)}"
	case "$local_host" in
		hp-850-g3 ) home_or_away ;;
		hp-8300 ) home_sfw ;;
		* ) home_nsfw ;;
	esac
}

main "$@"
