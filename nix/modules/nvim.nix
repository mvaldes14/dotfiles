{ pkgs, ... }:
{
  programs.neovim = {
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
    defaultEditor = true;
  };
}
