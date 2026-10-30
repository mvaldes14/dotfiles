# Bootstrap active Vorpal environment before plugin detection.
if [[ -d "$HOME/.vorpal/bin" ]]; then
  path=("$HOME/.vorpal/bin" $path)

  if [[ -r "$HOME/.vorpal/bin/vorpal-activate-shell" ]]; then
    source "$HOME/.vorpal/bin/vorpal-activate-shell"
  fi
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
HISTFILE=$HOME/.zshistory
HISTSIZE=50000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew aws vi-mode kubectl fzf fzf-tab zsh-autosuggestions zsh-syntax-highlighting ansible fluxcd helm k9s)
# Only load these where installed; the plugins warn on every shell otherwise
(( $+commands[starship] )) && plugins+=(starship)
(( $+commands[zoxide] )) && plugins+=(zoxide)

# Source default alias and funcs
source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/zsh_functions
source ~/.config/zsh/zsh_custom
source ~/.config/zsh/zsh_options
source ~/.config/zsh/zsh_aliases

# Custom Completions and globals
autoload -Uz compinit && compinit -i
