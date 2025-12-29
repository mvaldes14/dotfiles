# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
HISTFILE=$HOME/.zshistory
HISTSIZE=50000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew aws vi-mode kubectl fzf fzf-tab zsh-autosuggestions zsh-syntax-highlighting zoxide ansible fluxcd helm k9s starship)

# Source default alias and funcs
source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/zsh_aliases
source ~/.config/zsh/zsh_functions
source ~/.config/zsh/zsh_options
source ~/.config/zsh/zsh_custom

# Custom Completions and globals
autoload -Uz compinit && compinit -i
