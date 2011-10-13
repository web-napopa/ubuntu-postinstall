#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh
source ./lib/basic.sh

#chrome development version - having latest Dev tools
add_ppa_repository "chromium-daily/beta"
update_apt

install_apt opera

source ./human.sh

# Eclipse IDE installation is not included because of its older version in the repository
info "* Don't forget to download Eclipse "
