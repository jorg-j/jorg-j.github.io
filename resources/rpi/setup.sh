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
wget https://raw.githubusercontent.com/jorg-j/jorg-j.github.io/master/resources/rpi/samba
mv samba samba-install

