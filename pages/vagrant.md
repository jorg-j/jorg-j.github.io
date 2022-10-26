---
title: Vagrant
layout: default
parent: Setup Environments
nav_order: 2
---

# Vagrant

The below will setup a vagrant VM

```
Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-22.04"
  config.vm.network "public_network", :bridge => 'wlp4s0', ip: "192.168.1.171"
  config.vm.synced_folder "my_data_file", "/vagrant_data"
  config.vm.define "VM_Name"
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.cpus = 2
  end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt install pipx -y
    cat << EOF > /home/vagrant/poet.sh
pipx install poetry
pipx ensurepath
EOF
  SHELL
end

```


Copy the above to a file named `Vagrantfile` and update the `vm.synced_folder`
Open a shell in this location and run `vagrant up`
 
To install poetry in this environment
`curl -sSL https://install.python-poetry.org | python3 -`
`export PATH="/home/vagrant/.local/bin:$PATH"`
