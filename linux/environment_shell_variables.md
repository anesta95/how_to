# What are environment variables?

Standard UNIX variables are split into two categories, environment variables and shell variables. In broad terms, shell variables apply only to the current instance of the shell and are used to set short-term working conditions; environment variables have a farther reaching significance, and those set at login are valid for the duration of the session. By convention, environment variables have UPPER CASE and shell variables have lower case names.

Environment variables are a set of dynamic named values stored within the system that is used by applications. Each variable contains a name and an associated value. Usually, the name is in UPPER CASE, and the values are case-sensitive. Environment variables can contain information about your login session. They're stored for the system shell to use when executing commands.


To _temporarily_ set and unset an environment variable you would use the terminal commands ```export TEMP_ENV_VAR=/this/specific/filepath```. Issue the command ```echo $TEMP_ENV_VAR``` to check the value of your enviroment variable. This new variable is available system-wide and is inherited by all spawned child processes and shells.

To unset that environment variable, just use ```unset TEMP_ENV_VAR``` in the terminal. You can also list out all of your currently set environment variables with the command `set`

# Understanding environment variables
You don’t often use environment variables directly. They’re referenced by individual applications and daemons as needed. For instance, your home directory is set as an environment variable when you log in. For example, on Linux you can see your `HOME` environment variable's contents like this:

```
echo $HOME
```

You can view all environment variables set on your system with the `env` command. The list is long, so pipe the output through `more` or `less` to make it easier to read:

```env | less```

## The PATH
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

# Discovering other environment variables
How do you find out which environment variables are meaningful?

The answer lies in an application’s documentation. For instance, to find out what options are available to you for your general Bash environment, you can read the Bash documentation. While the Bash man page mentions many important variables, the GNU info page for Bash features two exhaustive lists of useful Bourne Shell and Bash environment variables, and how each is used.

For example, in the info page list:

```
'HISTCONTROL'
     A colon-separated list of values controlling how commands are saved
     on the history list.  If the list of values includes 'ignorespace',
     lines which begin with a space character are not saved in the
     history list.  A value of 'ignoredups' causes lines which match the
     previous history entry to not be saved.  A value of 'ignoreboth' is
     shorthand for 'ignorespace' and 'ignoredups'.
     [...]
```

This output tells you that the `HISTCONTROL` environment variable controls how your Bash history is presented, and what values you can use to customize that experience. In this example, the `ignoredups` value tells the output of the `history` command to ignore duplicate lines.

Test by issuing the same command twice in a row:

```
echo "hello world"
echo "hello world"
```

View your most recent bash command history:
`history | tail -5`

Because the value of your `$HISTCONTROL` environment variable (which you can check with `echo $HISTCONTROL`) is `ignoreboth`, duplicate shell commands are not saved.

However if it wasn't you could set a new environment variable in your `.bashrc` file based on the information exerpted from the `info bash` page above.

```export HISTCONTROL=$HISTCONTROL:ignorespace:ignoredups```

Save then load your new configuration:

```source ~/.bashrc```

# Resources
* [Linux 101: What are environment variables?](https://www.techrepublic.com/article/linux-101-what-are-environment-variables/)
* [What are environment variables in Bash?](https://opensource.com/article/19/8/what-are-environment-variables)
* [How to Read and Set Environment and Shell Variables on Linux](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-linux)
* [How to Set and List Environment Variables in Linux](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
* [How to Set an Environment Variable in Linux](https://www.freecodecamp.org/news/how-to-set-an-environment-variable-in-linux/)
* [Using variables in Bash](https://opensource.com/article/19/8/using-variables-bash)
