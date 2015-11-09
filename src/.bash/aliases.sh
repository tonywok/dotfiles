alias resolve='mvim -p $(git diff --name-only --diff-filter=U | xargs)'
alias gst='git status'
__git_complete gst _git_status
alias gco="git checkout"
__git_complete gco _git_checkout
