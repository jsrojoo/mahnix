{
  description = "Mah Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    home-manager,
    nixvim,
    ...
  }@inputs: 
  let
    hostname = "1337";
    system = "x86_64-linux";
  in
  {
    formatter."${system}" = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        nixos-wsl.nixosModules.wsl
        home-manager.nixosModules.home-manager
        nixvim.nixosModules.nixvim
        ./nixos/configuration.nix
        ./home-manager/home.nix
        ./nixvim
      ];
    };
  };
}
