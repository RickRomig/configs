#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Set wallpaper directory
# Dependencies : feh
# Arguments    : None
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 13 Jan 2026
# Version      : 3.0.26013
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

notify_nsfw() {
	# set flag files in /tmp
	[[ -f /tmp/new-bg ]] && rm /tmp/new-bg
	[[ -f /tmp/sfw-bg ]] && rm /tmp/sfw-bg
	[[ -f /tmp/nsfw-bg ]] || touch /tmp/nsfw-bg
	notify-send -t 3500 "Backgrounds" "Not Safe For Work"
}

notify_sfw() {
	# set flag files in /tmp
	[[ -f /tmp/new-bg ]] && rm /tmp/new-bg
	[[ -f /tmp/nsfw-bg ]] && rm /tmp/nsfw-bg
	[[ -f /tmp/sfw-bg ]] || touch /tmp/sfw-bg
	notify-send -t 3500 "Backgrounds" "Safe For Work"
}

notify_new() {
	# set flag files in /tmp
	[[ -f /tmp/sfw-bg ]] && rm /tmp/sfw-bg
	[[ -f /tmp/nsfw-bg ]] && rm /tmp/nsfw-bg
	[[ -f /tmp/new-bg ]] || touch /tmp/new-bg
	notify-send -t 3500 "Backgrounds" "New Install"
}

ethernet_status() {
	[[ $(awk '/ethernet/ {print $3}' <(nmcli dev)) == 'connected' ]] && return 0 || return 1
}

select_background() {
	local local_host="${HOSTNAME:-$(hostname)}"
	local bg_dir
	local bg_dirs=("$HOME/Pictures/wallpaper" "$HOME/Pictures/backgrounds" "$HOME/.config/backgrounds")
	case "$local_host" in
		hp-850-g3 )
			if ethernet_status; then
				if [[ -d "${bg_dirs[0]}" ]]; then
					bg_dir=${bg_dirs[0]}
					notify_nsfw
				elif [[ -d "${bg_dirs[1]}" ]]; then
					bg_dir=${bg_dirs[1]}
					notify_sfw
				else
					bg_dir=${bg_dirs[2]}
					notify_new
				fi
			else
				if [[ -d "${bg_dirs[1]}" ]]; then
					bg_dir=${bg_dirs[1]}
					notify_sfw
				else
					bg_dir=${bg_dirs[2]}
					notify_new
				fi
			fi
		;;
		hp-8300 | hp-8300-usdt | probook-6570b | hp-800-g1-dm | hp-800-g1-usdt | hp-6005 )
			if [[ -f "${bg_dirs[1]}" ]]; then
				bg_dir=${bg_dirs[1]}
				notify_sfw
			else
				bg_dir=${bg_dirs[2]}
				notify_new
			fi
			;;
		* )
			if [[ -d "${bg_dirs[0]}" ]]; then
				bg_dir=${bg_dirs[0]}
				notify_nsfw
			elif [[ -d "${bg_dirs[1]}" ]]; then
				bg_dir=${bg_dirs[1]}
				notify_sfw
			else
				bg_dir=${bg_dirs[2]}
				notify_new
			fi
	esac
	while true;	do feh --bg-fill --no-fehbg --randomize "$bg_dir"/*;	sleep 300; done &
}

main() {
	select_background
}

main "$@"
