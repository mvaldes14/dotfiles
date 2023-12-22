# Dotfiles

Repo consists of configuration for:
- nvim
- tmux
- Zsh

Contains archives for old i3 setup

# Nvim
The entire setup is now lua based, you will need some extra packages installed to get it to [work](work)
- nodejs, python, go, ruby
- install nodejs neovim
- install python pynvim
- install solargraph as a system gem (sudo)

Packer and LSP will install the needed parsers and language servers

# Tmux
Plugins are installed in ~/.tmux/

# Zsh
Calls aliases and sets variables depending on the hostname

# Stow
Manages the symlinks for keeping everything in sync
To set it up
- remove the original files
- run stow on each folder you need to sync
-  `stow -vt ~/.config/nvim nvim`
-  `stow -vt ~/.config/alacritty alacritty`
-  `stow -vt ~ zsh`
-  `stow -vt ~ tmux`
