{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs;
    [
      git
      htop
      vim
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
