#!/bin/bash
sudo touch /usr/share/X11/xorg.conf.d/50-mouse-acceleration.conf
echo -e 'Section "InputClass"\n        Identifier "My Mouse"\n        Driver "libinput"\n        MatchIsPointer "yes"\n        Option "AccelProfile" "flat"\nEndSection' | sudo tee -a /usr/share/X11/xorg.conf.d/50-mouse-acceleration.conf
clear
echo 'Done'; sleep 3