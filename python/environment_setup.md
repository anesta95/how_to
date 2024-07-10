### [How to Manage your Python Projects with Pipenv and Pyenv](https://www.rootstrap.com/blog/how-to-manage-your-python-projects-with-pipenv-pyenv)

#### Pyenv
[Pyenv](https://github.com/pyenv/pyenv) is a tool used to manage different Python versions. With this tool you can:
* Install several Python versions.
* Set/change the global(default) Python version in your computer.
* Set/change a Python version locally for a project.
* Create and manage virtual environments.

To setup with Linux Ubuntu/Debian/Mint, follow [this post](https://www.dwarmstrong.org/pyenv/):

1. Install software that satisfy the pyenv [build dependencies](https://github.com/pyenv/pyenv/wiki#suggested-build-environment):
```
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

2. [Check out](https://github.com/pyenv/pyenv?tab=readme-ov-file#basic-github-checkout) pyenv where you want it installed. Typically `$HOME/.pyenv`
```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

3. Set up shell environment for Pyenv (for [bash](https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv)) by running the below commands in your terminal to add commands to both your `~/.bashrc` and `~/.bash_profile` files.
    * Define enviornment variable `PYENV_ROOT` to point to the path where Pyenv will store its data. `$HOME/.pyenv` is the default. If you installed Pyenv via Git checkout, we recommend to set it to the same location as where you cloned it.
        * `echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc`
        * `echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile`
    * Add the `pyenv` executable to your `PATH` if it's not already there.
        * `echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc`
        * `echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile`
    * Run `eval "$(pyenv init -)"` to install `pyenv` into your shell as a shell function, enable shims and autocompletion.
        * You may run `eval "$(pyenv init --path)"` instead to just enable shims, without shell integration
        * `echo 'eval "$(pyenv init -)"' >> ~/.bashrc`
        * `echo 'eval "$(pyenv init -)"' >> ~/.bash_profile`

#### Managing Python versions
Look at the possible python versions that you can install through Pyenv:
`pyenv install --list`

Install a specific python version:
`pyenv install 3.9.1`

To see all the installed python versions on your machine:
`pyenv versions`

To set the global (default) version of python you want to use in your system
`pyenv global 3.9.1`

To check your global python version:
`python -V`

To set a local version of python for a specific project:
`cd ~/path/to/the/project/folder`
`pyenv local 3.9.1`

This will create a `.python-version` file in the folder indicating the current _local_ python version for the project. Running `python -V` in that folder will verify the local version you are running and not the global one.

To uninstall an already installed python version:
`pyenv uninstall <python version>`

Run `pyenv commands` to get a list of available subcommands. Run a subcommand with `--help` to get help on it or see the [Commands Reference](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md).

[Upgrading with Installer or Git checkout](https://github.com/pyenv/pyenv?tab=readme-ov-file#upgrading-with-installer-or-git-checkout)

You can upgrade your installation at any time using Git. To upgrade to the latest development version of Pyenv, use `git pull`:
```
cd ~/.pyenv
git pull
```
To upgrade to a _specific_ release of Pyenv, check out the corresponding tag:
```
cd ~/.pyenv
git fetch
git tag
git checkout v0.1.0
```

#### Pipenv
Pipenv is a tool used to manage the required packages in a Python project. With this tool you can:
* Automatically create or delete a virtual environment.
* Install, uninstall and update packages maintaining the desired versions.
* Set up very quickly a working Python environment.
* Have a list of the installed packages and the corresponding version.

You will have two special files in your project's root folder, both generated and changed automatically:

* `Pipfile`: A file that specifies the installed packages in your virtual environment for development and execution.
* `Pipfile.lock`: A file that specifies which versions of the installed packages (detailed in the Pipfile) has to be used. Also has other important metadata.

1. [Install Pipenv](https://pipenv.pypa.io/en/latest/installation.html) (works only for python 3.7+)
    * If you're on Linux you may have to [install pip](https://pip.pypa.io/en/stable/installing/) manually.
    * `pip install pipenv --user`
        * Note: If `pipenv` isn't available in your shell after installation, you'll need to add the user site-packages binary directory to you `PATH`.
        * On Linux and macOS you can find the [user base](https://docs.python.org/3/library/site.html#site.USER_BASE) binary directory by running `python -m site --user-base` and appending `bin` to the end. For example, this will typically print `~/.local` (with `~` expanded to the absolute path to your home directory), so you’ll need to add `~/.local/bin` to your `PATH`. You can set your `PATH` permanently by [modifying ~/.bash_profile](https://stackoverflow.com/a/14638025).
        * You may need to log out for the `PATH` changes to take effect.
    * To upgrade pipenv at any time: `pip install --user --upgrade pipenv`

2. Create & manage a virtual environment
    * Navigate to you project folder: `cd ~/path/to/the/project/folder`
    * `pipenv install --python <python version>`
        * If you already have a Pipfile and a Pipfile.lock: it will also install all the specified packages on them.
        * If you don't have a Pipfile and a Pipfile.lock: it will generate them for that environment.
    * `pipenv --rm` to delete the current virtual environment
    * `pipenv shell` to activate the created virtual environment
    * `exit` to deactivate an already activated virtual environment
    * `pipenv install <package name>` to install the _latest_ version of a package under the `[packages]` section in `Pipfile`
    * `pipenv install <package name>==<package version>` to install a _specified_ version of a package, under the `[packages]` section.
    * `pipenv update <package name>` to update a version of a package (upgrade or downgrade) to the one that you have previously specified in the Pipfile.
    * Adding `--dev` to the previous commands, Pipenv will do the same but under the `[dev-packages]` section in the `Pipfile`.
    * `pipenv uninstall <package name>` to uninstall a package.

Some additional [pipenv commands](https://pipenv-es.readthedocs.io/es/stable/#pipenv-usage).

[Additional pipenv and virtual environments tutorial.](https://pipenv-fork.readthedocs.io/en/latest/install.html)