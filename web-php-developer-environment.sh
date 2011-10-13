#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh
source ./lib/basic.sh

#image editing
install_apt imagemagick 

#font editing
install_apt fontforge fontforge-extras potrace fontforge-doc python-fontforge

#url handling
install_apt curl 

#### web server ####
#basic
install_apt apache2 php5 libapache2-mod-php5 php5-cli mysql-server mysql-client libapache2-mod-auth-mysql php5-mysql
#PEAR
install_apt php-pear
#Image editing
install_apt php-gd php5-imagick
#International characters in the DNS system
install_apt php5-idn
#International characters in the DNS system
install_apt php5-idn
#Mail
install_apt php5-imap
#Cryptography
install_apt php5-mcrypt
#Flash edit/create
install_apt php5-ming
#Manage remote devices via the Simple Network Management Protocol.
install_apt php5-snmp
#Covert file ecnoding
install_apt php5-recode
#Spellchecking
install_apt php5-pspell
#PostScript edit/create
install_apt php5-ps
#Clean traverse HTML
install_apt php5-tidy
#XML-RPC functions
php5-xmlrpc
#XSLT transformations
php5-xsl 
#Debug
install_apt php5-xdebug
#Caching
install_apt php5-memcache php-apc
pecl upgrade apc

#enable mod_rewrite
sudo a2enmod rewrite
restart_apache

#phpmyadmin
install_apt phpmyadmin

#phpmyadmin is now accesible through http://localhost/phpmyadmin
make_shortcut "/usr/share/phpmyadmin/" "/var/www/phpmyadmin"

#install firephp
sudo pear channel-discover pear.firephp.org
sudo pear install firephp/FirePHPCore 

#install symfony
sudo pear upgrade PEAR
#sudo pear channel-discover pear.symfony-project.com
#sudo pear install symfony/symfony

#webmin - Server administration
remove_apt_source "http://download.webmin.com/download/repository"
add_apt_source "deb http://download.webmin.com/download/repository sarge contrib\ndeb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" "webmin-download"
wget_apt_key "http://www.webmin.com/jcameron-key.asc"
update_apt
install_apt webmin
input_pass "Provide a password for webmin"
sudo /usr/share/webmin/changepass.pl /etc/webmin root $RET
RET=''



#### SERVER SETTINGS ###
replace_ini_entry --file "/etc/apache2/apache2.conf" --search-raw "ServerName" --replacement-raw "ServerName 127.0.0.1" --replacement-escaped "ServerName 127\.0\.0\.1"
# no limit:
# memory_limit = -1"
phpIniFilePath="/etc/php5/apache2/php.ini"
replace_ini_entry --file "$phpIniFilePath" --search-raw "error_reporting" --replacement-raw "error_reporting = E_ALL | E_STRICT "
replace_ini_entry --file "$phpIniFilePath" --search-raw "memory_limit" --replacement-raw "memory_limit = 128M"
replace_ini_entry --file "$phpIniFilePath" --search-raw "html_errors" --replacement-raw "html_errors = On"
replace_ini_entry --file "$phpIniFilePath" --search-raw "magic_quotes_gpc" --replacement-raw"magic_quotes_gpc = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "magic_quotes_runtime" --replacement-raw "magic_quotes_runtime = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "magic_quotes_sybase" --replacement-raw "magic_quotes_sybase = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "upload_max_filesize" --replacement-raw "upload_max_filesize = 200M"
replace_ini_entry --file "$phpIniFilePath" --search-raw "max_input_time" --replacement-raw "max_input_time = 180"
replace_ini_entry --file "$phpIniFilePath" --search-raw "post_max_size" --replacement-raw "post_max_size = 200M"
replace_ini_entry --file "$phpIniFilePath" --search-raw "max_execution_time" --replacement-raw "max_execution_time = 180"
replace_ini_entry --file "$phpIniFilePath" --search-raw "max_file_uploads" --replacement-raw "max_file_uploads = 50"
replace_ini_entry --file "$phpIniFilePath" --search-raw "display_errors" --replacement-raw "display_errors = On"
replace_ini_entry --file "$phpIniFilePath" --search-raw "short_open_tag" --replacement-raw "short_open_tag = On"
replace_ini_entry --file "$phpIniFilePath" --search-raw "register_globals" --replacement-raw "register_globals = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "error_reporting" --replacement-raw "error_reporting = E_ALL | E_STRICT "
replace_ini_entry --file "$phpIniFilePath" --search-raw "apc.rfc1867" --replacement-raw "apc.rfc1867 = On"
# fix ini comments
fix_ini_file_comments "/etc/php5/cli/conf.d/ming.ini"
