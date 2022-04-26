#!/bin/bash
echo 'Installing Chaotic AUR...' ; sleep 2
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a  /etc/pacman.conf
echo 'Updating mirrors...' ; sleep 2
sudo pacman -Syyuu
echo 'Done' ; sleep 3
