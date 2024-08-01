# The difference between login, non-login, interactive, and non-interactive shell sessions

A **login** shell is a shell session that being by authenticating the user. If you are signing into a terminal session or through SSH and authenticate, your shell session will be set as a login shell.

If you start a new shell session from within your authenticated session, like by calling the `bash` command from the terminal, a **non-login** shell session is started. You were were not asked for your authentication details when you started your child shell.

An **interactive** shell session is a shell session that is attached to a terminal. Typically one the user opens themselves to start issuing commands.

A **non-interactive** shell session is one is not attached to a terminal session and doesn't interact with the user. Typically run through a script or some automated process.

# How to check which type of shell is being used

*In bash only* you can determine if you are using an interactive or non-interactive shell with:

```
[[$- == *i*]] && echo 'Interactive' || echo 'Non-interactive'
```

# Examples
A normal session that begins with SSH is usually an interactive login shell. A script run from the command line is usually run in a non-interactive, non-login shell. A terminal session can be any combination of these two properties.

# Impacts
Whether a shell session is classified as a login or non-login shell has implications on which files are read to initialize the shell session.

A session started as a login session will read configuration details from the `/etc/profile` file first. It will then look for the first login shell configuration file in the user’s home directory to get user-specific configuration details.

It reads the first file that it can find out of `~/.bash_profile`, `~/.bash_login`, and `~/.profile` and does not read any further files.

In contrast, a session defined as a non-login shell will read `/etc/bash.bashrc` and then the user-specific `~/.bashrc` file to build its environment.

Non-interactive shells read the environmental variable called `BASH_ENV` and read the file specified to define the new environment.

# Resources
* [How to Read and Set Environment and Shell Variables on Linux](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-linux)
* [Shell Scripting – Interactive and Non-Interactive Shell](https://www.geeksforgeeks.org/shell-scripting-interactive-and-non-interactive-shell/)