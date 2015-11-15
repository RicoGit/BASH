#!/bin/bash

wget -O liquibase.tar.gz "https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.4.1/liquibase-3.4.1-bin.tar.gz"
mkdir /opt/liquibase
tar vxzf liquibase.tar.gz -C /opt/liquibase
rm liquibase.tar.gz

cd ~/
echo '
export LIQUIBASE_HOME=/opt/liquibase 
export PATH=$PATH:$LIQUIBASE_HOME
' >> .profile
source .profile

