#!/bin/bash

#depricated use cloudera_hadoop_spark.sh

addgroup hadoop
adduser --ingroup hadoop hdfs
adduser hdfs sudo

wget http://apache-mirror.rbc.ru/pub/apache/hadoop/common/hadoop-2.5.2/hadoop-2.5.2.tar.gz 
tar vxzf hadoop-2.5.2.tar.gz -C /usr/local
rm hadoop-2.5.2.tar.gz
cd /usr/local
mv hadoop-2.5.2 hadoop
chown -R hdfs:hadoop hadoop

cd ~/
echo '
export HADOOP_INSTALL=/usr/local/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
' >> .bashrc

source .bashrc