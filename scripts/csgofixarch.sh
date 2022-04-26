#!/bin/bash
echo 'Downloading gperftools' ; sleep 2
sudo pacman -S gperftools
mkdir ~/Downloads/fixedFiles
cp /usr/lib/libtcmalloc_minimal.so.4.5.9 ~/Downloads/fixedFiles
cp ~/Downloads/fixedFiles/libtcmalloc_minimal.so.4.5.9 ~/Downloads/fixedFiles/libtcmalloc_minimal.so.4
cp ~/Downloads/fixedFiles/libtcmalloc_minimal.so.4.5.9 ~/Downloads/fixedFiles/libtcmalloc_minimal.so.0
echo 'Files were created at your Downloads folder'
echo 'Put the files in your CSGO /bin/linux64 folder, remember to backup the original files.'
echo 'if you still get crashes, RENAME or DELETE your VIDEOS folder at CSGO/PANORAMA.'
echo 'PRESS CTRL + C TO EXIT'
sleep 999


