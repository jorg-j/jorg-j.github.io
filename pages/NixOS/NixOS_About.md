---
title: NixOS - About
layout: default
parent: NixOS
nav_order: 3
---

# NixOS - About


Nix makes it trivial to share development and build environments for your projects, regardless of what programming languages and tools you're using. Reliable Nix ensures that installing or upgrading one package cannot break other packages.


## HomeLab Use

### RPi 3B

Getting NixOS to work on the RPi 3b is no trivial task.

This is mostly due to 2 bugs in the base firmware.
- A clash in the hardware drivers for Wifi
- HDMI falling over after the kernel boots

This can be resolved by performing the following.

#### Getting the Right Image

This build of Nix is a 19.x version with a working kernel. "Working" being compatible with the RPi3b SOC.
https://hydra.nixos.org/build/127900853

Once downloaded run `dmesg --follow` and plug the SD card into the host. We should see the `/dev` mount point.

Open a terminal at this directory and run the following

{: .warning }
There is a reason dd is nicknamed disk destroyer. Be SURE you have the correct mount point for the SD card.

```
sudo dd if=nixos-sd-image-19.09.2522.75f4ba05c63-aarch64-linux.img of=/dev/sdb bs=4M conv=fsync status=progress
```

Once complete remove the SD card from the host machine and put it in the RPi and boot. You will need a HDMI cable connected and a keyboard.



### Setup Wifi

Run `wpa_passphrase $SSID $PASS | tee wpa_supplicant.conf` supplimenting your SSID and Password

Then run `sudo wpa_supplicant -B -i wlan0 wpa_supplicant.conf &`

You will need the wpa_supplicant.conf data later.

### Nix Configuration

Post boot copy the configuration file to `/etc/nixos/configuration.nix`

You can download the configuration here

[Download](resources/nix3b.nix){: .btn .btn-purple }

Or directly onto the Pi with `curl -L https://jorg-j.github.io/resources/nix3b.nix | sudo tee /etc/nixos/configuration.nix`

Using your text editor of choice open `/etc/nixos/configuration.nix` with sudo.

At line 71 set your password. You can use plaintext here. OR if you want to be secure.

`mkpasswd -m sha-512` to generate a hash of your password. Comment out the password value in the configuration.nix file and under it place
`hashedPassword = "$HASH"` with your hashed password replacing`$HASH`

Go to line 87 and replace `MySSID` with the SSID of the Wifi access point you wish to connect to, and `PASSHASH` will be replaced with the psk found in the `wpa_supplicant.conf` file created above.

Save the file and run `sudo nix-os rebuild switch`

Once this is complete you will want to enable the Pi to boot without a HDMI connected.

Mount the SD card on a host machine or mount the FIRMWARE volume on the pi.

In the config.txt file add the below

```
hdmi_force_hotplug=1
hdmi_drive=2
```