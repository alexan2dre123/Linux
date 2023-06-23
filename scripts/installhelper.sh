#!/bin/bash
clear
printf "Select a Distro\n1) Arch Linux\n2) Ubuntu 22.04\n3) Debian 11\n4) PopOS 22.04\n0) Exit\nType a option: "
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
                exit
            else
                if test -f "/etc/pacman.d/chaotic-mirrorlist"
                then
                    clear
                    echo "Installing Base Pack..."; sleep 2
                    sudo pacman -S firefox papirus-icon-theme telegram-desktop discord htop neofetch obs-studio breeze kdenlive code vlc qbittorrent gnome-disk-utility gnome-logs noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk flatpak curl wget psensor ncdu --noconfirm
                    clear
                    echo "Installing Steam/Wine/Lutris/Heroic/Mangohud"; sleep 2
                    sudo pacman -S wine-staging winetricks --noconfirm
                    sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox --noconfirm
                    sudo pacman -S steam lutris heroic-games-launcher-bin --noconfirm
                    echo 'Done!'; sleep 2
                    cd /tmp/ || exit
                    wget https://github.com/flightlessmango/MangoHud/releases/download/v0.6.9-1/MangoHud-0.6.9.1.r0.g7f94562.tar.gz
                    tar -xvzf MangoHud-0.6.9.1.r0.g7f94562.tar.gz
                    cd MangoHud/ || exit
                    ./mangohud-setup.sh install
                    clear
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
        3)
            clear
            echo "Debian 11"
            printf "1) Browsers\n2) Base Pack\n3) Gaming Pack\n0) Exit\nSelect a option: "
            read -r deb
            case $deb in
                1)
                    clear
                    printf "1) Google Chrome\n2) Microsoft Edge\n3) Brave\n4) Firefox\n0) Exit\nSelect a option: "
                    read -r debrowser
                    case $debrowser in
                        1)
                            clear
                            echo "Installing Google Chrome..."; sleep 2
                            wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
                            sudo apt install ./google-chrome-stable_current_amd64.deb
                            rm google-chrome-stable_current_amd64.deb
                            echo "Done"; sleep 2
                        ;;
                        2)
                            clear
                            sudo apt install curl
                            echo "Installing Microsoft Edge..."; sleep 2
                            curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
                            wget "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_99.0.1150.55-1_amd64.deb"
                            sudo apt install ./microsoft-edge-stable_99.0.1150.55-1_amd64.deb
                            rm microsoft-edge-stable_99.0.1150.55-1_amd64.deb
                            echo "Done"; sleep 2
                        ;;
                        3)
                            clear
                            echo "Installing Brave..."; sleep 2
                            sudo apt install apt-transport-https curl
                            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
                            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
                            sudo apt update
                            sudo apt install brave-browser
                            echo "Done"; sleep 2
                        ;;
                        4)
                            clear
                            echo "Installing Mozilla Firefox..."; sleep 2
                            sudo apt install firefox-esr
                            echo "Done"; sleep 2
                        ;;
                    esac
                ;;
                2)
                    clear
                    echo "Installing Base Pack..."; sleep 2
                    sudo apt install htop neofetch vlc qbittorrent gimp gnome-disk-utility gnome-tweaks papirus-icon-theme youtube-dl fonts-noto fonts-noto-cjk fonts-noto-extra fonts-noto-color-emoji
                    sudo apt install flatpak
                    sudo apt install gnome-software-plugin-flatpak
                    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                    wget -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O code.deb
                    sudo apt install ./code.deb
                    rm code.deb
                    echo "Done"; sleep 2
                ;;
                3)
                    clear
                    echo "Installing Gaming Pack..."; sleep 2
                    wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
                    sudo apt install ./steam.deb
                    rm steam.deb
                    sudo dpkg --add-architecture i386
                    wget -nc https://dl.winehq.org/wine-builds/winehq.key
                    sudo apt-key add winehq.key
                    echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" | sudo tee -a /etc/apt/sources.list
                    sudo apt-get update
                    sudo apt-get install winehq-staging
                    sudo apt-get install winetricks
                    echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_11/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
                    wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_11/Release.key -O- | sudo tee /etc/apt/trusted.gpg.d/lutris.asc -
                    sudo apt update
                    sudo apt install lutris
                    echo "Done"; sleep 2
                ;;
                0)
                    exit
                ;;
            esac
        ;;
        4)
            clear
            echo "Pop OS 22.04"
            printf "1) Browsers\n2) Base Pack\n3) Gaming Pack\n0) Exit\nType a option: "
            read -r pop
            case $pop in
                1)
                    clear
                    printf "1) Google Chrome\n2) Microsoft Edge\n3) Brave\n0) Exit\nType a option: "
                    read -r popbrowser
                    case $popbrowser in
                        1) 
                            echo "Installing Google Chrome..."; sleep 2
                            wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
                            sudo apt install ./google-chrome-stable_current_amd64.deb
                            rm google-chrome-stable_current_amd64.deb
                            echo "Done!"; sleep 2
                        ;;
                        2) 
                            echo "Installing Microsoft Edge..."; sleep 2
                            curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
                            wget "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_99.0.1150.55-1_amd64.deb"
                            sudo apt install ./microsoft-edge-stable_99.0.1150.55-1_amd64.deb
                            rm microsoft-edge-stable_99.0.1150.55-1_amd64.deb
                            echo "Done!"; sleep 2
                        ;;
                        3) 
                            echo "Installing Brave..."; sleep 2
                            sudo apt install apt-transport-https curl
                            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
                            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
                            sudo apt update
                            sudo apt install brave-browser
                            echo "Done!"; sleep 2
                        ;;
                        0)
                        ;;
                    esac
                ;;

                2)
                    clear
                    echo "Installing Base Pack..."; sleep 2
                    sudo apt install discord telegram-desktop vlc qbittorrent baobab gnome-disk-utility breeze papirus-icon-theme code curl git youtube-dl
                    /bin/bash -c "$(curl -sL https://git.io/vokNn)"
                    echo "Done!"; sleep 2
                ;;
                3)
                    echo "Installing Gaming Pack.."; sleep 2
                    clear
                    cd /tmp/ || exit
                    wget "https://github.com/flightlessmango/MangoHud/releases/download/v0.6.5/MangoHud-0.6.5.r0.ge42002c.tar.gz"
                    tar -xvzf MangoHud-0.6.5.r0.ge42002c.tar.gz
                    cd MangoHud/ || exit
                    ./mangohud-setup.sh install
                    clear
                    sudo apt install steam
                    sudo dpkg --add-architecture i386
                    sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
                    sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
                    sudo apt update
                    sudo apt install --install-recommends winehq-staging winetricks -y
                    sudo apt install lutris -y
                    echo "Done"; sleep 2
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
