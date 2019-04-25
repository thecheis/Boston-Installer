#!/bin/bash 

# ---------------------------------------------------------------------------------------
# Description :		Install Boston icon theme and set it as default theme (user mode)
# Requirements:		GNOME desktop
# Author :		Chris D
# eMail :		christiandiaz.design@gmail.com
# Website:		github.com/heychrisd/Boston-Installer
# License :		BSD - 2 Clause
# ---------------------------------------------------------------------------------------

# This bash script must be run into downloaded Boston Icons directory. Open a terminal on it.
# To give permissions: chmod +x ./install.sh
# Run with: ./install.sh
# Double click can run it without command prompt, but this method doesn't show any message.


# --------------------------------------DEFINITIONS--------------------------------------

ver=0.1
folder=$(pwd)
move= cd .. && cp -rf $folder ~/.icons && rm -rf $folder
setBoston= gsettings set org.gnome.desktop.interface icon-theme 'Boston'

blueb='\033[01;44m' #Blue backgroud & bold
geen='\033[0;32m' #Green font
bold='\033[1m' #Bold font
reset='\033[0m' #Reset font

function title {
	echo ""
	echo ""
	echo -e "${blueb}                      ${reset}"	
	echo -e "${blueb}  BOSTON - INSTALLER  ${reset} | v$ver"
	echo -e "${blueb}                      ${reset}"
	echo ""
}

function ok {
	echo ""
	echo -e "* Changes applied: files moved and setting up the icon theme on your GNOME desktop."
	echo -e "${geen}* Boston Icons are ready to use. Enjoy!${reset}"
	echo ""
	echo ""
}

# ------------------------------------------RUN------------------------------------------

clear
title

echo "Hi, $USER"

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
