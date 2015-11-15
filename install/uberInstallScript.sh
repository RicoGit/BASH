#!/bin/bash


echo '	***	*** Install packages start.'

chmod 777 -R /opt

echo '	*** Delete default games'
apt-get -y purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy onboard
echo '	*** Delete amason, zeitgeist, orca '
apt-get -y purge unity-webapps-common
apt-get -y purge zeitgeist zeitgeist-core zeitgeist-datahub
apt-get -y purge gnome-orca

# удаляет неудалённые зависимости от уже удалённых пакетов
apt-get -y autoremove
# для очистки от пакетов .deb которые больше не используются
apt-get -y autoclean


echo '	*** *** Add repositories'
# skype repository
add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
# chrome repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# ubuntu tweak repository
add-apt-repository -y ppa:tualatrix/ppa 
# keepass repository
sudo apt-add-repository -y ppa:jtaylor/keepass


# update 
echo '	*** Upate'
apt-get -y update


echo '	*** Install skype'
apt-get -y install skype && apt-get -f install


echo '	*** Fix skype layout problem'
apt-get -y install gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 sni-qt:i386

echo '	*** Skype fonts fix - remove fonts-nanum'
apt-get -y purge fonts-nanum  

echo '	*** Install Chrome'
apt-get -y install google-chrome-stable

echo '	*** Install vlc'
apt-get -y install vlc 

echo '	*** Install vnstat, mc, openssh-server'
apt-get -y install vnstat mc openssh-server

echo '	*** Install Compiz '
apt-get -y install compizconfig-settings-manager compiz-plugins

echo '	*** Install nautilus-open-terminal'
apt-get -y install nautilus-open-terminal 

echo '	*** Install classicmenu-indicator'
apt-get -y install classicmenu-indicator

echo '	*** Install dconf-tools'		
apt-get -y install dconf-tools

echo '	*** Install codecs'
apt-get -y install ubuntu-restricted-extras

echo '	*** Install ubuntu-tweak'
apt-get -y install ubuntu-tweak
apt-get -y install unity-tweak-tool

echo '	*** Install dropbox'
apt-get -y install nautilus-dropbox

echo '	*** Install mail@cloud'
wget -P /opt/cloud https://desktopcloud.cdnmail.ru/linux/amd64/cloud 
echo '	* Add to autostart mail@cloud'
echo '[Desktop Entry]
Type=Application
Exec=/opt/cloud/cloud
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[ru]=mail@cloud
Name=mail@cloud' >> ~/.config/autostart/cloud.desktop

echo '	*** Install keepass2'
sudo apt-get -y install -y keepass2

echo '	*** Custom settings'
# start use swap only if RAM is used fro 90%
echo '\nvm.swappiness=10 \n' >> /etc/sysctl.conf
# всегда показывать адресснуюю строку в наутилусе
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
# при неработающий на русской раскладке hotkeys
#sudo apt-get install ibus-m17n
# открыть ibus и поставить "русский - kbd (m17n)"
#ibus-setup 

# http://www.linuxrussia.com/2014/04/ubuntu-1404.html
