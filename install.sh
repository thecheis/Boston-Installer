#!/bin/bash 

# ---------------------------------------------------------------------------------------
# Description :	Install Boston icon theme and set it as default theme (user mode)
# Requirements:	GNOME 3.x desktop
# Author :		Christian Díaz
# eMail :		christiandiaz.design@gmail.com
# Website:		github.com/heychrisd/Boston-Installer
# License :		MIT
# ---------------------------------------------------------------------------------------

# This bash script must be run into downloaded Boston Icons directory. Open a terminal on it.
# Run with: ./install.sh
# Double click can run it without command prompt, but this method doesn't show any message.

set -e

# --------------------------------------DEFINITIONS--------------------------------------

ver=0.1.1

redback='\033[1;101m' #Red background
green='\033[1;32m' #Green font
bold='\033[1m' #Bold font
reset='\033[0m' #Reset font

# ----------------------------------------TEXTS------------------------------------------

function title {
	echo ""
	echo ""
	echo -e " ===================="	
	echo -e " $bold BOSTON - INSTALLER $reset | v$ver"
	echo -e " ===================="
	echo ""
}

function notFound {
	echo ""
	echo -e " $redback ERROR $reset Please run the script from Boston directory."
	echo ""
	echo ""
}

function noGNOME {
	echo ""
	echo -e " $redback Warning $reset GNOME isn't your desktop session. Icon theme change will not apply."
	echo " You must change it manually using desktop settings."
}

function ok {
	echo ""
	echo -e "$green Changes applied. $reset"
	echo " Files copied and setting up the icon theme on your GNOME desktop."
	echo ""
	echo -e " Boston Icons are ready to use. Enjoy!"
	echo ""
	echo ""
}

# ------------------------------------------RUN------------------------------------------

clear
title

echo " Hi, $USER"

#if [ ${PWD##*/} != "Boston" ]; then
#  notFound
#  exit 1
#fi

if [ $DESKTOP_SESSION != "gnome" ]; then
  noGNOME
fi

boston_dir="$HOME/.icons/Boston"
mkdir -p "${boston_dir}"

# Remove contents of output directory, if any
shopt -s nullglob dotglob  # Set to include hidden files
files=$(echo "${boston_dir}"/*)
if (( ${#files} )); then
  rm -r "${boston_dir}"/*
fi
shopt -u nullglob dotglob  # Unset to go back to normal

# Copy theme to output folder
cp -r * "${boston_dir}"

gsettings set org.gnome.desktop.interface icon-theme 'Boston'

ok

exit

