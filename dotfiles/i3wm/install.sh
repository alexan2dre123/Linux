#!/bin/bash
clear
set -e

configPath="/home/$USER/.config/"
currentPath=$(pwd)

printf "Installing Packages"; sleep 2
sudo pacman -Syu rofi lxappearance maim xclip feh thunar thunar-archive-plugin xfce4-terminal papirus-icon-theme ttf-font-awesome ttf-fira-sans ttf-fira-code noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji xarchiver unzip zip p7zip pigz gzip unrar mate-polkit git wget curl gvfs xdg-user-dirs
git clone https://github.com/EliverLara/Kripton.git
sudo mv "$currentPath/Kripton" /usr/share/themes/
xdg-user-dirs-update
printf "Setting up..."; sleep 3
cp -r i3 "$configPath"
cp -r i3blocks "$configPath"
cp -r rofi "$configPath"
cp -r wallpaper.jpg "/home/$USER/Pictures/"


