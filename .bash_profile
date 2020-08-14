PATH=.:$PATH
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'

alias grep='grep --color=auto'

# Define some colors first:
# To verify these colors:
# for i in {31..47}; do echo -e "\e[0;${i}mColor $i\e[0m" "\e[1;${i}m(Bolded)\e[0m"; done
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
NC='\[\e[0m\]'              # No Color

new_ps1_str() {
  RET_VAL=$?
  if [ $RET_VAL -eq 0 ]; then
    RET_COLOR='1;32'
  else
    RET_COLOR='1;41'
  fi
}

PROMPT_COMMAND=new_ps1_str
# echo $PS1
#\[\e]0;\u@\h:\w\a\][\u@\h \W$(__git_ps1 " (%s)")]\$


export PS1="${green}\h:$\w${NC} (\[\e[\$(echo -n \$RET_COLOR)m\]\$RET_VAL${NC}) ${blue}[\d \t]${NC}\n> "

HISTCONTROL=ignoredups
HISTSIZE=100000
HISTFILESIZE=100000
HISTIGNORE=curl*-u*
shopt -s histappend
shopt -s histverify ## edit a recalled history line before executing
shopt -s histreedit ## reedit a history substitution line if it failed

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"