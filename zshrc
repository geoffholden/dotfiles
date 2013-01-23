PAGER=less
EDITOR=vim
HOSTNAME=$(hostname -s)

# Main options
unsetopt BG_NICE
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
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent clobber
setopt autopushd pushdminus extendedglob rcquotes mailwarning
setopt autoparamslash

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"


bindkey -v # Set Vi mode
bindkey -M vicmd -s '#' 'I#\e\n' # Comment out line

autoload -Uz vcs_info
 
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '[%b%c%u%F{12}]'
    } else {
        zstyle ':vcs_info:*' formats '[%b%c%u%F{red}●%F{12}]'
    }
 
    vcs_info
}
 
setopt prompt_subst
PROMPT='%F{10}[$HOSTNAME[0,3]] %F{12}%c${vcs_info_msg_0_} %% %{$reset_color%}'

autoload -U compinit
compinit

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# completion for ssh known_hosts
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} ) 
zstyle ':completion:*:(ping|telnet|mtr|ssh|scp|sftp):*' hosts $knownhosts

ls --version 2> /dev/null > /dev/null
if [ $? -eq 0 ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias sz='source ~/.zshrc'

