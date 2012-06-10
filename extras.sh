#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh
############### Elementary theme ##################
install_apt vlc minitube skype

############### Skype integration #################
add_ppa_repository "skype-wrapper/ppa"
update_apt
install_apt skype-wrapper
remove_apt sni-qt "sni-qt:i386"
cp ./templates/skype.desktop /usr/share/applications/skype.desktop
