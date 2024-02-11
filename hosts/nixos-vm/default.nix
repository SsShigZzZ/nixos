{ config, pkgs, ... }:

{
  imports =
    [ 
      ../common.nix
      ./boot.nix
      ./filesystems.nix
      ./network.nix
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;

}
