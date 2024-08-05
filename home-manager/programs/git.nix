{ config, pkgs, lib, ... } :

{
    programs = {
        git.enable = true;
        git.userName = "Joseph Rojo";
        git.userEmail = "jsimon.rojo@gmail.com";
        git.aliases = {
            ap = "add -p";
            co = "checkout";
        };
        git.extraConfig = {
            core = {
                pager = "nvim -R";
                editor = "nvim -";
            };
            color = {
                pager = "no";
            };
        };
    };
}

