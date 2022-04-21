#!/bin/bash
echo 'Installing RyzenAdj...' ; sleep 5
sudo pacman -S git cmake pciutils libpciaccess lib32-libpciaccess
git clone https://github.com/FlyGoat/RyzenAdj.git
cd RyzenAdj || exit
mkdir build && cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release ..
make
echo 'Creating preset for R5 3500U...' ; sleep 5
touch 30w.sh
echo 'sudo ./ryzenadj --stapm-limit=30000 --fast-limit=30000 --slow-limit=30000 --vrmmax-current=70000 --min-gfxclk=900  --tctl-temp=85' >> 30w.sh
chmod +x ./30w.sh
echo 'Done...' ; sleep 3
