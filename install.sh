#!/bin/bash 

# ---------------------------------------------------------------------------------------
# Description :		Install Boston icon theme and set it as default theme (user mode)
# Requirements:		GNOME 3.x desktop
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

blueb='\033[01;44m' #Blue background & bold
green='\033[0;32m' #Green font
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
	echo -e "${green}* Boston Icons are ready to use. Enjoy!${reset}"
	echo ""
	echo ""
}

# ------------------------------------------RUN------------------------------------------

title

echo "Hi, $USER"

if [ ${PWD##*/} != "Boston" ]; then
  echo "Please run the script from the Boston/ directory"
  exit 1
fi

mkdir -p ~/.icons/Boston
cp -r /* ~/.icons/Boston/

gsettings set org.gnome.desktop.interface icon-theme 'Boston'

ok

exit

