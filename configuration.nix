{ config, pkgs, ... }:

{
  imports =
    [ 
      ./linked-configuration.nix
      ./linked-hardware.nix
      ./linked-role.nix
    ];
}
