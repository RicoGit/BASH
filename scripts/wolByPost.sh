#!/bin/sh

targetIp=172.22.100.16
targetMac=00:1e:8c:f4:c8:06

#domain credentials
user=user
password=password

pingHost=https://ping.haulmont.com

if [ 0 -eq "$(dpkg -l | grep -w -c curl)" ]
		then
		echo '  *** Install dependencies ( curl ), for the first time '
        apt-get install -y curl
fi

curl -L --user "$user:$password" --data "ip=$targetIp&mac=$targetMac" "$pingHost" | grep -o '' && echo 'done'


