typeset -U config_files

config_files=(${DOTFILES}/ssh/configs/*)
if [[ -e ~/.ssh/config.local ]]; then
    config_files+=~/.ssh/config.local
fi

if [[ -e ~/.ssh/config ]]; then
   if [[ ~/.ssh/config -ot $(ls -c $config_files | head -n 1) ]]; then
       mv ~/.ssh/config ~/.ssh/config.backup.$(date +%Y%m%d%H%M%S)
   fi
fi

if [[ ! -e ~/.ssh/config ]]; then
   cat $config_files > ~/.ssh/config
fi

unset config_files

