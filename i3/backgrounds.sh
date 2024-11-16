#!/usr/bin/env bash
##########################################################################
# Script Name  : backgrounds.sh
# Description  : Cron scipt to rotate through wallpapers on Debian i3 systems.
# Dependencies : export DISPLAY variable
# Arguments    : See help() function for available options.
# Author       : Copyright © 2024 Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.net
# Created      : 13 Nov 2024
# Last updated : 13 Nov 2024, Version: 1.0.24318
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
##########################################################################

set -eu

## Functions ##

home_or_away() {
	local wifi
	wifi=$(/sbin/iw dev wlp2s0 link | awk '/SSID/ {print $2}')
	if [[ "$wifi" == "mosfanet" ]]; then
	  while true
	  	do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*
	  done &
	else
	  while true
	  	do feh --bg-fill --no-fehbg --randomize /home/rick/.config/backgrounds/*
	  done &
	fi
}

home_only() {
	while true
		do feh --bg-fill --no-fehbg --randomize /home/rick/Pictures/wallpaper/*
	done &
}

home_or_away
# home_only
