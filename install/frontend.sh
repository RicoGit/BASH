#!/bin/bash


echo '	***Install nodejs'
apt-get install -y nodejs
ln -s /usr/bin/nodejs /usr/bin/node

echo '	***Install npm'
apt-get install -y npm

echo '	***Install nginx'
echo -e '
    deb http://nginx.org/packages/ubuntu/ trusty nginx
    deb-src http://nginx.org/packages/ubuntu/ trusty nginx
' >> /etc/apt/sources.list

apt-get update
apt-get -y install nginx