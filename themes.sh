#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh
############### Elementary theme ##################
add_ppa_repository "elementaryart/elementarydesktop"
update_apt
install_apt elementary-icon-theme elementary-theme gtk2-engines-equinox


############### Faenza icons ##################
add_ppa_repository "tiheum/equinox"
update_apt
install_apt faenza-icon-theme faenza-icons-mono equinox-theme #faenza-extras faenza-dark-extras 
upgrade_apt

#fix breadcrumb
gconftool --type bool --set /apps/nautilus/preferences/pathbar_like_breadcrumbs true
touch_dir ~/.themes/nautilus
copy_dir_contents_to ./home-folder-settings/.themes/nautilus ~/.themes/nautilus
nautilus -q
