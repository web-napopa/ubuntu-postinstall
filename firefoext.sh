#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh

FIREFOX_PROFILE_DIR=`find ~/.mozilla/firefox -iname *default`
FIREFOX_EXTENSIONS_DIR="$FIREFOX_PROFILE_DIR/extensions"
touch_dir $FIREFOX_EXTENSIONS_DIR
wget --output-document="$FIREFOX_EXTENSIONS_DIR/firebug.xpi" https://addons.mozilla.org/en-US/firefox/downloads/latest/1843/addon-1843-latest.xpi?src=addondetail
wget --output-document="$FIREFOX_EXTENSIONS_DIR/detect-js-libraries.xpi" https://addons.mozilla.org/en-US/firefox/downloads/latest/10083/addon-10083-latest.xpi
wget --output-document="$FIREFOX_EXTENSIONS_DIR/webdev-toolbar.xpi" https://addons.mozilla.org/en-US/firefox/downloads/latest/60/addon-60-latest.xpi?src=developers
wget --output-document="$FIREFOX_EXTENSIONS_DIR/adblock-plus.xpi" https://addons.mozilla.org/en-US/firefox/downloads/latest/1865/addon-1865-latest.xpi
wget --output-document="$FIREFOX_EXTENSIONS_DIR/adblock-plus-element-hider.xpi" https://addons.mozilla.org/en-US/firefox/downloads/latest/4364/addon-4364-latest.xpi?src=addondetail
