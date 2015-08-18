#!/bin/bash

echo '	*** Install mongo Db'

sudo apt-key -y adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get -y update
# install last version
sudo apt-get install -y mongodb-org
# if you need specific version
# more:  http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

# start server: sudo service mongod start
# check: ps aux | grep mongo
# run console: mongo

