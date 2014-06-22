if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

GREEN="\033[0;32m"
CYAN="\033[0;36m"
BLUE="\033[0;34m"
RED="\033[0;31m"
RESET="\033[0m"

function git-prompt {

  local prompt=""

  if [[ -d "./.git" ]]; then

    prompt="$prompt$(__git_ps1 '(%s)')"

    if test -n "$(git status --porcelain)"; then
      local status="$(git status --porcelain | cut -c 1-2 | uniq)"

      if [[ $status =~ (A )|(D )|(R )|(M ) ]]; then # staged
        prompt="$prompt$CYAN ✔"
      fi

      if [[ $status =~ ( M) ]]; then # modified
        prompt="$prompt$GREEN ●"
      fi

      if [[ $status =~ (\?\?) ]]; then # untracked
        prompt="$prompt$BLUE ●"
      fi

      if [[ $status =~ (U )|( U) ]]; then # conflict
        prompt="$prompt$RED x"
      fi

    else
      prompt="$prompt ✔"
    fi
  fi

  echo -e "$prompt"
}

export PS1="${CYAN}\u@\h: ${RESET}\W ${GREEN}\$(git-prompt) ${RESET} \n→ "
