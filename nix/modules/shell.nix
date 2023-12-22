{ pkgs, lib,  ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      os.editorPreset = "nvim";
      gui.theme =
        {
          activeBorderColor = [ "#89b4fa" "bold" ];
          inactiveBorderColor = [ "#a6adc8" "bold" ];
          optionsTextColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#313244" ];
          selectedRangeBgColor = [ "#313244" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          cherryPickedCommitFgColor = [ "#89b4fa" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
          searchingActiveBorderColor = [ "#f9e2af" ];
        };
      git = {
        paging = {
          colorArg = "always";
          useConfig = false;
        };
      };
    };
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin";
    };
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catpuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };

  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      palette = "catppuccin_mocha";
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
      format = lib.concatStrings [
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$kubernetes"
        "$helm"
        "$cmd_duration"
        "$fill"
        "$terraform"
        "$pulumi"
        "$golang"
        "$nodejs"
        "$rust"
        "$lua"
        "$ocaml"
        "$aws"
        "nix_shell"
        "\n$character"
      ];
      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
      fill.symbol = " ";
      terraform = {
        format = "[💠 $version]($style) ";
        disabled = false;
        detect_folders = [ ".terraform" ];
      };
      golang = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };
      nodejs = {
        format = "[$version](bold green) ";
      };
      rust = {
        format = "[⚙️$version](red bold)";
      };
      ocaml = {
        format = "[🐫 $version](bold yellow) ";
        detect_files = [ "dune" ];
      };
      lua = {
        format = "[🌙 $version](bold white) ";
        detect_files = [ "lua" ];
      };
      nix_shell = {
        format = "[❄️ $name](bold white) ";
      };
    };
  };


}
