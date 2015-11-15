#!/bin/bash

echo "
deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5.3.1 contrib
deb-src http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5.3.1 contrib
" > /etc/apt/sources.list.d/cloudera.list

apt-get update

echo "
Package: *
Pin: release o=Cloudera, l=Cloudera
Pin-Priority: 501
" > /etc/apt/preferences.d/cloudera.pref

wget http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key -O archive.key
apt-key add archive.key

apt-get install -y hadoop-client
apt-get install -y spark-core spark-master spark-worker spark-history-server

addgroup hadoop
adduser --ingroup hadoop hdfs
adduser hdfs sudo
