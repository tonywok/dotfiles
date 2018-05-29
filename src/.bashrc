export EDITOR="vim"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export HISTSIZE=""

source $(brew --prefix)/etc/bash_completion

source ~/.bash/aliases.sh
source ~/.bash/prompt.sh

eval "$(rbenv init -)"
