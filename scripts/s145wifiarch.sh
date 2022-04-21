#!/bin/sh
cd /lib/firmware/ath10k/QCA9377/hw1.0/ || exit
sudo mv firmware-5.bin.xz firmware-5.bin.orig
sudo mv firmware-6.bin.xz firmware-6.bin.orig
sudo wget "https://github.com/kvalo/ath10k-firmware/blob/master/QCA9377/hw1.0/CNSS.TF.1.0/firmware-5.bin_CNSS.TF.1.0-00267-QCATFSWPZ-1?raw=true" -O firmware-5.bin
echo 'Restarting WiFi Driver...'; sleep 5
sudo modprobe -r ath10k_pci
sudo modprobe ath10k_pci
echo 'Done'; sleep 3
