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
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN7CcO8lHIdYLapCeE80Z1c/MviMv+7F8e3yCmH8RjTF MattPask";
      };
    };
  };

}
