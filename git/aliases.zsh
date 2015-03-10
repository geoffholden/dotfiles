# Wrap git in hub, if it's installed
if (( $+commands[hub] )); then
    alias git=hub
fi

