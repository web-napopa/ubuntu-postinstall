#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#

#finding unmet dependancies by "apt-file search "
install_apt apt-file 

#versioning
install_apt git subversion bzr colordiff

#archive
install_apt unrar unzip
