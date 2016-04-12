# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# source hybrid colorscheme
source ~/.zsh/hybrid.zsh-theme

#Stuff i liked from bash
export PATH="$HOME/bin/dasht/bin:$HOME/bin:/usr/local/bin:$PATH"
export TERM="xterm-256color"
export EDITOR=vim
export CLICOLOR=1
alias ls='ls -GCFh' 
alias ll='ls -GlFh'
alias nf='ls -l | wc -l'
#alias python='python2'
#alias pip='pip2'
alias zathura='zathura --fork'
#Doesnt work in zsh
#alias fuck='sudo $(history -p \!\!)'
alias tmux='tmux -2'
command fortune | cowsay


#New to .zshrc
alias wifi='sudo wifi-menu'
alias fuck='sudo $(fc -ln -1)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

