{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
        "noatime"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=home/active"
        "compress=zstd"
        "noatime"
      ];
    };

    "/home/.snapshots" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=home/snapshots"
        "compress=zstd"
        "noatime"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "compress=zstd"
        "noatime"
      ];
    };

    "/persist" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      neededForBoot = true;
      options = [
        "subvol=persist/active"
        "compress=zstd"
        "noatime"
      ];
    };

    "/persist/.snapshots" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=persist/snapshots"
        "compress=zstd"
        "noatime"
      ];
    };

    "/var/local" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=var_local/active"
        "compress=zstd"
        "noatime"
      ];
    };

    "/var/local/.snapshots" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      options = [
        "subvol=var_local/snapshots"
        "compress=zstd"
        "noatime"
      ];
    };

    "/var/log" = {
      device = "/dev/disk/by-label/vg0-root";
      fsType = "btrfs";
      neededForBoot = true;
      options = [
        "subvol=var_log"
        "compress=zstd"
        "noatime"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [ "umask=0077" ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

}
