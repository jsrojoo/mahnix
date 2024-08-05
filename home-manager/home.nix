{ config, lib, pkgs, ... }@inputs:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.hapiheltiwelti = {
    home.username = "hapiheltiwelti";
    home.homeDirectory = "/home/hapiheltiwelti";
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
      htop
      fortune
      ripgrep
    ];

    programs = {
      home-manager = {
        enable = true;
      };
    };

    imports = [
      ./programs/zsh.nix
      ./programs/fzf.nix
      ./programs/git.nix
      ./programs/ripgrep.nix
    ];

  };
}


