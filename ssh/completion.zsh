# completion for ssh known_hosts
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ping|telnet|mtr|ssh|scp|sftp):*' hosts $knownhosts

