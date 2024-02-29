{ config, inputs, lib, pkgs, ...}: {

  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  virtualisation.virtualbox.guest.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  boot = {
    kernelParams = [ "quiet" "splash"];
    kernelModules = [];
    extraModulePackages = [];
    blacklistedKernelModules = [];

    initrd = {
      kernelModules = [ "dm-snapshot" ];
      availableKernelModules = [
        "ata_piix"
        "ohci_pci"
        "ehci_pci"
        "ahci"
        "sd_mod"
        "sr_mod"
      ];

      luks.devices."pool0_disk0" = {
        device = "/dev/disk/by-label/pool0_disk0";
        allowDiscards = true;
      };
    };

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 0;
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };

    supportedFilesystems = [
        "btrfs"
        "ext4"
        "fat"
        "vfat"
        "exfat"
        "ntfs"
    ];

  };

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

}
