#!/usr/bin/env bash

 echo '	*** Install robomongo'

 wget -P /opt http://robomongo.org/files/linux/robomongo-0.8.4-x86_64.deb
 sudo dpkg -i /opt/robomongo-0.8.4-x86_64.deb
 rm /opt/robomongo-0.8.4-x86_64.deb