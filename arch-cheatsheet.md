# Arch Cheatsheet

The Arch Cheatsheet. A lot of these concepts also apply to other unix-like operating systems

## shell
### become superuser
For some of theese commands you need to type `sudo` in front of them to work if you are not the superuser.
```
su // becoming the superuser
```

### Basic
### get Information
```
hostnamectl // get basic information about the server
```
### execute scripts
```
source <path-to-script>
```
### misc
```
<command> | <command>       // route out from one command as input to other command
<command> >> <path-to-file> // route stdout to a file
<command> &                 // execute command in background
<command> && <command>      // execute two commands sequentially
$<VARIABLE_NAME>            // access variables
clear                       // clear terminal page
man <programname>           // read manual page
cat <path-to-file>          // output file contents
echo (<variable>|<value>)   // output some value
date                        // get current date and time
ping <ip-address>           // pin an ip address
```
### Navigation
```
cd <location>
/* you can especially use the following characters for <location>
 .. if you want to get one step out
 / if you want to get to the root of the computer
 ~ if you want to get to the root of your user
*/
open <path-to-file>(+)   // folders will be opend in finder, files will be opened with their default application
```
### get information about the filesystem 
```
pwd                 // show current location
ls <location>       // shows all visible files in folder
ls -a <location>    // shows ALL files in folder
ls -l <location>    // shows files in a "long list" format
ls -i <location>    // shows the filesnames with their Inode numbers
locate <filename>   // find a specific file in the system
```
### creating stuff
```
mkdir <path-to-file>(+) // creates directory(s)
touch <path-to-file>(+) // creates file(s), or just touches a already existing file, which results in update of last accessed date
```
### removing stuff
```
rm <path-to-file>(+)     // deleting files(s)
rm -rf <path-to-file>(+)  // deleting folder(s)
```
### moving/renaming stuff
```
mv <startlocation>/<name> <endlocation/name> // also used for renaming
ln <file> <newfile>                          // create second link to file (reference count goes up)
ln -s <file> <linkfile>                      // create soft link. This points to original file
```

### Environment variables
### general
```
printenv                        // get a list of all environment variables
printenv <NAME>                 // get value of specific variable
export <NAME>=<value>           // set a environment variable
export <NAME>=$<NAME>:<value>   // append to environment variable
unset <NAME>                    // delete a variable
```
### Importent Environment variables
* `PATH` list of all locations where executable binaries are
* `USER` current logged in user
* `HOME` currnet logged in user path

### permanently save information for all sessions
To permanently save stuff you have to add it to your .bash_profile (or .profile or .zshrc or what ever shell you are using) file, located in your user directory
```
export <NAME>=<value>    // set environment variables
alias <NAME>="<command>" // make aliases for commands
```

