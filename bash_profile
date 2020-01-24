# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# User specific environment and startup programs
# Needs only we have user specific services (systemctl, see more https://wiki.archlinux.org/index.php/Systemd/User)
# Interesting detail: the string interrupts execution of the rest part (the part placed below) and it continues execution after we kill the session
# systemctl --user import-environment PATH

