# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew zsh-syntax-highlighting aws vi-mode kubectl fzf fzf-tab zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export EDITOR="nvim"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# Source default alias and funcs
source ~/.config/zsh/zsh_aliases
source ~/.config/zsh/zsh_functions
source ~/.config/zsh/zsh_keymaps
source ~/.config/zsh/zsh_options

# Source files based on host
source ~/.config/zsh/zsh_work
