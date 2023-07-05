#!/bin/bash
clear
printf "Select a Distro\n1) Arch Linux\n2) Ubuntu 22.04\n0) Exit\nType a option: "
read -r distro

while [[ "$distro" -ne "0" ]]
do
    case $distro in
        1)
            if grep -Fxq "#[multilib]" /etc/pacman.conf
            then
                echo "You need to enable the arch multilib repository to be able to use this script."; sleep 5
                clear
                echo "Check Here: https://wiki.archlinux.org/title/official_repositories#Enabling_multilib"; sleep 10
            else
                if test -f "/etc/pacman.d/chaotic-mirrorlist"
                then
                    clear
                    echo "Installing..."; sleep 2
                    sudo pacman -S firefox papirus-icon-theme telegram-desktop discord htop neofetch obs-studio breeze kdenlive code vlc qbittorrent gnome-disk-utility gnome-logs noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk flatpak curl wget psensor ncdu bash-completion kvantum gzip pigz p7zip unrar unzip zip --noconfirm
                    sudo pacman -S wine-staging winetricks --noconfirm
                    sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox --noconfirm
                    sudo pacman -S steam lutris heroic-games-launcher-bin --noconfirm
                    cd /tmp/ || exit
                    wget https://github.com/flightlessmango/MangoHud/releases/download/v0.6.9-1/MangoHud-0.6.9.1.r0.g7f94562.tar.gz
                    tar -xvzf MangoHud-0.6.9.1.r0.g7f94562.tar.gz
                    cd MangoHud/ || exit
                    ./mangohud-setup.sh install
                    clear
                    echo 'Done!'; sleep 2
                    exit
                else
                    echo 'You do not have Chaotic AUR installed. Installing...'; sleep 2
		            sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
	                sudo pacman-key --lsign-key 3056513887B78AEB
		            sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
                    echo -e '[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a  /etc/pacman.conf
                    clear
                    echo 'Updating mirrors...'; sleep 2
                    sudo pacman -Syu
                    echo 'Done!'; sleep 3
                    clear
                fi
            fi
        ;;
        2)
            clear
            echo "Ubuntu 22.04"
            printf "1) Setup\n2) Remove Snap\n0) Exit\nSelect a option: "
            read -r ubu
            case $ubu in
                1)
                    clear
                    sudo apt update && sudo apt -y upgrade
                    sudo apt -y install telegram-desktop htop breeze neofetch vlc gnome-disk-utility qbittorrent papirus-icon-theme fonts-noto
                    wget "https://dl.discordapp.net/apps/linux/0.0.27/discord-0.0.27.deb"
                    sudo apt -y install ./discord-0.0.27.deb
                    rm discord-0.0.27.deb
                    wget -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O code.deb
                    sudo apt -y install ./code.deb
                    rm code.deb
                    echo "Installing Wine/Steam/Lutris/Heroic/MangoHud..."; sleep 2
                    sudo dpkg --add-architecture i386
                    wget -nc https://dl.winehq.org/wine-builds/winehq.key
                    sudo apt-key add winehq.key
                    sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
                    sudo apt update
                    sudo apt -y install --install-recommends winehq-staging winetricks
                    sudo apt -y install steam
                    cd /tmp/ || exit
                    wget https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.8.0/heroic_2.8.0_amd64.deb
                    sudo apt -y install ./heroic_2.8.0_amd64.deb
                    wget https://github.com/lutris/lutris/releases/download/v0.5.13/lutris_0.5.13_all.deb
                    sudo apt -y install ./lutris_0.5.13_all.deb
                    wget https://github.com/flightlessmango/MangoHud/releases/download/v0.6.9-1/MangoHud-0.6.9.1.r0.g7f94562.tar.gz
                    tar -xvzf MangoHud-0.6.9.1.r0.g7f94562.tar.gz
                    cd MangoHud/ || exit
                    ./mangohud-setup.sh install
                    cd ~/ || exit
                    echo "Done!"; sleep 2
                    clear
                ;;
                2)
                    clear
                    sudo snap remove firefox snap-store
                    sudo systemctl stop snapd
                    sudo apt remove --purge --assume-yes snapd gnome-software-plugin-snap
                    rm -rf ~/snap/
                    sudo rm -rf /var/cache/snapd/
                    echo "Done!"; sleep 2
                    clear
                ;;
                0)
                    exit
                ;;

            esac
        ;;
        0)
            exit
        ;;
    esac
done
