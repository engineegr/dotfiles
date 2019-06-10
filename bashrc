# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# make less to open files in color
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# color PS1
PS1_YE_TIME='\[\e[01;33m\]\t\[\e[00m\]'
PS1_BGR_USER='\[\e[0;32m\]\u@\h:\[\e[00m\]'
PS1_CYAN_PATH='\[\e[01;36m\]\W\[\e[00m\]'

# [PS colours](https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt)
user_colour=94m
PS1_DOR_USER='\[\e[38;5;${user_colour}\]\u@\h:\[\e[00m\]'

tm_colour=100m
PS1_DYE_TIME='\[\e[38;5;${tm_colour}\]\t\[\e[00m\]'

path_colour=104m
PS1_DPP_PATH='\[\e[38;5;${path_colour}\]\W\[\e[00m\]'

if [ "$color_prompt" = yes ]; then
#    PS1="$PS1_YE_TIME $PS1_BGR_USER $PS1_CYAN_PATH " 
    PS1="$PS1_DYE_TIME $PS1_DOR_USER $PS1_DPP_PATH " 
else
    PS1='\t \u@\h:\W\$ '
fi

# PS1='\t \u@\h:\W\$ '
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="$PS1_YE_TIME $PS1_BGR_USER $PS1_CYAN_PATH " 
#    ;;
#*)
#    ;;
#esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

TMUX_CFG_PATH=~/.tmux

if [[ -x /usr/bin/tmux ]]; then
    $TMUX_CFG_PATH/start_tmux.sh 1>$TMUX_CFG_PATH/stdout.tmux.log 2>$TMUX_CFG_PATH/stderr.tmux.log
else
    echo "Warrning: No tmux has been installed" > $TMUX_CFG_PATH/stderr.tmux.log
fi 

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases_rc ]; then
    . ~/.bash_aliases_rc
fi

if [ -d "/usr/local/share/go/go1.12.2.lnx-amd64" ]; then
  export GOROOT="/usr/local/share/go/go1.12.2.lnx-amd64"
  export PATH="$GOROOT/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ]; then
  export PATH="$HOME/go/bin:$PATH"
fi
