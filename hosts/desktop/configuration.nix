{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware.nix
    ];

  environment.systemPackages = with pkgs;
    [
      git
      htop
      vim
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
