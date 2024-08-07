# What is a process in linux?
A process is an instance of a program currently running — i.e. in execution — on a linux computer system's kernel. It consists of the program instructions and inputs from system users. Effectively any command you execute starts a process. A process can perform tasks such as writing a file or running a server online. 

Every process is given a unique ID, known as a **process ID number (PID)**, that is assigned when a process is created. Processes also have owners who are typically the active user of the system who initiated the process creation. The lifecycle of a process ends when the parent process waits on the PID after the process has been ended or terminated. A program is associated with its PID as well as parent process ID (PPID). 

## Types of processes in linux
* __Foreground processes__: Processes that require input from the user and are characterized their interactivity, also referred to as an interactive processes. A foreground process controls the terminal or CLI (command-line interface) while it is running, and any input or output is shown on the screen. Additionally, the user can participate in the process by giving instructions and providing input. Foreground processes are valuable when you want to run a command or program, see the outcoome right away, and also be able to interact with it. Some examples are command-line editors, file managers, even an Office program.
* __Background processes__: Non-interactive operations carried out in the background and do not call for any participation from the user, also referred to non-interactive or automatic processes. Although the user initiates these processes through the terminal or the CLI, they tend to run independently of the terminal, enabling the user to use the terminal and issue additional commands while the background process is active. The standard methos for starting background processes in the terminal is to add an ampersand `&` to the end of the command for the the process, e.g. `nano /path/of/file/to/open.txt &`. Another way to start a background process is to issue a command with `nohup`, which ensures that it will continue to run even if the user logs out or closes the terminal.

Further sections of processes:
* Init process: First process that starts when a Linux or Unix-like system is booted. It precedes other processes that can be used on the CLI, is started by the kernel, and has a PID of 1.
* Parent process: A process that has produced one or more child processes. When a process initiates another process, the initiating process is referred to as the parent process. A shell is an example of a parent process; when a command is run, the shell is thought of as the parent process and the process that executes the command is thought of as the child process.
* Child process: A newly initiated process started by a parent process. Inherits environment variables and the current working directory from the parent process. A child process has the ability to produce additional child processes, resulting in a tree-like structure of processes. Parent and child processes can use different inter-process communication (IPC) mechanisms like pipes, sockets, and signals to communicate.
* Orphaned process: A child process whose parent process has ended or left the system – typically from a crash or abrupt termination – without properly closing the child process down or reaping it. The **init process** (PID 1) is typically assigned as the new parent process. It is best practice for a parent process to properly close down its child process when they exit, using `wait()` or `waitpid()` system calls or the `SIGCHLD` signal.
* Zombie process: A child process that has finished execution but whose parent process has not yet received its exit status. Also known as a _defunct_ proccess it remains as a zombie process in the process table until the parent process (sometimes the **init process**) collects its exit status using `wait()`, `waitpid()`, or `SIGCHLD`.
* Daemon process: A background process that runs without any user input and typically handles system-related duties. They typically run continuously and are launched at system startup, carrying out operations like logging, scheduling, and managing network services. System-level utilities like systemctl or service can be used to start, stop, and restart them. Some examples include the `httpd daemon`, `sshd daemon`, and `cron daemon`.

## Process states in linux
The linux operating system tracks each process's state (running, stopped, sleeping) and resource use, such as memory and CPU space.

* __Running__: An active program instance is referred to as a running process.
* __Sleeping__: A process that is dormant and waiting for a resource it can use to be made available on the system. While not actively running and using CPU resources, a sleeping process keeps its PID and previous allotted resources. A process may enter a sleep state because it is waiting for input/output operations to finish, a lock or semaphore to appear, or for a signal or message from another process.
* __Stopped__: A stopped process is one that has been stopped either by the operating system or by a user. The process is still assigned resources and retains its PID but is not currently running.

# What is process management in linux?
Process managment allows the user to view and manage the processes running on the system, including managing process resources, scheduling processes to run on the CPU, and terminating processes when necessary. Examples of these processes include memory usage, CPU usage, and priority.

# Different commands for process management in linux
There are two commands available in linux to track running processes: `top` and `ps`.

## Track a running process with `top`
The `top` command displays a list of processes that are running in real-time along with their memory and CPU usage.
```
top
```
This is what the output table columns mean:

