#!/usr/bin/env bash
###############################################################################
# Script Name  : current_wx.sh
# Description  : Get current weather from wttr.in
# Dependencies : curl
# Arguments    : None
# Author       : Copyright © 2025, Richard B. Romig, Mosfanet
# Email        : rick.romig@gmail.com | rick.romig@mymetronet.com
# Created      : 22 Aug 2025
# Last updated : 22 Aug 2025
# Comments     :
# TODO (Rick)  :
# License      : GNU General Public License, version 2
# License URL  : https://github.com/RickRomig/scripts/blob/main/LICENSE
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

get_wx() {
	local cur_wx
	cur_wx=$(curl -s 'wttr.in/Huber+Heights?u&format=%c+%t+%w')
	echo "$cur_wx"
}
get_wx
