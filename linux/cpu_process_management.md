# What is a process in linux?
A process is an instance of a program currently running — i.e. in execution — on a linux computer system's kernel. It consists of the program instructions and inputs from system users. Effectively any command you execute starts a process. A process can perform tasks such as writing a file or running a server online. 

Every process is given a unique ID, known as a **process ID number (PID)**, that is assigned when a process is created. Processes also have owners who are typically the active user of the system who initiated the process creation. The lifecycle of a process ends when the parent process waits on the PID after the process has been ended or terminated. A program is associated with its PID as well as parent process ID (PPID). 

## Types of processes in linux
* __Foreground processes__: Processes that require input from the user and are characterized their interactivity, also referred to as an interactive processes. A foreground process controls the terminal or CLI (command-line interface) while it is running, and any input or output is shown on the screen. Additionally, the user can participate in the process by giving instructions and providing input. Foreground processes are valuable when you want to run a command or program, see the outcoome right away, and also be able to interact with it. Some examples are command-line editors, file managers, even an Office program.
* __Background processes__: Non-interactive operations carried out in the background and do not call for any participation from the user, also referred to non-interactive or automatic processes. Although the user initiates these processes through the terminal or the CLI, they tend to run independently of the terminal, enabling the user to use the terminal and issue additional commands while the background process is active. The standard methos for starting background processes in the terminal is to add an ampersand `&` to the end of the command for the the process, e.g. `nano /path/of/file/to/open.txt &`. Another way to start a background process is to issue a command with `nohup`, which ensures that it will continue to run even if the user logs out or closes the terminal.

Further sections of processes:
* Init process: First process that starts when a Linux or Unix-like system is booted.
* Parent process
* Child process
* Orphaned process
* Zombie process
* Daemon process

## Process states in linux

# What is process management in linux?
Process managment allows the user to view and manage the processes running on the system, including managing process resources, scheduling processes to run on the CPU, and terminating processes when necessary. Examples of these processes include memory usage, CPU usage, and priority.

# Resources
* [What is Process Management in Linux?](https://www.scaler.com/topics/process-management-in-linux/)
* [Commands for Process Mangement in Linux](https://www.digitalocean.com/community/tutorials/process-management-in-linux)
* [Linux Process Management Command Cheat Sheet](https://www.geeksforgeeks.org/linux-process-management-command-cheat-sheet/)
* [Linux Process Management: A Deep Dive](https://dev.to/rejoice/linux-process-management-a-deep-dive-2lmk)