### File Access
`-rwxrw-r--``
* First symbol `-` for file, `d` for directory
* Group `rwx` `r` you can read it, `w` you can write it, `x` you are allowed to execute it
* First Group of three chars: Access rights for Owner
* Second Group of three chars: Access rights for the group
* Third Group of three chars: Access rights for everyone else (other)
```
chmod <who><+|-><permission> <filename>
// <who> = `u` for user, `g` for group, `o` for other
// + | - = add permission or remove permission
// permission = r | w | x
```

### Processes
```
ps                       // list all running processes in current terminal session
ps x                     // list all running processes systemwide
ps -He                   // list all processes with relationship
ps -axjf                 // list all processes with relationship
ps aux                   // list all processes with useful information
```
`TTY` is the terminal session in which the process is running. If it is `?` this means that process was started by system. `STAT` is the status:
* `s` process is process leader or root process
* `S` process is sleeping, waiting for resource to be available
* `D` process is running in uniteruptable sleep, which means it is waiting for something (e.g. user input)
* `R` process is running
* `T` process is stopped
`PPID` is partent process id, `UID` user id of user who started the process

```
kill <pid>               // kill process
kill -9 <pid>            // force kill proces
pkill <processname>      // kill process
```

### Systemd
Init process is process with pid. Is responsible for managing the other processes.
```
systemctl --type=service                // lists all units
systemctl list-unit-files               // list unit files
systemctl status <unit>                 // get the status of a unit
systemctl enable <unit>                 // enables a unit
systemctl start <unit>                  // start a unit
...
```

### New user
```
useradd <username>       // create new user `-m` to create home directory for user, `-G` to give user specific group
password <username>      // set password for that user
```

### Storage Mediums
```
fdisk -l                      // list connected disks
lsblk                         // list connected block devices and partitions
fdisk <disk>                  // edit disk partition table (partition disk, format)
cfdisk <disk>                 // same as fdisk but with grafical ui
mount <disk> <mountfolder>    // disk to folder
umount <mountfolder>          // unmount disk from folder
mkfs.fat -F32 <partition>     // format a partition in FAT32 format
mkfs.ext4 <partition>         // format a partition in EXT4
```

### Fonts
```
fc-cache -fv             // scan /usr/share/fonts directory
fc-list                  // list all fonts on the system
```

### Pacman
Installing programs, see which programms are installed, update programs (only on Linux). Use homebrew for this when you are on mac
```
pacman -S <packagename>+       // install a package or uprade it if it is already installed
pacman -Rns <packagename>+     // remove a package (-n with config files, -s and dependencies)
pacman -Qdtq | pacman -Rns -   // remove all unnecessary packages
pacman -Syu                    // upgrade all packages (-y refrech local package chache, -u update system)
pacman -Ss <packagename>       // search for a package
pacman -Qs <packagename>       // check if packages is installed or not
pacman -Qe                     // list all explicitly installed packages
```

## Programms
### xorg
Xorg is the most popular window server amongst linux users (alternative Wayland)
```
// Install
pacman -S xorg xorg-xinit // xinit is a script which starts the Window Server

// Run
startx // on startup the file `~/.xinitrc` is run. Here you can startup window manager and other programs
```

## QTile
QTile is a window manager. It requires A window server running like xorg.

## Alacritty
Alacritty is a terminal emulator. It requires a window server running like xorg. Config file can be at `~/.config/alacritty/alacritty.yml` or `~/.alacritty.yml`

### xrandr
Uitility to set size, orientation and reflection of the outputs for a screen. (Use for size of screen in VirtualBox)
```
// Install
pacman -S xrandr

// Usage
xrandr                                   // list
cvt <width> <height>                     // print modeline for creating a new mode with desired width and height
xrandr --newmode <modeline>              // create new mode
xrandr --addmode <display> <name>        // add new mode to display
xrandr --output <display> --mode <name>  // set display to specific mode, hence to specific resolution
```

### http requests
```
curl <url>                      // get request
curl --data <data> <url>        // post request
curl -X PUT --data <data> <url> // put request
curl -X DELETE <url>            // delete request
```
### ftp requests
```
curl -T <file> ftp:<url>        // upload file
curl -O ftp:<url>               // download file
```
### flags
```
/*
Flags:
-i                      include header
-I                      only header
-o <path-to-file>       write response to file
-O <location>           download rescource
-u <username>:password  authenticate
-L                      accept redirects
-H <header>             configure header
*/
```

### ssh
connect and log in to servers with ssh to controll them remotely. ssh keys are located in the ~/.ssh directory
```
ssh <username>@<url>                            // connect
exit                                            // disconnect
ssh-keygen                                      // generate ssh key to ~/.ssh, you only need one
ssh-copy-id -i <publickey> <username>@<url>     // copy your public key to the server
scp <file>(+) <username>@<url>                  // copy file(s) and folder(s) from your computer to server (better use sftp)
```

### sftp
transfer files to other server via a secure connection. (better than ftp)
```
sftp <username>@<url>           // connect
/* after you are connected you can access the local computer with the prefix l (e.g. `lcd` to navigate on your local computer) */

// All following commands only work while you are connected
put <path-to-file>           // upload file to remote machine (regex is allowed)
get <path-to-file>           // download file from remote
// -r  flag is needed to copy directoies
```

## Important files and folders
### /etc/fstab
TODO!

### /etc/hosts
TODO!

### /etc/host
TODO!

### /usr/share/fonts
Put all your font files in there to install the respective font.

### /usr/share/kbd/keymaps/
All available keymaps for the system

### /etc/sudoers
Control which users get sudo privileges
