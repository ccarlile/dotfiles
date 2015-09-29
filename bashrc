
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

##
# Your previous /Users/chris/.bash_profile file was backed up as /Users/chris/.bash_profile.macports-saved_2014-07-17_at_15:24:08
##

# MacPorts Installer addition on 2014-07-17_at_15:24:08: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/home/chris/scripts:/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Bcoz im not on a mac
export PATH="/home/chris/bin:$PATH"

export PS1="\n\[\033[38;5;110m\]\u\[\033[m\]@\[\033[38;5;148m\]\h:\[\033[38;5;203m\]\w\[\033[m\]\n$ "
export CLICOLOR=1
export EDITOR=vim
#following line is only for mac osx
#export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GCFh --color'
alias ll='ls -GlFh'
alias nf='ls -l | wc -l'
alias python='python2'
alias pip='pip2'
alias suvim='sudo vim -u ~/.vimrc'
alias lock='xscreensaver-command --lock'
alias zathura='zathura --fork'
alias fuck='sudo $(history -p \!\!)'
command fortune -a | cowsay
