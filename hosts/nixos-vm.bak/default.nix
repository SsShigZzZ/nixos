{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../common.nix
      ./boot.nix
      ./filesystems.nix
      ./network.nix
    ];

  virtualisation.virtualbox.guest.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

}
