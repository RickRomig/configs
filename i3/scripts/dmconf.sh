#!/usr/bin/env bash
###############################################################################
# Script Name  : dmconf.sh
# Description  : select from a list of config files to edit
# Dependencies : dmenu
# Arguments    : None
# Author       : Copyright © 2023, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 22 Nov 2023
# Last updated : 15 Aug 2025
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
###############################################################################

# Define text editor to use:
DMENUEDITOR="mousepad"

# array to choose from:
declare -a options=(
"aliases - $HOME/.bash_aliases"
"bashrc - $HOME/.bashrc"
"profile - $HOME/.profile"
"bat - $HOME/.config/bat/config"
"codium -$HOME/.config/VSCodium/User/settings.json"
"i3 autostart - $HOME/.config/i3/scripts/autostart.sh"
"i3 config - $HOME/.config/i3/config"
"i3 rules - $HOME/.config/i3/rules.conf"
"i3 workspaces - $HOME/.config/i3/workspaces.conf"
"kitty - $HOME/.config/kitty/kitty.conf"
"logout - $HOME/.config/i3/scripts/logout"
"micro - $HOME/.config/micro/settings.json"
"fastfetch - $HOME/.config/fastfetch/config.jsonc"
"polybar - $HOME/.config/polybar/config.ini"
"sxhkdrc - $HOME/.config/i3/sxhkdrc"
"quit"
)

# Pipe the array into dmenu
choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 15 -p 'Edit config:')

if [[ "$choice" == "quit" ]]; then
	echo "Program terminated." && exit
elif [[ "$choice" ]]; then
	cfg_path=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	[[ -f "$cfg_path" ]] || { printf "%s configuration not found.\n" "${cfg_path##*/}" >&2; exit 2; }
	"$DMENUEDITOR" "$cfg_path"
else
	echo "Program terminated."
fi
exit
