# What is an environment in linux

An **environment** in linux is one way that the shell keeps track of all the settings and details the shell compiles to determine its behavior and access to resources.

The environment provides a medium through which the shell process can get or set settings and, in turn, pass these on to its child processes.

# How environments and environment variables work in linux

The environment is implemented as strings that represent key-value pairs. If multiple values are passed, they are typically separated by colon (`:`) characters.

The keys in these scenarios are variables that have the following format:

```
KEY=value
KEY="value with spaces"
KEY=value1:value2:value3
```

* The names of variables are case-sensitive. By convention, _environment_ variables should have UPPER CASE names. This helps users distinguish environmental variables within other contexts.
* When assigning multiple values to the variable they must be separated by the `:` character.
* There is no space around the equals `=` symbol.
* If the value contains significant white-space, quotations are used `""`

# Environment variables vs. shell variables

Variables can be classified into two main categories, environment variables, and shell variables.

* **Environment variables** are variables that are defined for the current shell, available system-wide, and are inherited by all spawned child processes and shells. Environmental variables are used to pass information into processes that are spawned from the shell.
* **Shell variables** are variables that apply only to the current shell instance. They are contained exclusively within the shell in which they were set or defined. Each shell such as `zsh` and `bash`, has its own set of internal shell variables and are often used to keep track of ephemeral data, like the current working directory.

# Printing and listing shell and environment variables

Each shell session keeps track of its own shell and environmental variables. We can access these in a few different ways in linux.

* `env` – The command allows you to run another program in a custom environment without modifying the current one. When used without an argument it will print a list of the current environment variables.
  * `env` lets you modify the environment that programs run in by passing a set of variable definitions into a command like this:
  * `env VAR1="value" command_to_run command_options`
  * Since child processes typically inherit the environmental variables of the parent process, this gives you the opportunity to override values or add additional variables for the child.
* `printenv` – The command prints all or the specified environment variables.
* `set` – The command sets or unsets shell variables. When used without an argument it will print a list of all variables including environment and shell variables, and shell functions.
* `unset` – The command deletes shell and environment variables.
* `export` – The command sets environment variables.

# Setting shell and environment variables

## Creating shell variables

To create a _shell_ variable, you only need to specify a name and value:

```
TEST_VAR='Hello world!'
```

You can verify that the variable is set in one of two ways, using `echo` or filtering the output of `set` with `grep`:

```
echo $TEST_VAR
set | grep TEST_VAR
```

We can verify that this is not an environmental variable by trying the same thing with `printenv`. Both commands below should give you nothing in return.

```
printenv | grep TEST_VAR
printenv TEST_VAR
```

Additionally, since `TEST_VAR` is a shell variable, it won't be passed onto any child processes. This can be verified by trying to print the variable in a new shell and getting an empty output in one of the two ways below.

```
bash -c 'echo $TEST_VAR'
```
or
```
bash
echo $TEST_VAR
exit
```

## Creating environment variables

You can turn a current shell variable into an environment variable by _exporting_ it.

```
export TEST_VAR
```

You can also set _new_ environment variables with the `export` command as well.

```
export MY_NEW_VAR="My New Var"
```

However, environment variables created in this way are available only in the current session. If you open a new shell or if you log out all variables will be lost.

This is because environmental variables are only passed to child processes. There isn’t a built-in way of setting environmental variables of the parent shell. This is good in most cases and prevents programs from affecting the operating environment from which they were called.

# Demoting and Unsetting Variables

You can change an environment variable back to a shell varible with `export` as well.

```
export -n TEST_VAR
```

To completely remove a variable, either shell or environment use the `unset` command.

```
unset TEST_VAR
```

# Implementing persistent environment variables

To make environment variables persistent you need to define those variables in the bash configuration files.

Most environment variables you want to set are user-specific environment variables to be available in both login and non-login shells. 

To set these environment variables they need to be defined in the `~/.bashrc` file. Open the `~/.bashrc` file in a text editor like `vim` or `nano` and add a line with the same command you would use in the terminal.

```
export VARNAME=value
```

Then force your current session to read the `~/.bashrc` file name with the command:

```
source ~/.bashrc
```

In new shell sessions the `VARNAME` environment variable will now be available.

For system-wide environment variables they are set in the `/etc/environment` file in this format:

```
FOO=bar
VAR_TEST="Test Var"
```

For environment variables loaded whenever a bash login shell is entered you need to edit the `/etc/profile` file with the same `export` command:

```
export JAVA_HOME="/path/to/java/home"
export PATH=$PATH:$JAVA_HOME/bin
```
# Collison protection variables
If you would rather not override a variable that might already exist when creating a new variable, there's a special syntax to set a variable to its existing value unless its existing value is empty.

Assume that `FOO` is _already_ set to `/home/username/Documents`

```
FOO=${FOO:- "bar"}
echo $FOO
```

The color-dash `:-` notation causes **declare** to default to an existing value. To see this process work the other way, clear the variable, and try again:

```
unset FOO
echo $FOO
FOO=${FOO:- "bar"}
echo $FOO
```

# Passing variables to child process
When you create a variable, you are creating what is called a _local variable_. This means that the variable is known to your current shell and only your current shell.

This setup is an intentional limitation of a variable’s _scope_. Variables, by design, tend to default to being locally available only, in an attempt to keep information sharing on a need-to-know basis.

If you want to pass a variable to a child process, you can **prepend** a command with variable definitions, or you can **export** the variable to the child process.

## Prepending variables
You can prepend any number of variables before running a command. Whether the variables are used by the child process is up to the process, but you can pass the variables to it no matter what:

```
FOO=123 bash
echo $FOO
```

## Exporting variables
The **export** command — a keyword built into bash — broadens the *scope* of whatever variable(s) you specify:

```
PS1="% "
FOO=123
export PS1
export FOO
bash
echo $PS1
echo $FOO
```

It's not just a child shell that has access to a local variable that's been passed to it or exported, it's any *child process* of that shell. You can launch an application from the same shell, and that variable is available as an environment variable from *within* the application.

In this way, variables exported for *everything* on your system to use are called **environment variables**

# Resources
* [How to Read and Set Environment and Shell Variables on Linux](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-linux)
* [How to Set and List Environment Variables in Linux](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
* [Using variables in Bash](https://opensource.com/article/19/8/using-variables-bash)
