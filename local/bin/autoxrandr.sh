#!/usr/bin/env bash
if $(xrandr | grep -q "VGA1 disconnected"); then
	xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA1 --off
else
	xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA1 --mode 1440x900 --pos 1366x0 --rotate normal
fi
