#!/usr/bin/env bash
###############################################################################
# Script Name  : keyhelper.sh
# Description  : Display i3 keybindings from a file.
# Dependencies : None
# Arguments    : None
# Author       : Copyright © 2025, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 14 Jun 2025
# Last updated : 14 Jun 2025
# Version      : 2.0.25165
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2.0
###############################################################################

# shellcheck disable=SC2034
# bold=$(tput bold)
# normal=$(tput sgr0)

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Directory where the script is located
script_dir=$(dirname "$(realpath "$0")")

# Path to the custom text file (relative to the script's directory)
custom_bindings_file="$script_dir/keybinds.txt"

# Check if the custom file exists
if [ -f "$custom_bindings_file" ]; then
	{
		while IFS= read -r line; do
			if [[ "$line" == "${line^^}" ]]; then
				echo -e "${RED}${line}${NC}"
			else
				echo "$line"
			fi
		done < "$custom_bindings_file"
	} | less -R -P '[more]'
else
	echo "Custom bindings file not found: $custom_bindings_file"
fi
