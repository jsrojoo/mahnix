{
  config,
  pkgs,
  lib,
  ...
}: {
  programs = {
    nixvim = {
      enable = true;
      # defaultEditor = true;
      # vimdiffAlias = true;

      colorschemes.nord.enable = true;

      # plugins = import ./nixvim/plugins.nix;

      # globals.mapleader = " ";

      # extraConfigVim = ''
      #   map \ <leader>
      # '';

      # extraConfigLua = builtins.readFile ./nixvim/lua-config.lua;

      # keymaps = import ./nixvim/keymaps.nix;
    };
  };
}
