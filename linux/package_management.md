From [Ubuntu Server docs](https://ubuntu.com/server/docs/package-management)

# Introduction

Debian package files typically have the extension .deb, and usually exist in repositories, which are collections of packages typically found online, or on physical media such as CD-ROMs. Packages are normally in a pre-compiled binary format; installation is quick and requires no software compilation.


# Advanced Packaging Tool (APT)

The `apt` command is a powerful command-line tool, which works with Ubuntu’s Advanced Packaging Tool (APT). The commands contained within `apt` provide the means to install new software packages, upgrade existing software packages, update the package list index, and even upgrade the entire Ubuntu system.

Actions of the apt command, such as installation and removal of packages, are logged in the `/var/log/dpkg.log` log file.

## Installing packages

As an example, to install the `nmap` network scanner, run the following command:

```
sudo apt install nmap
```

You can install or remove multiple packages at once by separating them with spaces.

## Removing packages

To remove the package installed in the previous example, run the following:

```
sudo apt remove nmap
```

Adding the `--purge` option to `apt remove` will remove the package configuration files as well. 

The `apt` tool is intended to be used interactively. The `apt-get` command should be used in shell scripts (perhaps with the `--quiet` flag). For basic commands the syntax of the two tools is identical.

## Updating the package index

The APT package index is a database of available packages from the repositories defined in the `/etc/apt/sources.list` file and in the `/etc/apt/sources.list.d` directory. To update the local package index with the latest changes made in the repositories, type the following:

```
sudo apt update
```

## Upgrading packages
Installed packages on your computer may periodically have upgrades available from the package repositories (e.g., security updates). To upgrade your system, first update your package index and then perform the upgrade – as follows:

```
sudo apt update
sudo apt upgrade
```

## Common APT option flags

### Simulate
To do a "dry run" of a procedure in order to get an idea of what an action will do, you can pass the `-s` flag for "simulate"

```
sudo apt install -s htop
```

In place of actual actions, you can see an `Inst` and `Conf` section specifying where the package would be installed and configured if the “`-s`” was removed.

### "Yes" to prompts
If you do not want to be prompted to confirm your choices, you can also pass the `-y` flag to automatically assume “yes” to questions.

```
sudo apt remove -y htop
```

### Download but not install
If you would like to download a package, but not install it, you can issue the following command:

```
sudo apt install -d packagename
```

The files will be retained in `/var/cache/apt/archives`.

### Suppress Output
If you would like to suppress output, you can pass the `-qq` flag to the command:

```
sudo apt remove -qq packagename
```

## Apt-Cache
The apt packaging tool is actually a suite of related, complimentary tools that are used to manage your system software.

While `apt` is used to upgrade, install, and remove packages, `apt-cache` is used to query the package database for package information.

### Apt-cache search
You can use `apt-cache search` to search for a package that suits your needs. Note that apt-cache doesn’t usually require administrative privileges.


For instance, to find `htop`, an improved version of the `top` system monitor, you can use:

```
apt-cache search htop
```

You can search for more generic terms also. In this example, we’ll look for mp3 conversion software:

```
apt-cache search mp3 convert
```

### Apt-cache package info

To view information about a package, including an extended description, use the following syntax:

```
apt-cache show package_name
```
This will also provide the size of the download and the dependencies needed for the package.

To see if a package is installed and to check which repository it belongs to, you can use `apt-cache policy`:

```
apt-cache policy package_name
```

More detailed tutorials can be found [here](https://www.digitalocean.com/community/tutorials/ubuntu-and-debian-package-management-essentials).

## APT configuration

Configuration of the APT system repositories is stored in the `/etc/apt/sources.list` file and the `/etc/apt/sources.list.d` directory.

```
# no more prompting for CD-ROM please
# deb cdrom:[DISTRO-APT-CD-NAME - Release i386 (20111013.1)]/ DISTRO-SHORT-CODENAME main restricted
```

You can edit the file to enable and disable repositories. For example, to disable the requirement to insert the Ubuntu CD-ROM whenever package operations occur, simply comment out the appropriate line for the CD-ROM, which appears at the top of the file:

```
# no more prompting for CD-ROM please
# deb cdrom:[DISTRO-APT-CD-NAME - Release i386 (20111013.1)]/ DISTRO-SHORT-CODENAME main restricted
```

For further information about using APT, read the comprehensive [APT User's Guide](https://www.debian.org/doc/manuals/apt-guide/index.en.html), or type in the command line `apt help`


# dpkg
To list _all_ packages in the system’s package database (both installed and uninstalled) run the following command from a terminal prompt:

```
dpkg -l
```

Depending on the number of packages on your system, this can generate a large amount of output. Pipe the output through `grep` to see if a specific package is installed:

```
dpkg -l | grep apache 2
```

Replace `apache2` with any package name, part of a package name, or a regular expression.

## List files

To list the files installed by a package, in this case the `ufw` package, enter:

```
dpkg -L ufw
```

If you are unsure which package installed a file, `dpkg -S` may be able to tell you. For example:

```
dpkg -S /etc/host.conf
```

Many files are automatically generated during the package install process, and even though they are on the filesystem, `dpkg -S` may not know which package they belong to.

## Installing a deb file

You can install a local `.deb` file by entering:

```
sudo dpkg -i zip_3.0-4_amd64.deb
```

Change `zip_3.0-4_amd64.deb` to the actual file name of the local `.deb` file (you have probably downloaded from the internet) you wish to install.

## Uninstalling packages

You can uninstall a package by running:

```
sudo dpkg -r zip
```

**Caution**: Uninstalling packages using dpkg, is **NOT** recommended in most cases. It is better to use a package manager that handles dependencies to ensure that the system is left in a consistent state. For example, using `dpkg -r zip` will remove the zip package, but any packages that depend on it will still be installed and may no longer function correctly as a result.

More info from the `dpkg` [man page](https://manpages.ubuntu.com/manpages/oracular/en/man1/dpkg.1.html)

# Extra repositories

In addition to the officially-supported package repositories available for Ubuntu, there are also community-maintained repositories which add thousands more packages for potential installation. Two of the most popular are the _Universe_ and _Multiverse_ repositories. These repositories are not officially supported by Ubuntu, but because they are maintained by the community they generally provide packages which are safe for use with your Ubuntu computer.

For more information, see our guide on using [third-party repositories](https://ubuntu.com/server/docs/third-party-repository-usage).

By default, the _universe_ and _multiverse_ repositories are enabled. If you would like to disable them, edit `/etc/apt/sources.list` and comment out the following lines:

```
deb http://archive.ubuntu.com/ubuntu DISTRO-SHORT-CODENAME universe multiverse
deb-src http://archive.ubuntu.com/ubuntu DISTRO-SHORT-CODENAME universe multiverse
    
deb http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME universe
deb-src http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME universe
deb http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME-updates universe
deb-src http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME-updates universe
    
deb http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME multiverse
deb http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME-updates multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ DISTRO-SHORT-CODENAME-updates multiverse
    
deb http://security.ubuntu.com/ubuntu DISTRO-SHORT-CODENAME-security universe
deb-src http://security.ubuntu.com/ubuntu DISTRO-SHORT-CODENAME-security universe
deb http://security.ubuntu.com/ubuntu DISTRO-SHORT-CODENAME-security multiverse
deb-src http://security.ubuntu.com/ubuntu DISTRO-SHORT-CODENAME-security multiverse
```