* PID: Unique Process ID given to each process.
* User: Username of the process owner.
* PR: Priority given to a process while scheduling.
* NI: ‘nice’ value of a process.
* VIRT: Amount of virtual memory used by a process.
* RES: Amount of physical memory used by a process.
* SHR: Amount of memory shared with other processes.
* S: state of the process
    * ‘D’ = uninterruptible sleep
    * ‘R’ = running
    * ‘S’ = sleeping
    * ‘T’ = traced or stopped
    * ‘Z’ = zombie
* %CPU: Percentage of CPU used by the process.
* %MEM; Percentage of RAM used by the process.
* TIME+: Total CPU time consumed by the process.
* Command: Command used to activate the process.

You can use `up/down` arrow eys to navigate up and down through the list. To quit press `q`. To kill a process, highlight the process with the up/down arrow keys and press `k`.

## Display current process status with `ps`
The `ps` command is short for 'Process Status'. It displays the currently-running processes. However, unlike the top command, the output generated is not in realtime.
```
ps
```

This is what the output table columns mean:
* PID: Process ID
* TTY: Terminal type
* TIME: Total time the process has been running
* CMD: Name of the command that launches the process

To get more information using `ps` command use:
```
ps -u
```

Here:
* %CPU represents the amount of computing power the process is taking up.
* %MEM represents the amoung of memory the process is taking up.
* STAT represents process state.

While the `ps` command only displays the processes that are currently running, you can also use it to list all the processes:
```
ps -A
```
# Stopping a process with `kill`
To stop a process in linux, use the `kill` command. `kill` sends a signal to the process. There are different types of signals that you can send, however the most common one is `kill -9` which is `SIGKILL`. You can list all the signals using:

```
kill -L
```
The default signal is 15, which is `SIGTERM`. Which means if you just use the kill command without any number, it sends the SIGTERM signal.

The syntax for killing a process is:
```
kill [pid]
```
or you can also use:
```
kill -9 [pid]
```
This command will send a `SIGKILL` signal to the process. This should be used in case the process ignores a normal kill request.
# Change the priority of a process
In linux you can prioritize between processes. The priority value for a process is called the 'niceness' value. Niceness values can range from -20 to 19. 0 is the default value. The fourth column in the output of the `top` command is the column for the niceness value.

To start a process and give it a nice value other than the default one, use:
```
nice -n [value] [process name]
```

To change the nice value of a process that is already running use:
```
renice [value] -p '[PID]'
```
# Other process management commands
* `ps [PID]`: Shows the state of an exact process.
* `pidof`: Shows the process ID of a process.
* `pgrep`: A command that finds and displays the process IDs of processes that match a given pattern. It can be used to discover a running program's process ID.
* `pstree`: Displays the parent-child relationship between processes and the system's process hierarchy. It gives the process tree a tree-like representation and highlights the connections between processes.
* `df`: Shows the disk management of your system.
* `free`: Shows the status of your RAM.
* `bg`: For sending a running process to the background.
* `fg`: For running a stopped process to the foreground.
* `nohup`: Will run a program in the background and will keep it running even after you close the shell session.
* `killall`: Sends a signal to all processes with a specified name rather than a specific process ID.
* `pkill`: Lets you search for the program and to stop a program based on its name or other details.
* `jobs`: Will show you the information about the programs that are running into your current shell session.
* `screen`: Will create the virtual terminal session that you can detach and then reattach it to at any time.
* `ps -aux`: Displays a detailed list of all the running programs on the system, including those started by the users.
* `systemctl`: This command will manage the system services and the processes into your system.
* `top -H`: Will show the real time resource usage like CPU, memory, and the details about running programs _in a hierarchical view_.
* `lsof`: This command lists open network file descriptors. It will report a list of all open files and the processes that opened them.

# Resources
* [What is Process Management in Linux?](https://www.scaler.com/topics/process-management-in-linux/)
* [Commands for Process Mangement in Linux](https://www.digitalocean.com/community/tutorials/process-management-in-linux)
* [Linux Process Management Command Cheat Sheet](https://www.geeksforgeeks.org/linux-process-management-command-cheat-sheet/)
* [Linux Process Management: A Deep Dive](https://dev.to/rejoice/linux-process-management-a-deep-dive-2lmk)
