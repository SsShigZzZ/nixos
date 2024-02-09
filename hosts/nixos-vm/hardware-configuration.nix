# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot = {
    kernelModules = [ ];
    extraModulePackages = [ ];
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "ohci_pci"
        "ehci_pci"
        "ahci"
        "sd_mod"
        "sr_mod"
      ];
      luks.devices."p0_d0" = {
        device = "/dev/disk/by-label/p0_d0";
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

    "/var/log" = {
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

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}
