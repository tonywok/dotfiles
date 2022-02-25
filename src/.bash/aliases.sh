alias resolve='mvim -p $(git diff --name-only --diff-filter=U | xargs)'
alias gst='git status'
alias grmb='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
__git_complete gst _git_status
alias gco="git checkout"
__git_complete gco _git_checkout
