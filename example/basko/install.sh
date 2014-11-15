#mkdir /prj
#chmod 777 /prj
#mkdir /prj/ubuntu

apt-get -y autoremove
apt-get -y purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy onboard

#skype repository
add-apt-repository --yes "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
#google-chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

add-apt-repository --yes ppa:diodon-team/stable ppa:webupd8team/sublime-text-3
#codecs for openshot
add-apt-repository --yes ppa:jon-severinsson/ffmpeg
apt-get update

apt-get -y install diodon sublime-text-installer git gitk gxneur aspell-ru google-chrome-stable

echo 'install skype'
apt-get -y install skype
echo 'skype fonts fix - remove fonts-nanum'
apt-get -y purge fonts-nanum  

#add sublimetext to path
echo -e "\n export PATH=\$PATH:/opt/sublime_text" >> ~/.profile

#echo 'install file manager krusader, system settings required for switch off sound'
#apt-get -y install krusader
#apt-get -y install systemsettings

apt-get -y install vlc 
apt-get -y install openshot ffmpeg hugin wine winetricks gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad

apt-get -y install vnstat mc openssh-server xrdp

#echo 'install russian language'
#apt-get -y install language-pack-ru language-pack-gnome-ru language-pack-ru-base language-pack-gnome-ru-base

echo 'configuration - show xneural icon on tray'
gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"
echo 'the same for ubuntu 14'
apt-add-repository --yes ppa:gurqn/systray-trusty
apt-get -y update
apt-get -y upgrade


echo 'disable login sounds'
mv /usr/share/sounds/ubuntu/stereo/system-ready{,-disabled}.ogg
mv /usr/share/sounds/ubuntu/stereo/desktop-login{,-disabled}.ogg

echo 'make sublime text default editor'
sed -i.bak s/gedit.desktop/sublime_text.desktop/g /usr/share/applications/defaults.list

echo 'PUT - desktop plugin '
apt-get -y install compizconfig-settings-manager compiz-plugins

echo 'install file manager'
apt-get -y install konqueror
echo 'open konqueror as file manager'
sed -i.bak s/webbrowsing/filemanagement/g /usr/bin/gyazo /usr/share/applicatoins/kde4/konqbrowser.desktop

#shutdown window gnome-session-quit --power-off --force

#echo 'date time settings'
#sed -i.bak s/LC_TIME=\"en_US.UTF-8\"/LC_TIME=\"ru_RU.UTF-8\"/g /etc/default/locale
#dpkg-reconfigure locales

#amount of desktops
#gconftool --get /apps/compiz-1/general/screen0/options/hsize 
#gconftool --set /apps/compiz-1/general/screen0/options/hsize --type=int 3

#echo 'asus keyboard backlight - switch off on startup'
#sudo su
#echo -e "\nchown vadim:vadim /sys/class/leds/asus::kbd_backlight/brightness" >> /etc/init.d/rc.local
#echo -e "\necho 0 > /sys/class/leds/asus::kbd_backlight/brightness" >> ~/.profile
