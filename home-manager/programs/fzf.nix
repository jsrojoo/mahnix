{ config, pkgs, lib, ... } :

{
  programs = {
    fzf.enable = true;
    fzf.enableZshIntegration = true;
  };
}
