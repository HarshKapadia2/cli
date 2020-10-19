
# Unix/Linux Terminal

 **Table of Contents**

* [Opening the Terminal](#opening-the-terminal)
* [Keyboard Shortcuts](#keyboard-shortcuts)
* [File System](#file-system)
	* [Absolute and Relative paths](#absolute-and-relative-paths)
* [Basics of Linux/Unix Commands](#basics-of-linuxunix-commands)
	* [Command Structure](#command-structure)
	* [Command Help](#command-help)
* [List of Commands](#list-of-commands)

## Opening the Terminal

### Linux
Search for "terminal" in the apps menu in most cases. You might have to look up specific instructions for your distro.
Default Keyboard shortcut: <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>
### MacOS
Search for "terminal" in Spotlight.
Keyboard shortcut: <kbd>Control</kbd> + <kbd>Option</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd>
### Windows
The in-built terminals on Windows (cmd and PowerShell) are not POSIX compliant, so you will need to do one of the following:
- Install a POSIX-compatible runtime like MinGW or Cygwin.  
  Note that `git-for-windows` includes a MinGW installation called `git-bash` by default, and is usually located in `C:\Program Files\Git\git-bash.exe`
- Enable the Windows Subsystem for Linux (WSL).
  WSL is a system developed by Microsoft that allows a full Linux OS to run alongside Windows.  
  [Learn More about WSL](https://docs.microsoft.com/en-us/windows/wsl/) | [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Use Docker containers.
  Docker allows programs to run in isolated environments called containers.
  Each container is like a fresh install of the respective OS. There are pre-built containers for many popular Linux distros like Ubuntu, Debian, CentOS, etc.
  [Get started with Docker](https://www.docker.com/get-started)
  

## Keyboard shortcuts
| Shortcut | Function |
|-|-|
| <kbd>Tab</kbd> | Complete file & directory names and to further iterate over files |
| <kbd>Shift</kbd> + <kbd>Tab</kbd> | Go back to the previous names |
| <kbd>&#8593;</kbd> or <kbd>Ctrl</kbd> + <kbd>P</kbd> | Go to all the commands previously executed in that instance of the cmd, one by one |
| <kbd>&#8595;</kbd> or <kbd>Ctrl</kbd> + <kbd>N</kbd> | Go towards the recent commands |
| <kbd>Ctrl</kbd> + <kbd>R</kbd> | Search your command history |
| <kbd>Ctrl</kbd> + <kbd>&#8592;</kbd>/<kbd>&#8594;</kbd> | Jump words |
| <kbd>Home</kbd> or <kbd>Ctrl</kbd> | Jump to the beginning and end of the line |
| <kbd>End</kbd> or <kbd>Ctrl</kbd> + <kbd>E</kbd> | Jump to the end of the line |
| <kbd>Ctrl</kbd> + <kbd>C</kbd> | Stop running processes in your terminal and bring back the prompt |

## File System
Let's get a brief on the Linux file system. If you've used Windows, you would be familiar with 	`C:`,  `D:` etc.  
In Linux, directory structure starts with `/` symbol, which is referred as the `root` directory
The `~`(tilde) is shorthand for your `home` directory.  Within your home directory, you will find common directories, such as Documents, Music, Video, etc.,

<p align="center"><img src="https://www.informit.com/content/images/chap04_9780133017601/elementLinks/thfig04-09.jpg" style="max-width:40%"></p>


### Absolute and Relative Paths
An  **absolute or full path**  points to the same location in a file system regardless of the current working directory. To do that, it must start from the root directory.
>`/home/username` is an absolute path.

By contrast, a  **relative path**  starts from some given working directory, avoiding the need to provide the full absolute path. A filename can be considered as a relative path based at the current working directory. If the working directory is not the file's parent directory, a file not found error will result if the file is addressed by its name.
>`../docs` is a relative path

## Basics of Linux/Unix Commands

### Command Structure
The components of the command line are:
- the command
- any options required by the command
- the command's arguments (if required)

The general form of a UNIX command is:
**command [-option(s)] [argument(s)]**
```bash
#only the command
clear

#command with option
ls -l

#command with argument
man pwd

#command with option and argument
rm -r project
```
### Command Help
- `man <command>` is used to display the user manual of any command that we can run on the terminal. It provides a detailed view of the command. eg: `man ls`.
- `help` command provides documentation for builtin commands. 
```bash
$ help pwd
pwd: pwd [-LP]
    Print the name of the current working directory.
    
   Options:
     -L	print the value of $PWD if it names the current working directory
     -P	print the physical directory, without any symbolic links
   
   By default, `pwd' behaves as if `-L' were specified.
   
   Exit Status:
   Returns 0 unless an invalid option is given or the current directory
   cannot be read.
```
## List of Commands
  
### Print name of cwd (current working directory)
Use `pwd` to print name of current/working directory
```bash
$ pwd
/home/username
```

### Clear screen & command history
Use `clear` or <kbd>Ctrl</kbd> + <kbd>L</kbd> to clear the screen of the cmd.
  

### Changing directories
```bash
$ pwd
/home/username

$ # providing an absolute path as argument
$ cd /etc
$ pwd
/etc

$ # to go back to previous working directory
$ # if there's a directory named '-', use './-' to go that directory
$ cd -
/home/username
$ pwd
/home/username
```
- Relative paths are well, relative to current working directory
- `.`  refers to current directory
- `..`  refers to directory one hierarchy above
- `../..`  refers to directory two hierarchies above and so on
	```bash
	$ pwd
	/home/username

	$ # go to directory one hierarchy above
	$ cd ..
	$ pwd
	/home

	$ # go to directory 'username' present in current directory
	$ # './' is optional in this case
	$ cd ./username
	$ pwd
	/home/username

	$ # go to directory two hierarchies above
	$ cd ../..
	$ pwd
	/
	```
- `cd ~/`  or  `cd ~`  or  `cd`  will go to directory specified by  `HOME`  shell variable (which is usually set to user's home directory)
	```bash
	$ pwd
	/
	$ echo "$HOME"
	/home/username

	$ cd
	$ pwd
	/home/username
	```
- _Note:_ Specifying  `/`  at end of path argument is optional

## Run files on cmd

 - You can only run files if you have the permission to execute them. Refer [Changing permissions section](#changing-permissions) for more details.
	 ```bash
	 $ ./file_to_run
	 ```
  



## Listing directory contents & directory structure

  

- `ls` to list all files and directories in the cwd (current working directory).
	```bash 
	$ ls
	projects    report.log
	```

- `ls path` to view files in another directory without changing the cwd. The path can be absolute/relative.
	```bash
	$ ls /var/
	backups  lib    lock   mail
	```

- Use the `-l` option for the long listing format. This format shows details like file permissions, ownership, size, timestamp, etc. (See  [changing permissions](#changing-permissions)  section for details on permissions, groups, etc)
	```bash
	$ ls -l
	total 84
	lrwxrwxrwx 1 username eg    12 Mar 21 12:08 projects -> ../projects/
	-rw-rw-r-- 1 username eg 39120 Feb 14  2019 report.log
	```

- `tree` to view directory structure. 

- It is not part of a standard Linux distribution, so you will need to install it.
	```bash
	$ # Install tree
	$ sudo apt install tree

	$ sudo tree
	.
	├── projects
	│   ├── a.txt
	│   ├── b.txt
	│   └── backup
	│      ├── a.txt
	│      └── b.txt
	└── report.log
	2 directories, 5 files
	```
## Changing Permissions
- In the output of  `ls -l`  command, the first 10 characters displayed are related to type of file and its permissions.
	 ```bash
		$ ls -l
		total 84
		lrwxrwxrwx 1 username eg    12 Mar 21 12:08 projects -> ../projects/
		-rw-rw-r-- 1 username eg 39120 Feb 14  2019 report.log
	```

First character indicates the  **file type**  The most common are

- `-`  regular file
- `d`  directory
- `l`  symbolic link
- for complete list, see  `-l`  option in  `info ls`

The other 9 characters represent three sets of  **file permissions**  for 'user', 'group' and 'others' - in that order

- `user`  file properties for owner of file G -  `u`
- `group`  file properties for the group the file belongs to -  `g`
- `others`  file properties for everyone else -  `o`

  **Permission characters and values**
  
| Character | Meaning | Value | File | Directory |
| ------- | ------- | ------- | ------- | ------ |
| r | read | 4 | file can be read | can see contents of directory |
| w | write | 2 | file can be modified | can add/remove files in directory |
| x | execute | 1 | file can be run as a program | can access contents of directory |
| - | no permission | 0 | permission is disabled | permission is disabled |

```bash
$ chmod 664 sample.txt
```
This means it will change the permission of sample.txt to rw-rw-r-- i.e, `user` and `group` only have read and write permissions and `others` only have read permission.
**Further Reading:**
- [File Permissions](https://www.mkssoftware.com/docs/man1/ls.1.asp#Long_Output_Format)
  
## Creating directories

  

- `mkdir dir_name` will create a folder in the cwd, if the `dir_name` doesn't already exist in the cwd.
- Use `""` if the `dir_name` has spaces, eg: `mkdir "dir name"`.

- Multiple folders can be created using `mkdir {dir1,dir2,dir3}`.
	- **Do not add any spaces** in the curly brackets for the directory names.
	```bash
	$ # mkdir [option] dir_name
	$ mkdir new_dir

	$ # Spaces in directory name
	$ mkdir "New Folder"

	$ # Creating multiple directories
	$ mkdir {dir1,dir2,dir3}
	```  

## Creating files

### `touch`  command
  - This is the easiest way to create a file in Linux.
	 ```bash
	$ touch sample.txt
	 ```

### Redirect operator (>)
- This operator tells the system to output results into whatever you specify next. The target is usually a filename. You can use this symbol by itself to create a new file.
	 ```bash
	$ > sample.txt
	 ```

### `cat` command
- The `cat` command is short for **concatenate**. It can be used to output the contents of several files, one file, or even part of a file. If the file doesn’t exist, the  `cat` command will create it.
	 ```bash
	$ cat > sample.txt
	 ```
### `echo` command
- The **`echo`** command will duplicate whatever you specify in the command, and put the copy into a file.
	 ```bash
	$ echo "Text to add to file" > sample.txt
	 ```

### Using text editors
- Vi Text Editor
	 ```bash
	$ vi sample.txt
	 ```
	 
- Vim Text Editor
	 ```bash
	$ vim sample.txt
	 ```
	 
- Nano Text Editor
	 ```bash
	$ nano sample.txt
	 ```
	 Jump to [Editing Files](#edit-files) for more details.
  

## Redirecting output

  

### Redirect to a file

- To redirect the output of a command to a file, use the `>` symbol.

Eg: `ls -al > listings.txt` will save the output of command ls -al is re-directed to `listings.txt` instead of your screen.

Note that if `listings.txt` already had some data, then this will **overwrite** the old data.

- To append to an existing file, use the `>>` symbol.

Eg: `ls -al >> listings.txt` will append the output of command ls -al is re-directed to `listings.txt`.
  

### Redirect to another command

- Sometimes, it can be useful to use the output of one command as the input to another command. This can be achieved using **pipes**.

- A pipe is created using the pip character (`|`).

- Eg: To display output of a directory listing one page at a time, use `ls  -la  | less`.

  

## Editing a file
### Vi Text Editor
- **Vi** is the oldest text editor in Linux. It was created alongside the Linux operating system for directly editing text files.
	 ```bash
	 $ vi sample.txt
	 ```
	> This will start the text editor in your terminal. 
	>  - Press the letter  `i`  to switch to insert mode, then type a few words to try it out.
	 > - To save and exit press  `Esc :x` and hit  `Enter`.
	 
### Vim Text Editor
- **Vi** editor wasn’t very user-friendly. **Vim** is a newer version, which stands for **Vi editor, Modified**.
	 ```bash
	$ vim sample.txt
	 ```
	 > This screen will look similar to the  **Vi**  editor screen. 
	 > - Press  **`i`**  to insert text, and type a few words.
	 >  - Save the file and exit by entering: <kbd>Esc</kbd>  + `:wq` + <kbd>Enter</kbd>

### Nano Text Editor
- **Nano** is a newer and much easier text editor to navigate.
	 ```bash
	$ nano sample.txt
	 ```
	 > By default, Nano puts you directly into editing mode. It also displays a helpful list of commands at the bottom of the screen.
	 > - Enter some text, then press  <kbd>Ctrl</kbd>+<kbd>O</kbd>  to save the changes.
	 > - Press  <kbd>Ctrl</kbd>+<kbd>X</kbd> to exit the editor.

#### Further Reading: 
- [Getting Started with Vim: An Interactive Guide](https://scotch.io/tutorials/getting-started-with-vim-an-interactive-guide)    

## Reading file content

### cat
- concatenate files and print on the standard output
	```bash
	$ cat sample.text
	```

### less
- displays contents of a file, automatically fits to size of Terminal, allows scrolling in either direction and other options for effective viewing
	```bash
	$ less sample.txt
	```
	
### head
- displays the first 10 lines of a text file by default
	```bash
	$ head sample.txt
	```
	
### tail
- head command displays the last 10 lines of a text file by default
	```bash
	$ tail sample.txt
	```

## Copying and moving files
- The `cp` command is used to copy files and directories
- To copy a single file or directory, specify the source as first argument and destination as second argument
- Similar to  `rm`  command, use  `-r`  for directories
	```bash
	$ # Two file names
	$ # cp src_file dest_file
	$ cp a.txt b.txt

	$ # One or more arguments
	$ # cp src_file1 src_file2 src_file3 dest_dir
	$ cp a.txt b.txt new_folder

	$ # Two directory names
	$ # cp -r src_dir dest_dir
	$ cp -r old_folder new_folder
	```

## Renaming files

### `mv` command
- `mv` command is used to rename or move files from one location to another.
	```bash
	$ # mv [OPTIONS] source destination
	$ mv file1.txt file2.txt
	```

### `rename` command
- `rename` command in Linux is used to rename the named files according to the regular expression _perlexpr_.
- It is not part of a standard Linux distribution, so you will need to install it.
	```bash
	$ # Install rename
	sudo apt-get install rename

	$ # Syntax
	$ # rename [OPTIONS] perlexpr files
	$ rename 's/.html/.php/' \*.html
	```
- The above example will change all files with the extension `.html` to `.php`


**Further Reading:**
- [Rename command](https://www.computerhope.com/unix/rename.htm)

## Deleting files & directories

- **This will permanently delete your files.** They will not be found in the 'Trash' folder.

- To delete files
	```bash
	$ rm samplefile.txt
	```
- To delete directories, use -r option
	```bash
	$ rm -r sampledir
	```
- To delete empty directories
	```bash
	$ rmdir sampledir
	```

## Chaining commands

You can chain multiple commands using `&`, `&&`, `|`, `||` and `;` operators.

### & Operator
```bash
$ command1 &
```
- This will run command_1 in the background so that other commands can be executed.

### && Operator
```bash
$ command1 && command2
```
- This will run will run command_1 and then run command_2 only if command_1 finished successfully.

### | Operator
```bash
$ command1 | command2
```
- The output of the command1 acts as input to command2.

### || Operator
```bash
$ command1 || command2
```
- This will run will run command_1 and then run command_2 only if command_1 **did not** finish successfully.

### ; Operator
```bash
$ command1 ; command2
```
- This will run will run command_1 and then run command_2 even if command_1 did not finish successfully.
