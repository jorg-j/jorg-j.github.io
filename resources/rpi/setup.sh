#!/bin/bash

sudo apt update
sudo apt install git ipython realvnc-vnc-server
sudo apt remove --purge greenfoot-unbundled -y
sudo apt remove --purge bluej -y
sudo apt remove --purge smartsim -y 
sudo apt remove --purge wolfram-engine -y
sudo apt remove --purge minecraft-pi -y
sudo apt autoremove -y


#git archive --remote=git://git.foo.com/project.git HEAD:path/to/directory filename | tar -x
