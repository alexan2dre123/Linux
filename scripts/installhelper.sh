#!/bin/bash
clear


printf "

▄█    ▄      ▄▄▄▄▄      ▄▄▄▄▀ ██   █     █          ▄  █ ▄███▄   █     █ ▄▄  ▄███▄   █▄▄▄▄ 
██     █    █     ▀▄ ▀▀▀ █    █ █  █     █         █   █ █▀   ▀  █     █   █ █▀   ▀  █  ▄▀ 
██ ██   █ ▄  ▀▀▀▀▄       █    █▄▄█ █     █         ██▀▀█ ██▄▄    █     █▀▀▀  ██▄▄    █▀▀▌  
▐█ █ █  █  ▀▄▄▄▄▀       █     █  █ ███▄  ███▄      █   █ █▄   ▄▀ ███▄  █     █▄   ▄▀ █  █  
 ▐ █  █ █              ▀         █     ▀     ▀        █  ▀███▀       ▀  █    ▀███▀     █   
   █   ██                       █                    ▀                   ▀            ▀    
                               ▀                                                           

"

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
                    echo "Arch Linux"
                    printf "1) Browsers\n2) Base Pack\n3) Gaming Pack\n4) Emulation Pack\n5) Custom Kernels\n0) Exit\nSelect a option: "
                    read -r arch
                    case $arch in
                        1)
                            clear
                            printf "1) Google Chrome\n2) Mozilla Firefox\n3) Brave\n4) Microsoft Edge\n5) Chromium\n6) Ungoogled Chromium\n0)Exit\nSelect a option: "
                            read -r archbrowser
                            case $archbrowser in
                                1)
                                    clear
                                    echo "Installing Google Chrome..."; sleep 1
                                    sudo pacman -S google-chrome
                                    echo "Done"; sleep 2
                                ;;
                                2)
                                    clear
                                    echo "Installing Mozilla Firefox..."; sleep 1
                                    sudo pacman -S firefox
                                    echo "Done"; sleep 2
                                ;;
                                3)
                                    clear
                                    echo "Installing Brave..."; sleep 1
                                    sudo pacman -S brave
                                    echo "Done"; sleep 2
                                ;;
                                4)
                                    clear
                                    echo "Installing Microsoft Edge..."; sleep 1
                                    sudo pacman -S microsoft-edge-stable-bin
                                    echo "Done"; sleep 2
                                ;;
                                5)
                                    clear
                                    echo "Installing Chromium..."; sleep 1
                                    sudo pacman -S chromium
                                    echo "Done"; sleep 2
                                ;;
                                6)
                                    clear
                                    echo "Installing Ungoogled Chromium..."; sleep 1
                                    sudo pacman -S ungoogled-chromium
                                    echo "Done"; sleep 2
                                ;;
                            esac
                        ;;
                        2)
                            clear
                            echo "Installing Base Pack..."; sleep 2
                            sudo pacman -S papirus-icon-theme numix-circle-icon-theme-git telegram-desktop discord htop neofetch obs-studio breeze kdenlive code vlc qbittorrent gnome-disk-utility baobab ksysguard teamviewer noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk youtube-dl ttf-fira-mono inter-font flatpak glu curl wget dnsmasq openresolv
                        ;;
                        3)
                            clear
                            echo "Installing Gaming Pack..."; sleep 2
                            sudo pacman -S wine-staging winetricks --noconfirm
                            sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox --noconfirm
                            sudo pacman -S gamemode lib32-gamemode steam lutris goverlay mangohud lib32-mangohud heroic-games-launcher-bin --noconfirm 
                            echo "Done"; sleep 2
                        ;;
                        4)
                            clear
                            echo "Installing Emulation Pack..."; sleep 2
                            sudo pacman -S pcsx2 rpcs3-git dolphin-emu desmume duckstation-git citra-canary-git yuzu-mainline-bin mgba-qt ppsspp reicast mupen64plus sameboy
                            echo "Done"; sleep 2
                        ;;
                        5) 
                            clear
                            printf "Choose a Kernel\n1) xanmod-edge\n2) linux-tkg-bmq\n3) linux-tkg-pds\n4) linux-zen\nSelect a option: "
                            read -r kernel
                            case $kernel in
                                1) sudo pacman -S linux-xanmod-edge linux-xanmod-edge-headers;;
                                2) sudo pacman -S linux-tkg-bmq linux-tkg-bmq-headers;;
                                3) sudo pacman -S linux-tkg-pds linux-tkg-pds-headers;;
                                4) sudo pacman -S linux-zen linux-zen-headers;;
                            esac
                        ;;
                        0) exit;;
                    esac
                else
                    echo 'Installing Chaotic AUR...' ; sleep 2
		            sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
	                sudo pacman-key --lsign-key FBA220DFC880C036
		            sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
                    echo -e '[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a  /etc/pacman.conf
                    clear
                    echo 'Updating mirrors...' ; sleep 2
                    sudo pacman -Syu
                    echo 'Done.' ; sleep 3
                fi
            fi
        ;;
        2)
            clear
            echo "Ubuntu 22.04"
            printf "1) Browsers\n2) Base Pack\n3) Gaming Pack\n4) Remove Snap\n0) Exit\nSelect a option: "
            read -r ubu
            case $ubu in
                1)
                    clear
                    printf "1) Google Chrome\n2) Microsoft Edge\n3) Brave\n4) Firefox\n0) Exit\nSelect a option: "
                    read -r browser
                    case $browser in
                        1)
                            echo "Installing Google Chrome..."; sleep 2
                            wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
                            sudo apt install ./google-chrome-stable_current_amd64.deb
                            rm google-chrome-stable_current_amd64.deb
                            echo "Done"; sleep 2
                        ;;
                        2)
                            echo "Installing Microsoft Edge..."; sleep 2
                            curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
                            wget "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_99.0.1150.55-1_amd64.deb"
                            sudo apt install ./microsoft-edge-stable_99.0.1150.55-1_amd64.deb
                            rm microsoft-edge-stable_99.0.1150.55-1_amd64.deb
                            echo "Done"; sleep 2
                        ;;
                        3)
                            echo "Installing Brave..."; sleep 2
                            sudo apt install apt-transport-https curl
                            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
                            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
                            sudo apt update
                            sudo apt install brave-browser
                            echo "Done"; sleep 2
                        ;;
                        4)
                            echo "Installing Mozilla Firefox..."; sleep 2
                            sudo apt install firefox
                            echo "Done"; sleep 2
                        ;;
                    esac
                ;;
                2)
                    clear
                    sudo apt update && sudo apt upgrade
                    echo "Installing Base Pack..."; sleep 2
                    sudo apt install telegram-desktop htop breeze neofetch vlc gnome-disk-utility qbittorrent baobab youtube-dl papirus-icon-theme fonts-noto fonts-noto-cjk fonts-noto-extra fonts-noto-color-emoji
                    wget "https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.deb"
                    sudo apt install ./discord-0.0.17.deb
                    rm discord-0.0.17.deb
                    wget -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O code.deb
                    sudo apt install ./code.deb
                    rm code.deb
                    echo "Done"; sleep 2
                ;;
                3)
                    clear
                    echo "Installing Gaming Pack..."; sleep 2
                    sudo apt install steam 
                    sudo dpkg --add-architecture i386
                    sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
                    sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
                    sudo apt update
                    sudo apt install --install-recommends winehq-staging winetricks
                    sudo add-apt-repository ppa:lutris-team/lutris
                    sudo apt update
                    sudo apt install lutris
                    cd /tmp/ || exit
                    wget "https://github.com/flightlessmango/MangoHud/releases/download/v0.6.5/MangoHud-0.6.5.r0.ge42002c.tar.gz"
                    tar -xvzf MangoHud-0.6.5.r0.ge42002c.tar.gz
                    cd MangoHud/ || exit
                    ./mangohud-setup.sh install
                    echo "Done"; sleep 2
                ;;
                4)
                    clear
                    echo "This will remove the default apps and the Snap Store."
                    echo "If you installed any other app from snap, please remove it first. [CTRL + C to cancel]"; sleep 5
                    sudo snap remove firefox snap-store
                    sudo systemctl stop snapd
                    sudo apt remove --purge --assume-yes snapd gnome-software-plugin-snap
                    rm -rf ~/snap/
                    sudo rm -rf /var/cache/snapd/
                    echo "Done"; sleep 2
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
