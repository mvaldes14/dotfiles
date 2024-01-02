{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = _: true;
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
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    LC_ALL = "C.UTF-8";
    PATH = "$PATH:$HOME/.local/bin";
  };

  programs.home-manager.enable = true;

  imports = [
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/shell.nix
  ];

  #Pkgs installed via os
  # steam, spotify, discord, i3, picom, rofi, lutris
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
    go
    nodejs_20
    ruby_3_2
    rustc
    cargo
    yarn
    nodePackages.typescript
    blueman
    pasystray
    doppler
    ncdu
    feh
    dunst
    pavucontrol
    i3status-rust
    betterlockscreen
    arandr
    nixpkgs-fmt
    lxappearance
    playerctl
    stern
    xclip
    flameshot
  ];
}
