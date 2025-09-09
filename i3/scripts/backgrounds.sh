#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Sscipt to set wallpaper directory
# Dependencies : feh
# Arguments    : None
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 08 Sep 2025
# Version      : 2.7.25251
# Comments     : Called at the end of autostart.sh
# License      : GNU General Public License, version 2.0
##########################################################################
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

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
	[[ "$(nmcli dev | awk '/ethernet/ {print $3}')" == "connected" ]] && return 0 || return 1
}

select_background() {
	local local_host="${HOSTNAME:-$(hostname)}"
	local nsfw_dir="$HOME/Pictures/wallpaper"
	local sfw_dir="$HOME/.config/backgrounds"
	local sfw_dir="$HOME/Pictures/backgrounds"
	case "$local_host" in
		hp-850-g3 )
			if ethernet_status; then
				set_nsfw "$nsfw_dir"
			else
				[[ -d "$HOME/Pictures/backgrounds" ]] || sfw_dir="$HOME/.config/backgrounds"
				set_sfw "$sfw_dir"
			fi
		;;
		hp-8300 | hp-8300-usdt | probook-6570b )
			[[ -d "$HOME/Pictures/backgrounds" ]] || sfw_dir="$HOME/.config/backgrounds"
			set_sfw "$sfw_dir"
			;;
		* )
			if [[ -d "$nsfw_dir" ]]; then
				set_nsfw "$nsfw_dir"
			else
			[[ -d "$HOME/Pictures/backgrounds" ]] || sfw_dir="$HOME/.config/backgrounds"
				set_sfw "$sfw_dir"
			fi
	esac
}

main() {
	select_background
}

main "$@"
