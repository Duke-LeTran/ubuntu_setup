# Installing Python on Debian Bookworm 12

# I.  Introudction

So I've learned some things about Debian, and that is it's designed to 
"just work", hence the philosopy of ["DontBreakDebian"](https://wiki.debian.org/DontBreakDebian).
Debian Bookworm doesn't come compatible with the third party python repository typically avaialbe on Ubuntu, ppa/Deadsnakes, which is community managed repository of pre-complied binaries of old versions of python for Ubuntu. Since this repository doesn't exist, it is quite frustrating. 

## A. Stable: Current Version 3.11.2
As of writing this Debian's `stable` version of python is `3.11.2`, which is old especially because the official python version for `3.11` is `3.11.9`, which may be available on the `testing`. As a developer, you may need different versions of python, so that tge stable-works-out-the-box python is patently insufficient. This 3.11.2 is therefore the "system" python. Other repositories exist, such as this one from [paravoid](https://people.debian.org/~paravoid/python-all/), but it's very updated, i.e., there is no python 3.9 or 3.10 at all, but there are python 3.11 and 3.8 and lower (weird). You can manually download the tarball and compile from the python website, but a tool to manage this exact process is `pyenv`

## B. Pyenv 
`Pyenv` will the choice to use on Debian, since it was written in bash scripts, but be aware, it may not detect all missing dependencies that it will not detect. You'll have to decipher the error messages, and so for that reason, it is highly recommneded to install using the `-v` flag (i.e., `pyenv install -v 3.10`). Despite these limitations, pyenv does a great job of of automating the pull of the python tarballs, natively compiling the binaries, and providing a efficient method of switching between .

# II. Install
## Step 1: Install the system python

```
sudo apt install -y python3 python3-pip python3-venv gcc make python3-tk tk-dev
```

## Step 2: Install Dependencies

Suggested from realpython:
```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
```

These were still missing for some reason, so run again if needed: 
    bzip2 ncurses libffi readline openssl.

```
sudo apt-get install build-essential zlib1g-dev libffi-dev libssl-dev \
libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev
```

## Step 3: Install pyenv

`sudo apt install -y pyenv`

You may get a message like this: 
```
WARNING: seems you still have not added 'pyenv' to the load path.

# Load pyenv automatically by appending
# the following to 
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
```

Depending on your shell and your environment, so just add them to your `.bashrc`

## Step 4: Install your specific version of python

```
> CONFIGURE_OPTS="--enable-optimizations" 
> pyenv install -v 3.10 # installs the latest version
```

# III. Quickstart: pyenv

`pyenv versions`
`pyenv which python`
`python -V`
`pyenv which pip`
https://realpython.com/intro-to-pyenv/#creating-virtual-environments

## A. Creating your virtual environment

This project/directory/application specific. This creates a .python-version in 
the local directory

```
> pyenv virtualenv <python_version> <environment_name>`
> pyenv virtualenv 3.10.14 vproj` # this creates a .python-version
```
This is equivalent to:
* `python -m venv vproj`
* `conda create -n vproj`

Note that this also ties the virtual environment to the current project and 
it will create a `.python-verison` inside the folder.

### inspecting the python
```
> pyenv virtualenv 3.10.14 vproj
> which python
/home/dletran/.pyenv/shims/python

>pyenv which python
/home/dletran/.pyenv/versions/vproj/bin/python
```

## B. Using pyenv local

Alternatively, you can activate the python versions in the local directory 
without tying it to a project.

```
> pyenv local 3.10.4 # this creates a .python-version
> pyenv which python
/home/dletran/.pyenv/versions/3.10.14/bin/python
```

## C. Activating the venv anywhere

Sometimes you might want to activate a venv on the fly.

```
> mkdir ../test
> cd ../test
> (vproj) pyenv activate vproj # This won't generate a .python-version
/home/dletran/.pyenv/versions/3.10.14/bin/python
```
This is equivalent to:
* `conda activate vproj` 
* `source .venv/bin/activate`.

Note that you need to have created the venv in the first place though.

## D. pyenv shell

Alternatively, you can just activate that any specific version of python on the 
fly with no consequences, within only the scope of your shell.

No `.python-version` will be generated, but it will temporarily set $PYENV_VERSION
```
> echo $PYENV_VERSION

> pyenv shell 3.11.9
> echo $PYENV_VERSION
3.11.9
> pyenv shell --unset # turns it off
> echo $PYENV_VERSION

```


# Resources
* https://stackoverflow.com/questions/60775172/pyenvs-python-is-missing-bzip2-module
* [pyenv](https://github.com/orgs/pyenv/discussions/1998)