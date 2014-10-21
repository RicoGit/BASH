#picasa install
cd ~/ && wget http://dl.google.com/picasa/picasa39-setup.exe
WINEARCH=win32 winecfg
WINEARCH=win32 winetricks -q ie6
wine ~/picasa39-setup.exe