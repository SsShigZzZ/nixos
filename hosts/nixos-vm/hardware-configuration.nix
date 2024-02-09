# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "ohci_pci"
        "ehci_pci"
        "ahci"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ ];
      extraModulePackages = [ ];
      luks.devices."p0_d0" = {
        device = "/dev/by-label/p0_d0";
        allowDiscards = true;
      };
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
        "noatime"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=home/active"
        "compress=zstd"
        "noatime"
      ];
    };

    "/home/.snapshots" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=home/snapshots"
        "compress=zstd"
        "noatime"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "compress=zstd"
        "noatime"
      ];
    };

    "/persist" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      neededForBoot = true;
      options = [
        "subvol=persist/active"
        "compress=zstd"
        "noatime"
      ];
    };

    "/persist/.snapshots" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=persist/snapshots"
        "compress=zstd"
        "noatime"
      ];
    };

    "/var/local" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=var_local/active"
        "compress=zstd"
        "noatime"
      ];
    };

    "/var/local/.snapshots" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=var_local/snapshots"
        "compress=zstd"
        "noatime"
      ];
    };

    "/var/log" =
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      neededForBoot = true;
      options = [
        "subvol=var_log"
        "compress=zstd"
        "noatime"
      ];
    };

    "/swap" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}

























# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  filesystems = {
    "/" = {
      device = "/dev/disk/by-label/pool0";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
        "noatime"
      ];
    };

  
    "/boot" = { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [ ];
  # Set Filesystms to noatime and zstd compression
  fileSystems."/".options = [ "subvol=root" "compress=zstd" "noatime" ];
  fileSystems."/home".options = [ "subvol=home/active" "compress=zstd" "noatime" ];
  fileSystems."/home/.snapshots".options = [ "subvol=home/snapshot" "compress=zstd" "noatime" ];
  fileSystems."/nix".options = [ "subvol=nix" "compress=zstd" "noatime" ];
  fileSystems."/persist".options = [ "subvol=persist/active" "compress=zstd" "noatime" ];
  filesystems."/persist".neededForBoot = true ;
  fileSystems."/persist/.snapshots".options = [ "subvol=persist/snapshots" "compress=zstd" "noatime" ];
  fileSystems."/var/local".options = [ "subvol=var_local/active" "compress=zstd" "noatime" ];
  fileSystems."/var/local/.snapshots".options = [ "subvol=var_local/snapshot" "compress=zstd" "noatime" ];
  fileSystems."/var/log".options = [ "subvol=var_log" "compress=zstd" "noatime" ];
  filesystems."/var/log".neededForBoot = true;

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}
