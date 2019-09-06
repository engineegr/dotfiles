#!/bin/bash

set -o xtrace
set -o errexit

function main() {
    local -r session_name="$(whoami)_ts"
    local -r is_session=$(tmux list-session | awk '{ print $1 }' | grep "$session_name") 

    if [[ -z $is_session ]]; then 
        tmux new-session -d -s "$session_name" -n disk_usage 

        tmux new-window -d -t "$session_name":1 -n .vimrc 
        tmux new-window -d -t "$session_name":2 -n .tmux.conf 
        tmux new-window -d -t "$session_name":3 -n dmesg  
        tmux new-window -d -t "$session_name":4 -n part_usage  
        tmux new-window -d -t "$session_name":5 -n top 
        tmux new-window -d -t "$session_name":6 -n messages

        tmux send-key -t "$session_name":6 'tail -f /var/log/messages' C-m
        tmux send-key -t "$session_name":5 'top' C-m
        tmux send-keys -t "$session_name":4 'du -d 1 -h -BM --exclude "proc" /' C-m
        tmux send-keys -t "$session_name":3 'sudo dmesg --human --color=always -e | more' Enter
        tmux send-keys -t "$session_name":2 'vim ~/.tmux.conf' Enter
        tmux send-keys -t "$session_name":1 'vim ~/.vimrc' Enter
        tmux send-keys -t "$session_name":0 'df -hl' Enter
    fi
    tmux -2 attach-session -d -t "$session_name" 
}

main $@
