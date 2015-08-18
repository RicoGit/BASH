#!/bin/bash
wget http://www.scala-lang.org/files/archive/scala-2.11.4.deb
dpkg -i scala-2.11.4.deb
apt-get update
apt-get install scala
rm scala-2.11.4.deb

 
# sbt installation

wget http://dl.bintray.com/sbt/debian/sbt-0.13.6.deb
sudo dpkg -i sbt-0.13.6.deb
sudo apt-get update
sudo apt-get install sbt