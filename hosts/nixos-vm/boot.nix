{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [ "quiet" ];
    kernelModules = [];
    extraModulePackages = [];
    blacklistedKernelModules = [];

    initrd = {
      kernelModules = [ "dm-snapshot" ];
      systemd.enable = true;
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
      systemd-boot.editor = false;
      timeout = 0;
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
