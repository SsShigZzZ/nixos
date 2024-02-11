{ config, pkgs, ... }:

{
  imports =
    [ 
      ../common.nix
      ./boot.nix
      ./filesystems.nix
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
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN7CcO8lHIdYLapCeE80Z1c/MviMv+7F8e3yCmH8RjTF MattPask";
      };
    };
  };


}
