{ config, pkgs, lib, ... } :

{
    programs = {
        direnv.enable = true;
        direnv.enableZshIntegration = true;
        direnv.nix-direnv.enable = true;
    };
}

