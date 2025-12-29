# Dotfiles

![dotfiles](dotfiles.png)

Personal development environment configuration for macOS and cross-platform tools.

## Tools & Configurations

### Terminal & Shell
- **zsh** - Shell configuration with aliases, functions, and keymaps
- **starship** - Cross-shell prompt with custom styling
- **atuin** - Shell history sync and search
- **tmux** - Terminal multiplexer with custom keybinds and theme

### Text Editors & IDEs
- **nvim** - Neovim configuration using Lazy.nvim with extensive LSP, DAP, and plugin setup
- **zed** - Modern editor configuration replicating nvim-like experience

### Terminal Emulators
- **ghostty** - GPU-accelerated terminal emulator configuration

### Window Management
- **aerospace** - Tiling window manager for macOS with custom keybinds

### Development Tools
- **opencode** - AI coding assistant configuration with custom modes and agents
- **direnv** - Environment variable management
- **lazygit** - Git TUI configuration
- **bat** - Cat replacement with syntax highlighting and custom themes
- **awscli** - AWS CLI configuration with multiple profiles and endpoints

### Development Environment
- **devbox** - Reproducible development environments with Lua tooling
- **ssh** - SSH client configuration for secure connections

## Key Features

### Neovim Setup
Modern Lua-based configuration using Lazy.nvim with:
- LSP support for multiple languages (Go, TypeScript, Lua, Nix, etc.)
- DAP (Debug Adapter Protocol) integration
- Advanced plugins: Telescope, Treesitter, Copilot, Obsidian integration
- Custom snippets and spell checking

### Tmux Configuration
- Custom theme and status line
- Plugin ecosystem integration
- Session management scripts
- Navigation helpers

### Shell Environment  
- Hostname-based configuration switching
- Custom functions and aliases
- Integrated history search with Atuin
- Starship prompt with git and environment info

### Cross-Platform Support
- macOS-specific tools (Aerospace)
- Linux compatibility for core tools

## Scripts & Utilities
- `tmux-sessionizer.sh` - Quick tmux session creation
- `tmux-sessionkiller.sh` - Session cleanup utility  
- `jws-*` scripts - Custom workflow automation
- SSH helpers and navigation tools


# Brew Install list
awscli
bat
cloudlens
cue
eza
fd
fzf
gh
go
go-task
helm
helmfile
k9s
lazygit
neovim
nvm
opencode
ripgrep
starship
stern
tfenv
tmux
tmux-fingers
tree
uv
wget
zoxide
