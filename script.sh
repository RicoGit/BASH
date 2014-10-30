#!/bin/bash

echo 'test'

# wget -P /opt https://release.sublimegit.net/SublimeGit.zip
# unzip /opt/SublimeGit.zip -d ~/.config/sublime-text-3/Packages

# path to your tomcat
tomcat_home=/home/rico/webdev/haulmont/tomcat
# default site log
siteName=addlee


 	dateNow=`date "+%Y-%m-%d"`
    dateOfCreationLogFile=`date -r "$tomcat_home/logs/$siteName/app.log" "+%Y-%m-%d"`

    if [ "$dateNow" == "$dateOfCreationLogFile" ]
        then 
        	echo "$siteName/app.log exists"
        else
        	echo "create for today $siteName/app.log"
        	mv "$tomcat_home/logs/$siteName/app.log" "app.log.$dateNow" 
        	touch app.log    
    fi

echo 'done'	
echo "$dateNow"
echo "$dateOfCreationLogFile"	
