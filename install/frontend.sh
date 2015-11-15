#!/bin/bash


echo '	***Install nodejs'
apt-get install -y nodejs
ln -s /usr/bin/nodejs /usr/bin/node

echo '	***Install npm'
apt-get install -y npm