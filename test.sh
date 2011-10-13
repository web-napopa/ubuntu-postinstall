#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh
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
