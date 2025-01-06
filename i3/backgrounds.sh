#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Sscipt to rotate through wallpapers on Debian i3 systems.
# Dependencies : None
# Arguments    : None
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 06 Jan 2025
# Version      : 2.1.25006
# Comments     : Called at the end of autostart.sh
# License      : GNU General Public License, version 2.0
##########################################################################

set -eu

set_nsfw() {
	notify-send -t 3500 "Backgrounds" "NSFW"
	[[ -f /tmp/sfw-bg ]] && rm /tmp/sfw-bg
	[[ -f /tmp/nsfw-bg ]] || touch /tmp/nsfw-bg
	while true;	do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*; sleep 300; done &
}

set_sfw() {
	notify-send -t 3500 "Backgrounds" "SFW"
	[[ -f /tmp/nsfw-bg ]] && rm /tmp/nsfw-bg
	[[ -f /tmp/sfw-bg ]] || touch /tmp/sfw-bg
	while true;	do feh --bg-fill --no-fehbg --randomize /home/rick/.config/backgrounds/*;	sleep 300; done &
}

select_background() {
	local wifi wifi_int
	wifi_int=$(/usr/bin/nmcli dev | awk '/wifi / {print $1}')
	wifi="$(/sbin/iw dev "$wifi_int" link | awk '/SSID/ {print $2}')"
	if [[ "$wifi" == "mosfanet" ]]; then
		set_nsfw
	else
		set_sfw
	fi
}

main() {
	local local_host="${HOSTNAME:-$(hostname)}"
	case "$local_host" in
		hp-850-g3 )
			select_background ;;
		hp-8300 | hp-8300-usdt )
			set_sfw ;;
		* )
			if [[ -d /home/rick/Pictures/wallpaper ]]; then
				set_nsfw
			else
				set_sfw
			fi
	esac
}

main "$@"
