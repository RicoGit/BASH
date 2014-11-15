#!/bin/sh

yourMacAddress=00:1e:8c:f4:c8:06
shamrockSubnetwork=172.22.100.16

	if [ 0 -eq "$(dpkg -l | grep -w -c curl)" ]
		then
		echo '  *** Install dependencies ( curl ), for the first time '
        apt-get install -y curl
	fi

wakeonlan -i "$shamrockSubnetwork" "$yourMacAddress"

# 30 8 * * 2-5 /opt/woleNatile