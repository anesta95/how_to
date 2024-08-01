# What is the PATH in linux?

The `PATH` is an *environment variable* that is a colon-delimited list of directories that tells the shell which directories to search for *executable files* a.k.a. *executables*.

When you type a command on the command line, you're telling the shell to run an executable file with the given name of the command you supply. In Linux, these executable programs — such as `ls`, `cd`, `find`, etc. — usually live inside several different directories on your system.

All files *with executable permissions* stored in these directories in the `PATH` can be run from any location. The most common directories that hold executable programs are `/bin`, `/sbin`, `/usr/sbin`, `/usr/local/bin` and `/usr/local/sbin`.

This means that a directory with scripts that you write or ones that you download which is then added to the `PATH` will enable you to run those programs from anywhere on your system by just envoking their name on the command line.

For example, instead of typing the following to run a Python program:

```
/usr/bin/python3
```

Because the `/usr/bin` directory is included in the `PATH` variable, you can type this instead:

```
python3
```

# Viewing the PATH variable

You can view the `PATH` variable with either of the following commands:

```
echo $PATH
printenv PATH
```
When a command-line program is not installed in any of the mentioned directories, you may need to add the directory of that program to `PATH`.

# Adding a directory to the PATH environment variable

You can add a directory — typically the *absolute* file path to the folder with the executable files — to either the start or end of the `PATH`. Multiple directories can be added to `PATH` at once by adding a colon `:` between the directories.

The start:
```
export PATH=/the/directory/file/path:$PATH
```

The end:
```
export PATH=$PATH:/the/directory/file/path
```

Directories at the start of the `PATH` are checked first by the shell, followed by all the other directories listed.

This method will *only* work for the *current shell session*. Once you exit the current session and start a new one, the `PATH` variable will reset to its default value and no longer contain the directory you added. 

# Permanently adding a directory to the PATH variable

For the `PATH` environment variable to persist across different shell sessions, it has to be stored in the *shell configuration file(s)*. In most Linux distributions, when you start a new session, environment variables are read from the following files:

* *Global* shell-specific configuration files such as `/etc/environment` and `/etc/profile`. Use this file if you want the new directory added to *all* system users' `$PATH`.
* *Per-user* shell-specific configuration files. If you are using bash, you can set the `$PATH` variable in the `~/.bashrc` file.

Open the `~/.bashrc` file with a text editor — such as `vim` — and add a line that is the same as the arguements you'd supply to the command line to add a directory to the path:

```
vim ~/.bashrc
export PATH=$PATH:/the/directory/file/path
```

Save and close the `~/.bashrc` file. The changes to the `PATH` variable will be made once a new shell session is started. To apply the changes to the current session, use the `source` command:

```
source ~/.bashrc
```

# Removing a directory from the PATH
To remove a directory from the `PATH` variable, you need to open the corresponding configuration file and delete the directory in question from the `PATH` variable. The change will be active in the new shell sessions.

Another rare situation is if you want to remove a directory from the `PATH` _only for the current session_. You can do that by temporarily editing the variable. For example, if you want to remove the `/home/lina/bin` directory from the `PATH` variable, you would do the following:

```
PATH=$(echo "$PATH" | sed -e 's/:\/home\/lina\/bin$//')
```

In the command above, we’re passing the current `PATH` variable to the `sed` command, which will remove the specified string which is the directory path you want temporarily removed for the current session.

# Sources
* [How To View and Update the Linux PATH Environment Variable](https://www.digitalocean.com/community/tutorials/how-to-view-and-update-the-linux-path-environment-variable)
* [How to Add a Directory to PATH in Linux](https://linuxize.com/post/how-to-add-directory-to-path-in-linux/)