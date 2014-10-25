#!/bin/bash


# function isInstalled {
# 	echo "$1 is already installed.Skip installation."
# 	[ 1 -eq "$(dpkg -l | grep -c $1)" ] && echo 'true'
# }

# isInstalled rdesktop

echo '

XKBMODEL="pc105"
XKBLAYOUT="us,ru"
XKBVARIANT=","
XKBOPTIONS="grp:alt_shift_toggle,grp_led:scroll"

' > /etc/default/keyboard