# Installing Python on Debian Bookworm 12

# I.  Introudction

So I've learned a couple of things about Debian, and that is it's designed to 
"just work", hence the philosopy of ["DontBreakDebian"](https://wiki.debian.org/DontBreakDebian).
Debian Bookworm doesn't have any third party python repositories of other versions of python. Typically available on Ubuntu, there's ppa/Deadsnakes, which is community managed repository of pre-complied binaries of old versions of python specific for Ubuntu. In my search, I did come across a repository of from [paravoid](https://people.debian.org/~paravoid/python-all/), but it's not really maintained... , i.e., there is no python 3.9 or 3.10 at all, but there are python 3.11 and 3.8 and lower (weird). Since this type of reliable repository doesn't exist for Debian, it can be quite frustrating when looking to install different version binaries of python,
coming from this workflow.

## A. Stable: Current Version 3.11.2
As of writing this Debian's `stable` version of python is `3.11.2`, which is the "system" python.  The system version is a little old especially since the official python version for `3.11` is `3.11.9`, which may be available on the Debian `testing` repository. But as a developer, you may need different versions of python, so that the stable-works-out-the-box python is woefully insufficient, not to mention lacking of security updates.

The solution then is manually download the tarball from the python website and compile from source. Naturually, a tool built using bash scripts intended to automate this process exists -- the `pyenv`: https://github.com/pyenv/pyenv

## B. pyenv 
`pyenv` actually `wgets` the tarball from the python ftp site and compiles it from source. The tool is written in bash scripts, but be aware, it may not reliably detect all missing build dependencies (listed below) and this can be a real pain. You may have to decipher the error messages if coming from a lightweight Debian install, and so for that reason, it is highly recommneded to install using the `-v` flag (i.e., `pyenv install -v 3.10`). Regardless, pyenv does a great job of of automating the downloading of the python tarballs, natively compiling the binaries, and providing a efficient method of managing mutiple versions along with virutal environment support.

# II. Install
## Step 1: Install the system python

```
sudo apt install -y python3 python3-pip python3-venv gcc make python3-tk tk-dev
```

## Step 2: Install Build Dependencies

Suggested from [RealPython](https://realpython.com/intro-to-pyenv/#build-dependencies):
```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
```

Note, if you are not on Debian/Ubuntu, you may need to check for build deps for
your specific OS.

## Step 3: Install pyenv

`$ curl https://pyenv.run | bash`

You may get a warning message like this: 
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

Depending on your shell and your environment, just follow the instructions. For me, I added those lines to my `~/.bashrc`.

## Step 4: Install your specific version of python

```
> env CONFIGURE_OPTS="--enable-optimizations" # takes longer but builds a more efficient binary
> pyenv install -v 3.10 # installs the latest version, i.e., 3.10.14
```
[pyenv: CONFIGURE_OPTS](https://github.com/orgs/pyenv/discussions/1998)

# III. Quickstart: pyenv

* `pyenv versions`
* `pyenv which python`
* `python -V`
* `pyenv which pip`
https://realpython.com/intro-to-pyenv/#creating-virtual-environments

## A. Creating your virtual environment

This is specific to your project/directory/application. This creates a .python-version in 
the local directory.

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

### listing all available virtual environments
```
dletran in 🌐 Tallac in flask_project on  master [!?] via 🐍 v3.10.14 (flask_proj) 
❯ pyenv versions
  system
  3.8.19
  3.10.14
  3.10.14/envs/flask_proj
* flask_proj --> /home/dletran/.pyenv/versions/3.10.14/envs/flask_proj (set by /home/dletran/Documents/projects/flask_project/.python-version)
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

No `.python-version` will be generated, but it will temporarily set $PYENV_VERSION.

```
> echo $PYENV_VERSION

> pyenv shell 3.11.9
> echo $PYENV_VERSION
3.11.9
> pyenv shell --unset # turns it off
> echo $PYENV_VERSION

```
