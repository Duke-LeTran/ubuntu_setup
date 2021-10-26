# !/usr/bin/bash
# Author: Duke LeTran
# Date: 2020-11-30
# LastUpdated: 2021-10-20
# Notes: find the complete instructions in the pyenv git repository. This script
# was written specifically for Ubuntu/Debian-based systems with a bash shell
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv/blob/master/COMMANDS.md

#I. Build Dependencies
## https://realpython.com/intro-to-pyenv/#build-dependencies
## https://github.com/pyenv/pyenv/wiki#suggested-build-environment

echo "You must use sudo to install. Ctrl+C to cancel."
# https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
read -r -p "Are you sudo? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    true
else
    exit 1 # exit with error
fi

sudo apt-get update; sudo apt-get install -y \
build-essential curl libbz2-dev libffi-dev liblzma-dev libncurses5-dev \
libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev \
libxmlsec1-dev llvm make python-openssl tk-dev wget xz-utils zlib1g-dev


# II. Checkout
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# III. Add appropriate environmental variables
# https://github.com/pyenv/pyenv#automatic-installer
echo '# PYENV' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PATH:$PYENV_ROOT/bin"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >>~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo '##### End PyEnv #####'

# IV. Add pyenv init to shell in .profile (alternatively .bash_profile)
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.profile
source ~/.bashrc
echo 'Done installing pyenv! Type pyenv -v to double check'
