#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Sscipt to rotate through wallpapers on Debian i3 systems.
# Dependencies : None
# Arguments    : None
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 19 May 2025
# Version      : 2.5.25139
# Comments     : Called at the end of autostart.sh
# License      : GNU General Public License, version 2.0
##########################################################################

set -eu

set_nsfw() {
	local nsfw_dir="$1"
	notify-send -t 3500 "Backgrounds" "NSFW"
	[[ -f /tmp/sfw-bg ]] && rm /tmp/sfw-bg
	[[ -f /tmp/nsfw-bg ]] || touch /tmp/nsfw-bg
	while true;	do feh --bg-fill --no-fehbg --randomize "$nsfw_dir"/*; sleep 300; done &
}

set_sfw() {
	local sfw_dir="$1"
	notify-send -t 3500 "Backgrounds" "SFW"
	[[ -f /tmp/nsfw-bg ]] && rm /tmp/nsfw-bg
	[[ -f /tmp/sfw-bg ]] || touch /tmp/sfw-bg
	while true;	do feh --bg-fill --no-fehbg --randomize "$sfw_dir"/*;	sleep 300; done &
}

ethernet_status() {
	local eth
	eth=$(nmcli dev | awk '/ethernet/ {print $3}')
	[[ "$eth" == "connected" ]] && return 0 || return 1
}

select_background() {
	local local_host="${HOSTNAME:-$(hostname)}"
	local nsfw_dir="$1"
	local sfw_dir="$2"
	case "$local_host" in
		hp-850-g3 )
			if ethernet_status; then
				set_nsfw "$nsfw_dir"
			else
				set_sfw "$sfw_dir"
			fi
		;;
		hp-8300 | hp-8300-usdt | probook-6570b )
			set_sfw "$sfw_dir"
		;;
		* )
			if [[ -d "$nsfw_dir" ]]; then
				set_nsfw "$nsfw_dir"
			else
				set_sfw "$sfw_dir"
			fi
	esac
}

main() {
	local nsfw_dir="$HOME/Pictures/wallpaper"
	local sfw_dir="$HOME/.config/backgrounds"
	select_background "$nsfw_dir" "$sfw_dir"
}

main "$@"
