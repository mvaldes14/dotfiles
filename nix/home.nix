{ config, pkgs, ... }:

{
  home.username = "mvaldes";
  home.homeDirectory = "/home/mvaldes";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.file = {
    ".ssh/config" = {
      source = /home/mvaldes/git/dotfiles/.ssh/config;
    };
    ".local/bin" = {
      source = /home/mvaldes/git/dotfiles/scripts;
      target = "/home/mvaldes/.local/bin";
      recursive = true;
    };
    ".aws/config" = {
      source = /home/mvaldes/git/dotfiles/.aws/config;
    };
    ".config" = {
      source = /home/mvaldes/git/dotfiles/.config;
      target = "/home/mvaldes/.config";
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    LC_ALL = "C.UTF-8";
    PATH = "$PATH:$HOME/.local/bin";
  };

  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  imports = [
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/shell.nix
    ./modules/nvim.nix
  ];

  #Pkgs installed via os
  # steam, spotify, discord, i3, picom, rofi, lutris, obs, obsidian
  home.packages = with pkgs; [
    neovim
    neofetch
    tmux
    jq
    tree
    fd
    ripgrep
    kubectl
    kubernetes-helm
    k9s
    gh
    awscli2
    doppler
    ncdu
    arandr
    nixpkgs-fmt
    stern
    flameshot
    clipmenu
    #i3 apps
    light
    rofi
    playerctl
    xclip
    feh
    pasystray
    dunst
    lxappearance
    i3status-rust
    pavucontrol
    picom
  ];
}
