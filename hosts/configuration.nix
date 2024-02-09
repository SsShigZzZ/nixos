{ config, lib, pkgs, unstable, inputs, vars, ... }:

let
  terminal = pkgs.${vars.terminal};
in
{
  #imports = ( 
  #  #import ../modules/desktops ++
  #  #import ../modules/editors ++
  #  #import ../modules/hardware ++
  #  #import ../modules/programs ++
  #  #import ../modules/services ++
  #  #import ../modules/shell ++
  #  #import ../modules/theming
  #);

  #users.users.${vars.user} = {
  #  isNormalUser = true;
  #  extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "lp" "scanner" ];
  #};

  services.automatic-timezoned.enable = true;
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  environment.systemPackages = with pkgs; [
    btop
    coreutils
    git
    killall
    lshw
    vim
    tree
    pciutils
    wget
    p7zip
    rsync
    unzip
    unrar
    zip
  ];

  nix = {
    settings ={
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        "-L"
      ];
      dates = "weekly";
      randomizedDelaySec = "45min";
    };
    stateVersion = "22.05";
  };

  users.ldap = {
    enable = true;
    base = "dc=pask,dc=xyz";
    server = "ldap://pask.xyz/";
    useTLS = true;
    extraConfig = ''
      ldap_version 3
      pam_password md5

      # TOFIX: this does not work for some reason
      # # https://serverfault.com/a/137996
      # nss_override_attribute_value loginShell /run/current-system/sw/bin/bash
    '';
  };

  ## evil, horrifying hack for dysfunctional nss_override_attribute_value
  #systemd.tmpfiles.rules = [
  #  "L /bin/bash - - - - /run/current-system/sw/bin/bash"
  #];
}
