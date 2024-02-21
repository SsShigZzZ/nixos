{ config, lib, pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8"; 
  
  environment.systemPackages = with pkgs;
    [
      git
      htop
      vim
    ];
  
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes" ;
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };

    btrbk = {
      niceness = 15;
      instances."btrbak" = {
        onCalendar = "*-*-* *:00:00";
        settings = {
          timestamp_format = "long";
          snapshot_preserve_min = "2d";
          preserve_day_of_week = "sunday" ;
          preserve_hour_of_day = "0" ;
          target_preserve = "48h 10d 4w 12m 10y" ;
          volume."/home" = {
            snapshot_create = "always";
            subvolume = ".";
            snapshot_dir = ".snapshots";
          };
          volume."/var/local" = {
            snapshot_create = "always";
            subvolume = ".";
            snapshot_dir = ".snapshots";
          };
        };  
      };
    };
  };
  
  programs.ssh = {
    startAgent = true;
    knownHosts = {
      desktop = {
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN7CcO8lHIdYLapCeE80Z1c/MviMv+7F8e3yCmH8RjTF MattPask";
      };
    };
  };

  system.stateVersion = "24.05";
  time.timeZone = "Asia/Tokyo";

  users = {
    mutableUsers = true;
    ldap = {
      enable = true;
      base = "dc=ldap,dc=pask,dc=xyz";
      bind = {
        distinguishedName = "root";
        passwordFile = "/etc/ldap.password";
      };
      #daemon.enable = true;
      server = "ldap://ldap.pask.xyz";
    };
    #users.matt = {
    #  description = "Matt Pask";
    #  createHome = true;
    #  home = "/home/matt";
    #  shell = "/bin/sh";
    #  group = "users";
    #  extraGroups = [ "wheel" ];
    #  isNormalUser = true;
    #  hashedPassword = "$y$j9T$J/wsERmo/j/Pd6vtB8pFr/$K/HMsMb.frtYSpZO5Pp2ubD9vETkVTMYuyLI/9WEsJA";
    #};
  };

}
