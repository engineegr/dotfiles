# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy
BL_LOG="bash_logout.log"

if [ ! -z "$(tmux list-session | grep -e '$(whoami)_ts')" ]; then 
  tmux kill-session -t '$(whoami)_ts'
fi

if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

