#!/bin/bash
clear
configPath="/home/$USER/.config/"
currentPath=$(pwd)
printf "Installing Packages..."; sleep 2
if which apt > /dev/null 2>&1; then
    sudo apt install i3 i3blocks rofi lxappearance maim xclip feh thunar thunar-archive-plugin xfce4-terminal papirus-icon-theme xarchiver unzip zip p7zip pigz gzip unrar mate-polkit git wget curl gvfs xdg-user-dirs fonts-noto fonts-font-awesome fonts-firacode 
elif which pacman > /dev/null 2>&1; then
    sudo pacman -Syu i3 rofi lxappearance maim xclip feh thunar thunar-archive-plugin xfce4-terminal papirus-icon-theme ttf-font-awesome ttf-fira-sans ttf-fira-code noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji xarchiver unzip zip p7zip pigz gzip unrar mate-polkit git wget curl gvfs xdg-user-dirs
fi
git clone https://github.com/EliverLara/Kripton.git
sudo mv "$currentPath/Kripton" /usr/share/themes/
xdg-user-dirs-update
clear
printf "Setting up..."; sleep 3
cp -r i3 "$configPath"
cp -r i3blocks "$configPath"
cp -r rofi "$configPath"
cp -r wallpaper.jpg "/home/$USER/Pictures/"
cp -r .gtkrc-2.0 "/home/$USER/"
printf " Done!"; sleep 3


