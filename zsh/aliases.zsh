ls --version 2> /dev/null > /dev/null
if [ $? -eq 0 ]; then
    alias ls='ls --color=auto'
fi
alias sz='source ~/.zshrc'
alias s='sudo $(fc -ln -1)'

