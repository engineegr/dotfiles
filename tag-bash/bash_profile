# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
systemctl --user import-environment PATH

export PATH
# Run on login
if [ -f "/home/vagrant/rui/tests/base/test_runOnFirstLogin.sh" ]; then
  "/home/vagrant/rui/tests/base/test_runOnFirstLogin.sh"
fi
