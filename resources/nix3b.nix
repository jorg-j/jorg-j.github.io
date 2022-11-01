{ config, pkgs, lib, ... }:

{
  imports = [ ];

  # === Configure Boot for RPi 3 ===  
  boot.loader.grub.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelParams = ["cma=256M"];
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 3;
  boot.loader.raspberryPi.uboot.enable = true;
  boot.loader.raspberryPi.firmwareConfig = ''
    gpu_mem=256
  '';
  
  
  # === Firmware Modifications ===
  # Prevent Wifi from roasting
  hardware.enableRedistributableFirmware = false;
  hardware.firmware = [ pkgs.raspberrypiWirelessFirmware ];
 

  # === Increase Swap to prevent crashing ===
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];

  # === Configure File System ===
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };


}



  # === Package Management ===
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    raspberrypi-tools
    vim
    git
    htop
    dhcpcd
    wpa_supplicant
  ];

  # === Optimise storage ===
  documentation.nixos.enable = false;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  boot.cleanTmpDir = true;
  time.timeZone = "Australia/Melbourne";
  
  
  # === Config ssh ===
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";

  # === Setup Users ===
  users.users = {
    root = {};
    pi = {
      isNormalUser = true;
      home = "/home/nixos";
      extraGroups = [ "wheel" "networkmanager" ];
      password = "MyPass";

    };
  };

  # === Setup Alias ===
  environment.interactiveShellInit = ''
    alias config='sudo vim /etc/nixos/configuration.nix'
  '';

  # === Setup Wifi ===

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = {
      MySSID = {
        pskRaw = "PASSHASH";
      };
    };
  };
  
  
  # === Setup Desktop Environment ===

  ## Enable the below for a desktop environment

  ## Enable X11 windowing system
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "modesetting" ];

  ## Enable xfce
  # services.xserver.desktopManager.xfce.enable = true;

  ## Enable slim autologin
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.user = "pi";

}