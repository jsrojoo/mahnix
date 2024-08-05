# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  wsl = {
    enable = true;
    defaultUser = "hapiheltiwelti";
    wslConf = {
      user.default = "hapiheltiwelti";
      network.hostname = "1337";
      interop = {
        enabled = true;
        appendWindowsPath = false;
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;

  users.users.hapiheltiwelti.isNormalUser = true;
  users.users.hapiheltiwelti.shell = pkgs.zsh;

  system.stateVersion = "24.05";
}
