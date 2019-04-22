#!/bin/bash 

# ---------------------------------------------------------------------------------------
# Description :		Install Boston icon theme and set it as default theme (user mode)
# Requirements:		GNOME desktop
# Author :		Chris D
# eMail :		christiandiaz.design@gmail.com
# ---------------------------------------------------------------------------------------

# This bash script must be run into downloaded Boston Icons directory.
# To give permissions (if is neccessary): chmod +x ./install.sh
# Open a terminal on it and run ./install.sh
# Double click can run it without command prompt, but this method doesn't show any message.


ver=0.1
move= cd .. && mv ./Boston ~/.icons
setBoston= gsettings set org.gnome.desktop.interface icon-theme 'Boston'

blueb='\033[01;44m' #Blue backgroud & bold
geen='\033[0;32m' #Green font
bold='\033[1m' #Bold font
reset='\033[0m' #Reset font

function ok {
	echo ""
	echo ""
	echo -e "${blueb}                      ${reset}"	
	echo -e "${blueb}  BOSTON - INSTALLER  ${reset} | v$ver"
	echo -e "${blueb}                      ${reset}"
	echo ""
	echo -e "* Changes applied: files moved and setting up the icon theme on your desktop."
	echo -e "${geen}* Boston Icons are ready to use. Enjoy!${reset}"
	echo ""
	echo ""
}

if [ -d ~/.icons ];
then
	$move
	$setBoston
	ok
else
	mkdir ~/.icons && $move
	$setBoston 
	ok
fi

exit
