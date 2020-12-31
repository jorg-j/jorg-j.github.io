#!/bin/bash
sudo apt update
sudo apt install git ipython realvnc-vnc-server -y
sudo apt remove --purge greenfoot-unbundled -y
sudo apt remove --purge bluej -y
sudo apt remove --purge smartsim -y 
sudo apt remove --purge wolfram-engine -y
sudo apt remove --purge minecraft-pi -y
sudo apt autoremove -y

## Pull Samba setup
mkdir samba-install
cd samba-install
git init
git remote add -f origin https://github.com/jorg-j/jorg-j.github.io.git
git config core.sparseCheckout true

echo "resources/rpi/samba/" >> .git/info/sparse-checkout
git pull origin master

wget https://raw.githubusercontent.com/jorg-j/jorg-j.github.io/master/resources/rpi/samba
mv samba samba-install

