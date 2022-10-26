#!/bin/bash
#
# Install Ansible and Git then run first pull

printf "%s\n" "Preparing for ansible:"

PS3="Enter a number: "

select filetype in RaspberryPi Yeti RPIScreen
do
    echo "Selected: $filetype"
    # echo "Selected number: $REPLY"
    break
done


sudo apt update
sudo apt install ansible git

case $filetype in
  RaspberryPi)
    echo "Running Ansible Pull for Raspberry Pi"
    ansible-pull -U http://192.168.1.122:8080/git/root/ansiblepull.git local-server-pi.yml
  ;;
  Yeti)
    echo "Running Ansible Pull for Yeti"
    ansible-pull -U http://192.168.1.122:8080/git/root/ansiblepull.git local-server-yeti.yml
  ;;
  RPIScreen)
    echo "Running Ansible Pull for Raspberry Pi MQTT"
    ansible-pull -U http://192.168.1.122:8080/git/root/ansiblepull.git main_7inch.yml
  ;;
  *)
  printf "Invalid Selection\n"
  ;;
esac
