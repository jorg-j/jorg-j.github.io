# Deploying Docker to an RPI with Ansible

Why use Ansible to provision Docker to an RPi? - I was needing to reflash my RPi frequently and this got the environment exactly how I needed it to be.

In your Ansible hosts file add the details of your rpi

```
[main]

<YourRpiIPAddress>

[main:vars]

ansible_user=<yourRpiUser>
ansible_password=<yourRpiPassword>
ansible_become=yes
ansible_python_interpreter='/usr/bin/env python3'
```

Once this is done you can pull the 4b_setup.yaml playbook rom the resources section below.

In the playbook set the `NMEUSR` variable to the username you want to be added to the docker group. By default the user `pi` and the `NMEUSR` will be added to this group. 

### Resources

Ansible Playbook

[4b_setup]({{ site.raw }}resources/docker/4b_setup.yaml)