#!/usr/bin/env bash
###############################################################################
# Script Name  : dmconf.sh
# Description  : Dmenu script to exit configuration files
# Dependencies : dmenu
# Arguments    : None
# Author       : Copyright © 2023, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 22 Nov 2023
# Last updated : 18 Feb 2026
# Version      : 2.3.26049
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

DMENUEDITOR="/usr/bin/mousepad"

declare -rA config_files=(
	[aliases]="$HOME/.bash_aliases"
	[bashrc]="$HOME/.bashrc"
	[profile]="$HOME/.profile"
	[bat]="$HOME/.config/bat/config"
	[codium]="$HOME/.config/VSCodium/User/settings.json"
	[i3-autostart]="$HOME/.config/i3/scripts/autostart.sh"
	[i3-config]="$HOME/.config/i3/config"
	[i3-rules]="$HOME/.config/i3/rules.conf"
	[i3-workspaces]="$HOME/.config/i3/workspaces.conf"
	[sxhkdrc]="$HOME/.config/i3/sxhkdrc"
	[kitty]="$HOME/.config/kitty/kitty.conf"
	[micro]="$HOME/.config/micro/settings.json"
	[fastfetch]="$HOME/.config/fastfetch/config.jsonc"
	[polybar]="$HOME/.config/polybar/config.ini"
	[logout]="$HOME/.config/i3/scripts/power.sh"
	[quit]="No configuration file selected."
)

main() {
	local choice cfg_path
	choice=$(printf '%s\n' "${!config_files[@]}" | dmenu -i -p 'Edit config:')
	[[ "$choice" == "quit" || -z "$choice" ]] && { notify-send -t 3600 "DMCONF" "No configuration file selected."; exit; }
	cfg_path="${config_files[$choice]}"
	[[ -f "$cfg_path" ]] || { notify-send -t 3600 "DMCONF" "$choice: ${cfg_path##*/} not found." >&2; exit 2; }
	"$DMENUEDITOR" "$cfg_path"
	exit
}

main "$@"
