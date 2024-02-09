{
  description = "Matt's home flake";  

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    impermanence.url = "github:nix-community/impermanence";
  };  
  
  outputs = { nixpkgs ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({ config, pkgs, ... }:
              imports =
                [
                  ./hosts/nixos
                ];
            }
          )
        ];
      };
    };
  };
}
