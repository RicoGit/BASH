#!/bin/bash

function isInstalled {
	if [ 1 -lt "$(dpkg -l | grep -c $1)" ] # 1 < grep -c $1
		then 
			pkdgInstalled=true
			echo "	*** $1 is already installed. Skip installation ***	"
		else 
			pkdgInstalled=false
	fi
}

echo '	***	*** Install developers tools start ***'


echo '	*** *** Add repositories'
# openJdk8
add-apt-repository ppa:openjdk-r/ppa
# java oracle
add-apt-repository -y ppa:webupd8team/java 
# sublime
add-apt-repository -y ppa:webupd8team/sublime-text-3 
# classical menu
sudo apt-add-repository ppa:diesch/testing
# update
apt-get -y update 

echo '	*** Install oracle JDK 7, 8'
# openJdk need for idea (nice font)
apt-get -y install openjdk-8-jdk 
#apt-get -y install oracle-java7-installer
apt-get -y install oracle-java8-installer
# make java 7 as default
update-java-alternatives -s java-8-oracle

#echo '	*** Install groovy 2.3.7'
#wget -P /opt http://dl.bintray.com/groovy/maven/groovy-sdk-2.3.7.zip
#unzip /opt/groovy-sdk-2.3.7 -d /opt
#mv /opt/groovy-2.3.7 /opt/groovy
#echo -e "\n export GROOVY_HOME=/opt/groovy" >> ~/.profile

echo '	*** Install Git and giggle'
apt-get -y install git giggle

#echo '	*** Install Svn'
#apt-get -y install subversion

echo '	*** Install Maven'
apt-get install maven

echo '	*** Install Sublime text 3'
apt-get -y install sublime-text-installer

echo '	*** Install gradle'
wget -P /opt https://services.gradle.org/distributions/gradle-2.1-all.zip
unzip /opt/gradle-2.1-all.zip -d /opt
mv /opt/gradle-2.1 /opt/gradle
echo -e "\n export GRADLE_HOME=/opt/gradle" >> ~/.profile

echo '  *** Insall curl'
apt-get -y install curl

echo '	*** Install rdesktop'
isInstalled rdesktop
[ "$pkdgInstalled" == 'false' ] && apt-get -y install rdesktop

echo '	*** Install openVpn'
isInstalled openvpn
[ "$pkdgInstalled" == 'false' ] && apt-get -y install openvpn

echo '	***Install dia'
apt-get -y install dia

# todo run ./mongoDb

# dir for my bash and groovy scripts
mkdir /opt/myscript
# add all path (groovy, gradle, idea, myscript)
echo -e "\n export PATH=$PATH:/opt/groovy/bin:/opt/gradle/bin:/opt/idea/bin:/opt/myscript" >> ~/.profile


echo '	*** make sublime text default editor'
sed -i.bak s/gedit.desktop/sublime_text.desktop/g /usr/share/applications/defaults.list


# решение проблемы с неработающими хоткеями в idea

IDEA_HOME=/opt/idea
wget -P "$IDEA_HOME/lib" https://github.com/zheludkovm/LinuxJavaFixes/blob/master/build/LinuxJavaFixes-1.0.0-SNAPSHOT.jar?raw=true
mv "$IDEA_HOME/lib/LinuxJavaFixes-1.0.0-SNAPSHOT.jar?raw=true" "$IDEA_HOME/lib/LinuxJavaFixes-1.0.0-SNAPSHOT.jar"
wget -P "$IDEA_HOME/lib" https://github.com/zheludkovm/LinuxJavaFixes/blob/master/build/javassist-3.12.1.GA.jar?raw=true
mv "$IDEA_HOME/lib/javassist-3.12.1.GA.jar?raw=true" "$IDEA_HOME/lib/javassist-3.12.1.GA.jar"
echo '
### hotkeys fix ##
-javaagent:'"$IDEA_HOME"'/lib/LinuxJavaFixes-1.0.0-SNAPSHOT.jar
### end of hotkeys fix2 ###' >> "$IDEA_HOME/bin/idea64.vmoptions"

apt-get -y autoremove
source ~/.profile
