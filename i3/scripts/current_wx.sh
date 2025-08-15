#!/usr/bin/env bash
get_wx() {
	local cur_wx
	cur_wx=$(curl -s 'wttr.in/Huber+Heights?u&format=%c+%t+%w')
	echo "$cur_wx"
}
get_wx
