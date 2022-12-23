#!/bin/bash

UPDATE=0

function install_base() {
   if [ -z "$(which $1)" ]
    then
        if [ $UPDATE == 0 ]; then
            sudo apt update
            UPDATE=1
        fi
        sudo apt install $1 -y
    else
        echo "$1 installed"
    fi 
}

function ansible_install() {
    install_base "git"
    install_base "ansible"
    echo "Running Ansible Pull for $1"
    sleep 1
    ansible-pull -U http://192.168.1.122:8080/git/root/ansible_pull.git $2 --checkout master
}

install_base "whiptail"


CHOICE=$(
    whiptail --title "Ansible Installer" --menu "Choose System to Install" 16 100 9 \
    "1)" "4b Capaldi"   \
    "2)" "3b Tenant"   \
    "3)" "MQTT Clara" \
    3>&2 2>&1 1>&3
)

if [ $? -gt 0 ]; then
    exit
fi

case $CHOICE in
    "1)")
        ansible_install "Capaldi" "local-capaldi.yml"
    ;;
    "2)")
        ansible_install "Tenant" "local-tenant.yml"
    ;;
    "3)")
        ansible_install "Clara" "local-pi-mqtt.yml"
    ;;
esac


exit