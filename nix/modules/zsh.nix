{ pkgs, ...}:
{

  programs.nnn = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "rg --files --no-ignore --hiden --follow --glob '!.git/*'";
    defaultOptions = [ "--height 50%" "--ansi" ];
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    syntaxHighlighting.enable = true;
    initExtra = ''
      bindkey -s "^s" "tmux-sessionizer.sh\n"
      bindkey -s "^e" "nnn\n"
      source $HOME/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
    '';
    shellAliases = {
      cat = "bat";
      lg = "lazygit";
      chef = "cinc";
      kls = "kitchen list";
      krm = "kitchen destroy";
      be = "bundle exec";
      s = "doppler run";
      tf = "terraform";
      k = "kubectl";
      du = "ncdu";
      cdg = "~/.local/bin/tmux-layout.sh";
      cdr = "cd $(find ~/git -maxdepth 3 -type d | fzf --no-preview)";
      tmks = "~/.local/bin/tmux-sessionkiller.sh";
      tmkw = "~/.local/bin/tmux-windowkiller.sh";
      dot = "cd $DOTFILES";
      v = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "aws" "vi-mode" "kubectl" "fzf" ];
    };
    sessionVariables = {
      TERM = "screen-256color";
      EDITOR = "nvim";
      XDG_CONFIG_HOME = "$HOME/.config";
      LC_ALL = "C.UTF-8";
      DOTFILES = "$HOME/git/dotfiles/";
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "master";
          sha256 = "gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
    ];
  };

}
