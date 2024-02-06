{ config, pkgs, ... }:

{
  imports =
    [ 
      ./linked-configuration.nix
      ./linked-hardware.nix
      ./linked-role.nix
    ];

  environment.systemPackages = with pkgs;
    [ vim
      htop
    ];

  services = {
    openssh.enable = true;
  };

  programs.ssh = {
    startAgent = true;
    knownHosts = {
      desktop = {
        publicKeyFile = ./files/ssh/pubkeys/desktop.pub;
      };
    };
  };

}
