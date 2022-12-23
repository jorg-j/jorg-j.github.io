---
title: Ansible
layout: default
parent: Ansible
nav_order: 6
---

# Ansible for Provisioning Servers

Having a consistent reproduceable configuration supports long term, maintainable infrastructure.

Often when migrating from development to UAT to production there are slight differences between the way the system was provisioned which can cause unforseen challenges.

On top of this starting development against an existing production system can result in significant downtime while the development environment is configured to mirror production.

Within my home network there are several servers performing various tasks.

- Capaldi, runs docker containers and several AI models
- Tenant, manages git repositories and standard dev server
- Clara, MQTT broker for the network
- Smith, PiHole
- HomeAssistant
- Yeti, deprecated

Currently Capaldi, Tenant and Clara are all managed with Ansible. Specifically Ansible Pull

## Ansible vs Ansible Pull

General use of Ansible is in what I call the "push mode". This is where you have a host device which contains an inventory of devices to perform actions against.

Machine A is responsible for provisioning Machine B. This can have challenges with bottle necks on large scale, however it is useful for a more immediate provision. Aka "do thing now". And is useful for seeing failures in the provision and being able to take immediate action.

By using `ansible-pull` the machine running the command is responsbile for itself and only itself. In the way I have my setup configured I must ssh into the machine, run a curl command to pull the bash script which lets me pick which machine I am provisioning. From there ansible adds 2 cron jobs. 1 to run ansible-pull on boot and 1 to run it daily.

This means the machine will effectively reprovision itself daily without the need for an external host. This setup works well in my current situation however it may not work well in others. 

Here is the script which kicks off the ansible setup. Note: if you are not on my network this will not work.

[Download Ansible Pull Setup](resources/ansible.sh){: .btn .btn-purple }

