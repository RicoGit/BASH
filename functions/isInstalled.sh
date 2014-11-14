#!/bin/bash



function isInstalled {
	[ -z "$1" ] && echo '	*** app name required ' && exit 0
	
	if [ 0 -lt "$(dpkg -l | grep -w -c $1)" ] 
		then 
			pkdgInstalled=true
			echo "	*** $1 is already installed "
			echo "$(dpkg -l | grep -w $1)"
		else 
			echo "	*** $1 is not installed	"
			pkdgInstalled=false
	fi
}

isInstalled "$1"
