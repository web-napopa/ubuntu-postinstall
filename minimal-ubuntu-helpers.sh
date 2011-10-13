#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh

# basic GUI which DOESN'T run automatically, started by executing "startx" command 
input_two_choice "Install basic GUI  which DOESN'T run automatically, started by executing 'startx' command?" "y" "n"
if [ "$RET" == "y" ]
then
	install_apt fluxbox xinit thunar thunar-archive-plugin mrxvt python-software-properties mousepad
fi


#FIXME: detect whether the server is as vmware
# lib for rebuilding kernel (used when ubuntu is installed as virtual machine)
input_two_choice "Install dkms (lib for rebuilding kernel (used when ubuntu is installed as virtual machine))?" "y" "n"
if [ "$RET" == "y" ]
then
	install_apt dkms
fi


#FIXME: ubuntu specific
input_two_choice "Remove plymouth booting splashscreen?" "y" "n"
if [ "$RET" == "y" ]
then
	remove_apt plymouth-theme-xubuntu-logo
	remove_apt plymouth-theme-ubuntu-logo
	remove_apt plymouth-theme-ubuntu-text
	remove_apt plymouth-label
	remove_apt libxfce4util-bin xfce4-panel
fi
