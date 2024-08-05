{ config, pkgs, lib, ... } :

{
  programs = {
    zsh.enable = true;
    zsh.enableCompletion = true;
    zsh.defaultKeymap = "viins";
    zsh.sessionVariables = {
      EDITOR = "nvim";
    };
    zsh.shellAliases = {
      v = "nvim -";
      gs = "git status";
      src = "sudo nixos-rebuild --flake ~/nix/flake.nix switch";
      vrc = "nvim - ~/nix/nixvim/programs/nixvim.nix";
      vzrc = "nvim - ~/nix/nixvim/programs/zsh.nix";
      hmrc = "nvim - ~/nix/home-manager/home.nix";
    };

    zsh.prezto = {
      enable = true;
      editor.keymap = "vi";
      prompt.theme = "pure";
      caseSensitive = false;

      pmodules = [
        "environment"
        "archive"
        "directory"
        "editor"
        "autosuggestions"
        "completion"
        "history"
        "prompt"
        "spectrum"
        "terminal"
        "utility"
      ];
    };

    zsh.initExtraFirst = ''
      # Fix slow tab completion on nix wsl
      unsetopt PATH_DIRS

      # For case insensitive completion support
      setopt NO_CASE_GLOB
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

      autoload -U edit-command-line
      zle -N edit-command-line
      bindkey -M vicmd 'v' edit-command-line
      bindkey '^ ' autosuggest-accept

      export EDITOR="nvim"
    '';
  };
}



