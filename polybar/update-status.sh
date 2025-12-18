#!/usr/bin/env bash
# Polybar module to check for updates
# sources: https://github.com/x70b1/polybar-scripts, https://github.com/raven2cz/polybar-config/blob/main/scripts/check-all-updates.sh
updates=$(apt-get upgrade -s | awk '/newly/ {print $1}');echo "$updates"
