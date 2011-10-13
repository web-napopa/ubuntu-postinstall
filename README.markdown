# Ubuntu post-install
Bunch of scripts to run after you've installed Ubuntu as your workstation. **There is a lot that can be improved.**
The scripts wont ask you whether you want or not to install an application - they will just install it. This speeds up the setup a lot.

The scripts have two main goals:

 1. **install** and **configure** applications on your fresh ubuntu installation
 2. **remove** redundant applications.

## The different flavours

* **Human** `human.sh` - Intended for everyday user who wants a tweaked, easy to use and aesthetic OS
* **Web developer** `web-developer.sh` - Basically the same as Human but it adds few more applications.
* **Web PHP developer environment** `web-php-developer-environment.sh` - Installs and configures servers and libraries for easy PHP development and server management
* **Post-minimal-netinstall** `minimal.sh` - It can install a basic GUI for your netinstalled ubuntu which doesn't start automatically so there's no overhead. It can also install other stuff; the script will ask for your approval on every step.

## The addons

* **Themes** `themes.sh` - GTK themes and icons and fixes
* **Extras** `extas.sh` - Few more applications 
* **Fix for apache virtual hosts on NTFS drive ** `fix-ntfs-mount-usage-webserver.sh.editme` - It's a template. You **have to edit it** before running. I haven't got the time to make it interactive.

## Installation

#### Download & Extract & Enter directory
Run these commands in the terminal. *Note* the asterisk (*) at the end of the last command.

```bash
mkdir ~/ubuntu-postinstall
cd ~/ubuntu-postinstall
wget https://github.com/web-napopa/ubuntu-postinstall/tarball/master --output-document="ubuntu-postinstall.tar.gz"
tar -zxvf ./ubuntu-postinstall.tar.gz
cd web-napopa-ubuntu-postinstall*

```
*I've left a blank line so that you can copy paste without having to press enter on the last command*
#### Run the script for your flavour by:

```bash
sudo bash <your-favour-filename>
```

### Typical installtion
Run your flavour and then run some addons. **Themes** and **Extras** are often installed on the computers I work.

## What's included
**Have a look at the files**. The code is quite readable even if you don't understand bash.
All flavours except the **Post-minimal-netinstall** include:

* **apt-file** - Useful for finding unmet dependencies. Use "apt-file search"
* **git** - Versioning control. All github repositories are using it.
* **subversion** - Another popular version control system
* **bzr** - Distributed revision control used by some packages
* **unrar** - Enables you to read .rar archives
* **unzip** - Enables you to read .zip archives

which are considered essential.
