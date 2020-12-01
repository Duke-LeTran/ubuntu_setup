# !/usr/bin/bash

# Update
sudo apt update && sudo apt-get update

# Sublime
## https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get -y install sublime-text

# Calibre
## https://calibre-ebook.com/download_linux
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin


# Signal
## 1. Install our official public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc |\
  sudo apt-key add -
## 2. Add our repository to your list of repositories
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
## 3. Update your package database and install signal
sudo apt -y install signal-desktop

# VPN
## UCDHS Cisco anyconnect
sudo apt-get install openconnect network-manager-openconnect-gnome
echo '### UCDHS VPN Settings ###'
echo 'VPN Protocol: Cisco AnyConnect or openconnect'
echo 'Gateway: connect.ucdmc.ucdavis.edu'
echo 'Token Mode: Yubikey OATH'

# DBeaver
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get -y install dbeaver-c

# calibre
## issue as of 2020-11-30
## https://www.mobileread.com/forums/showthread.php?t=333503
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
sudo apt-get install -y libxcb-xinerama0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0

# vim
sudo apt -y install vim
#gnome-tweaker
sudo apt -y install gnome-tweaks
sudo apt -y install grub-customizer

