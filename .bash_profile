
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

##
# Your previous /Users/chris/.bash_profile file was backed up as /Users/chris/.bash_profile.macports-saved_2014-07-17_at_15:24:08
##

# MacPorts Installer addition on 2014-07-17_at_15:24:08: adding an appropriate PATH variable for use with MacPorts.
export PATH="/home/chris/scripts:/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GCFh'
alias ll='ls -GlFh'
alias nf='ls -l | wc -l'
