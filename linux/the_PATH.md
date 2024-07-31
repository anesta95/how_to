# The PATH
When you type a command, the only reason your computer knows how to find the application corresponding to that command is that the `PATH` environment variable tells it where to look. This variable lists valid directories for your operating system to search for commands, whether that command is ls or cp, or a graphical application like Firefox or Lutris, or anything else.

Different variables have different uses and significance for different programs. For example the `USER` variable is used by several systems as a way to identify who is requesting a service.

# Setting an environment variable

Usually, the installer program, whether it’s `dnf` on Fedora, `apt` on Ubuntu, `brew` on Mac, or a custom installer, updates your environment variables for a new application. Sometimes, though, when you’re installing something outside of your distribution’s intended toolset, you may have to manage an environment variable yourself. Or you might choose to add an environment variable to suit your preferences. If you decide you want to keep some applications or scripts in a `bin` folder located in your home directory, then you must add that directory to your PATH so your operating system knows to look there for applications to run when you issue a command.

## Temporary environment variables

You can add a location to your `PATH` the way you create throw-away variables. It works, but only as long as the shell you used to modify your system `PATH` remains open. For instance, open a Bash shell and modify your system `PATH`:

```export PATH=$PATH:/home/username/bin```

Confirm the result:

```echo $PATH```

Close the session:

`exit`

Open a new terminal and take a look at the `PATH` variable:

`echo $PATH`

This variable has reverted to its default state because `PATH` isn’t getting set with each new shell. For that, you must configure your variables to load any time a shell is launched.

## Permanent environment variables
You can set your own persistent environment variables in your shell configuration file, the most common of which is `~/.bashrc`. If you’re a system administrator managing several users, you can also set environment variables in a script placed in the `/etc/profile.d` directory.

The syntax for setting a variable by configuration file is the same as setting a variable in your shell:


`export PATH=$PATH:/snap/bin:/home/username/bin`

Close the current shell, or else for it to load the updated config:

`. ~/.bashrc`

Take another look at your system path:

`echo $PATH`

It is now set correctly to include your additional custom directory.

# Sources
* [What are environment variables in Bash?](https://opensource.com/article/19/8/what-are-environment-variables)
* [How To View and Update the Linux PATH Environment Variable](https://www.digitalocean.com/community/tutorials/how-to-view-and-update-the-linux-path-environment-variable)
* [How to Add a Directory to PATH in Linux](https://linuxize.com/post/how-to-add-directory-to-path-in-linux/)
* [Understanding the PATH Variable in Linux](https://medium.com/towards-data-engineering/understanding-the-path-variable-in-linux-2e4bcbe47bf5)


