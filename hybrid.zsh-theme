autoload -Uz vcs_info
autoload colors && colors;

setopt prompt_subst

zstyle ':vcs_info:*' enable hg git

zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '*'

zstyle ':vcs_info:*' actionformats '%F{cyan}%s:(%a|%b%c%u)%f'
zstyle ':vcs_info:*' formats '%F{cyan}%s:(%b%c%u)%f'

precmd () { vcs_info }

ZSH_THEME_USER='%{$fg[cyan]%}%n%{$reset_color%}'
ZSH_THEME_HOSTNAME='%{$fg[yellow]%}%M'
ZSH_THEME_PATH='%{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}'
ZSH_THEME_VCS='${vcs_info_msg_0_}'

PROMPT="
$ZSH_THEME_USER@$ZSH_THEME_HOSTNAME:$ZSH_THEME_PATH $ZSH_THEME_VCS 
%(!.#.$) "

###ZSH_HIGHLIGHT_STYLES[comment]=fg=240
##ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=156
##ZSH_HIGHLIGHT_STYLES[globbing]=fg=white
##ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white
##ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
