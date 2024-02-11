{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [ "quiet" ];
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
}
