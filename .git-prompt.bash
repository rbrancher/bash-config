# git stuff for prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWUPSTREAM=verbose

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

__build_prompt() {
  local last_status=$?
  local blue='\[\e[0;34m\]'
  local red='\[\e[0;31m\]'
  local green='\[\e[0;32m\]'
  local reset='\[\e[00m\]'

  if [[ $last_status = 0 ]]
  then
    local prompt_color=$green
  else
    local prompt_color=$red
  fi

  __git_ps1 "$blue\w$reset" "\\n$prompt_color\$$reset "
};
export PROMPT_COMMAND=__build_prompt
