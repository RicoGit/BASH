#!/bin/bash

echo "
deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
" > /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
sudo apt-key add -
sudo apt-get update

apt-get install postgresql-9.4