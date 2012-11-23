#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh
source ./lib/basic.sh

############### Compiz control panel & Synaptic ##################
#(first as you can spend your time setting options while install is done)
install_apt compizconfig-settings-manager compiz-plugins-extra synaptic

############## Dash #############
add_ppa_repository "atareao/atareao"
update_apt
install_apt power-commands #shutdown, logoff, etc from dash

############### Ease of use ##################
install_apt easystroke earcandy git-gui #synapse
###### Easy stroke settings and automatic startup
cp -r ./home-folder-settings/.easystroke ~/
touch_dir ~/.config/autostart
copy_file ./home-folder-settings/.config/autostart/easystroke.desktop ~/.config/autostart/easystroke.desktop

##################### Editing files #####################
install_apt gedit-plugins 

##################### Browsing files ####################
####### Add browsing files related repos
add_ppa_repository "gloobus-dev/gloobus-preview"
#add_ppa_repository "synapse-core/ppa"
update_apt
####### Install browsing files related packages
install_apt nautilus-open-terminal nautilus-gksu nautilus-ideviceinfo nautilus-filename-repairer nautilus-actions eog-plugins libswfdec-0.8-0 libgsf-bin imagemagick gnash gnome-raw-thumbnailer gnome-xfc-thumbnailer ooo-thumbnailer gnome-exe-thumbnailer deb-thumbnailer ffmpegthumbnailer gnome-xcf-thumbnailer unoconv
install_apt gloobus-preview
#### gloobus-preview settings
touch_dir ~/.config/gloobus
copy_file ./home-folder-settings/.config/gloobus/gloobus-preview.cfg ~/.config/gloobus/gloobus-preview.cfg
#### .psd EOG preview & thumbnails
add_ppa_repository "koinoba/ppa"
update_apt
install_apt libgdk-pixbuf2.0-psd

echo "$(cat /usr/share/thumbnailers/evince.thumbnailer)image@vnd.adobe.photoshop;" > /usr/share/thumbnailers/evince.thumbnailer

#### REPLACE Nautilus with Nautilus Elementary
#add_ppa_repository "am-monkeyd/nautilus-elementary-ppa"
#
#update_apt
#upgrade_apt
#nautilus -q

############### Ubuntu tweak ##################
add_ppa_repository "tualatrix/ppa"
update_apt
install_apt ubuntu-tweak

############### Gnome config editor ##################
#install_apt dconf-tools

############### Bootloader config ##################
add_ppa_repository "ingalex/super-boot-manager"
update_apt
install_apt buc super-boot-manager


############### Java ##################
input_two_choice "Install SUN java?" "y" "n"
if [ "$RET" == "y" ]
then
	install_apt sun-java6-jre
fi


############### Enable changing keyboard shorcuts by hovering with the mouse over the file menu of the gnome-based application ##################
gsettings set org.gnome.desktop.interface can-change-accels true

############### Chrome browser ##################
install_apt chromium-browser-l10n

############### Cleans unwanted software ##################
remove_apt gbrainy aisleriot gnome-mahjongg gnomine quadrapassel gnome-sudoku shotwell tomboy
#remove totem
remove_apt totem-common
#evolution removal
input_two_choice "Remove evolution?" "y" "n"
if [ "$RET" == "y" ]
then
	remove_apt evolution-common evolution-indicator libevolution
fi

#openoffice removal
input_two_choice "Remove OpenOffice?" "y" "n"
if [ "$RET" == "y" ]
then
	remove_apt openoffice.org-common openoffice.org-l10n-common openoffice.org-thesaurus-en-au openoffice.org-thesaurus-en-us kdelibs5-data
fi

#libreoffice removal
input_two_choice "Remove LibreOffice?" "y" "n"
if [ "$RET" == "y" ]
then
	remove_apt libreoffice-core
fi

# cleans unnecessary software
sudo apt-get autoremove
