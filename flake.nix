{
  description = "Matt's home flake";  

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    impermanence.url = "github:nix-community/impermanence";
  };  
  
  outputs = { unstable, ... }: {
    nixosConfigurations = {
      nixos-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/nixos-vm ];
      };
    };
  };
}
