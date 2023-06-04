# Redirection

## Jump to:
[wget](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/networking.md#wget) | [ssh](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/networking.md#ssh)

## wget

A power tool for recursively downloading files, for example from the Web.

### Download a single file
```bash
wget http://mtdukes.com/work.html
```

Saves the file from the specified URL.

### Download a list of files
```bash
wget -i file_list.txt
```

Saves individual files from URLs specified in a TXT file, one URL on each line.

### Download a directory
```bash
wget --recursive --no-parent http://mtdukes.com
```

Recursively download an entire site's contents.

## ssh

Protocol to login to a remote host. SSH server runs on the remote host, listening for incoming connections, by default, on port 22, while an SSH client is used on teh local system to communicate with the remote server.

### Connect to a remote host
Remote host name: `remote-sys`

```bash
ssh remote-host
```

To accept the credentials of the remote host, enter `yes` when prompted. Once connection is established, the user is prompted for a password.
Shell session continues until the user enters the `exit` command at the remote shell prompt.

### Connect to a remote host with a different username

```bash
ssh user_name@remote-sys
```

Once authenticated with a remote host, the host keys are stored in the directory `/home/me/.ssh/known_hosts`. ssh allows us to execute a single command on a remote system. Example of executing the `free` command on a remote host named `remote-sys`

```bash
ssh remote-sys free
```

Perform an `ls` on the remote system and redirect the output to a file on the local system

```bash
ssh remote-sys 'ls *' > dirlist.txt
```

### Run a GUI program on a remote system that also displays on local system
Program name is `xload`
```bash
ssh -X remote-sys
xload
```

## ping

### Send a ping to a website
The ping command sends a special network packet called an ICMP ECHO_REQUEST to a specified host.

To see whether we can reach _linuxcommand.org_:
```bash
ping linuxcommand.org
```

## traceroute

### List all the hops network traffic takes
Route being from local system to specified host.

```bash
traceroute slashdot.org
```

## ip

Examine a system's network interfaces and routing table.

```bash
ip a
```


