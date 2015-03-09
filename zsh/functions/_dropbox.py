#compdef dropbox.py

_arguments -C \
        '1:cmd:->cmds' \
        '*:: :->args'

local commands
commands=(
        'status:get current status of the dropboxd'
        'help:provide help'
        'puburl:get public url of a file in your dropbox'
        'stop:stop dropboxd'
        'running:return whether dropbox is running'
        'start:start dropboxd'
        'filestatus:get current sync status of one or more files'
        'ls:list directory contents with current sync status'
        'autostart:automatically start dropbox at login'
        'exclude:ignores/excludes a directory from syncing'
        'lansync:enables or disables LAN sync'
)

case "$state" in
    (cmds)
        _describe -t commands 'command' commands
        ;;
    (args)
        case $line[1] in
            (puburl|ls)
                _files
                ;;
            (filestatus)
                local arguments
                arguments=(
                        {-l,--list}'[prints out information in a format similar to ls. works best when your console supports color]:filename:_files'
                        {-a,--all}'[do not ignore entries starting with .]:filename:_files'
                        '::filename:_files'
                        )
                _arguments -s $arguments
                ;;
            (exclude)
                if [[ ($line[2] == "add") || ($line[2] == "remove") ]]; then
                    _dirs
                else
                    local cmds; cmds=('add' 'remove')
                    _describe -t commands 'command' cmds
                fi
                ;;
            (autostart|lansync)
                local options; options=(
                    'y:Yes'
                    'n:No'
                    )
                _describe -t commands 'option' options
                ;;
            (help)
                _describe -t commands 'command' commands
                ;;
            (start)
                _arguments {-i,--install}'[auto install dropboxd if not available on the system]'
                ;;
        esac
        ;;
esac

