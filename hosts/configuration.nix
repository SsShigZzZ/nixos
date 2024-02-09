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

  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "lp" "scanner" ];
  };

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

  systemPackages = with pkgs; [
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
  ]

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
}
