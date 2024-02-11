{ config, pkgs, ... }:

{
  boot = {
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
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [
        "btrfs"
        "ext4"
        "fat"
        "vfat"
        "exfat"
        "ntfs"
    ];

    systemd-boot = {
      editor = false;
      timeout = 0;
      plymouth = {
        enable = true;
      };
    };

  };
}
