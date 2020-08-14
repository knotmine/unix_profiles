alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'

autoload -Uz compinit && compinit

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

export PS1="%F{green}%m:%~ %F{white}(%(?.%F{green}.%F{red})%?%F{white}) %F{blue}[%*]%F{white}
> "

HISTCONTROL=ignoredups
HISTSIZE=10000000
HISTFILESIZE=100000000
HISTIGNORE=curl*-u*

# share history across multiple zsh sessions
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY ## edit a recalled history line before executing

setopt auto_cd
cdpath=(. .. $HOME)