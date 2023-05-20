#!/bin/sh
echo 'options forcedeth msi=0 msix=0' | sudo tee /etc/modprobe.d/forcedeth_options.conf
sudo update-initramfs -u
