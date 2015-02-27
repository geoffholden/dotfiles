export PAGER=less
export EDITOR=vim
export HOSTNAME=$(hostname -s)

# Main options
unsetopt BG_NICE
unsetopt AUTO_CD
unsetopt CDABLE_VARS

setopt CORRECT
setopt INTERACTIVE_COMMENTS
setopt AUTO_MENU

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_ALLOW_CLOBBER
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY

setopt ALL_EXPORT
setopt TYPESET_SILENT

setopt globdots pushdtohome cdablevars autolist
setopt autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent clobber
setopt autopushd pushdminus extendedglob rcquotes mailwarning
setopt autoparamslash
unsetopt correct correctall

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile


bindkey -v # Set Vi mode
bindkey -M vicmd -s '#' 'I#\e\n' # Comment out line

fpath=(${ZSH}/functions $fpath)
autoload -U ${ZSH}/functions/*(:t)

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

