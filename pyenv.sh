# !/usr/bin/bash
# Author: Duke LeTran
# Date: 2020-11-30
# Notes: find the complete instructions in the pyenv git repository. This script
# was written specifically for Ubuntu/Debian-based systems with a bash shell
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv/blob/master/COMMANDS.md

#I. Build Dependencies
## https://realpython.com/intro-to-pyenv/#build-dependencies
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

# II. Checkout
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# III. Add appropriate environmental variables
echo '# PYENV' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PATH:$PYENV_ROOT/bin"' >> ~/.bashrc

# IV. Add pyenv init to shell in .bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
echo 'Double check that your ~/.bash_profile exists and is sourced, but otherwise...'
echo 'done installing pyenv!'
