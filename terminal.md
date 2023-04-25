# Unix/Linux Terminal

**Table of Contents**

-   [Opening the Terminal](#opening-the-terminal)
-   [Keyboard Shortcuts](#keyboard-shortcuts)
-   [File System](#file-system)
-   [Basics of Linux/Unix Commands](#basics-of-linuxunix-commands)
-   [Basic Commands](#basic-commands)
-   [Package Manager](#package-manager)
-   [Run files on cmd](#run-files-on-cmd)
-   [Listing directory contents & directory structure](#listing-directory-contents--directory-structure)
-   [Changing Permissions](#changing-permissions)
-   [Creating Directories](#creating-directories)
-   [Creating Files](#creating-files)
-   [Redirecting Output](#redirecting-output)
-   [Editing a File](#editing-a-file)
-   [Reading File Content](#reading-file-content)
-   [Copying and Moving Files](#copying-and-moving-files)
-   [Renaming Files](#renaming-files)
-   [Deleting Files and Directories](#deleting-files--directories)
-   [Chaining Commands](#chaining-commands)
-   [Finding Strings and Counting Occurences](#finding-strings-and-counting-occurences)
-   [AWK](#awk)

## Opening the Terminal

### Linux

Search for "terminal" in the apps menu in most cases. You might have to look up specific instructions for your distro.
Default Keyboard shortcut: <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>

### MacOS

Search for "terminal" in Spotlight.
Keyboard shortcut: <kbd>Control</kbd> + <kbd>Option</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd>

### Windows

The in-built terminals on Windows (cmd and PowerShell) are not POSIX compliant, so you will need to do one of the following:

-   Install a POSIX-compatible runtime like MinGW or Cygwin.  
    Note that `git-for-windows` includes a MinGW installation called `git-bash` by default, and is usually located in `C:\Program Files\Git\git-bash.exe`
-   Enable the Windows Subsystem for Linux (WSL).
    WSL is a system developed by Microsoft that allows a full Linux OS to run alongside Windows.
    <br>
    [Learn More about WSL](https://docs.microsoft.com/en-us/windows/wsl/) | [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
-   Use Docker containers.
    Docker allows programs to run in isolated environments called containers.
    Each container is like a fresh install of the respective OS. There are pre-built containers for many popular Linux distros like Ubuntu, Debian, CentOS, etc.
    <br>
    [Get started with Docker](https://www.docker.com/get-started)

## Keyboard shortcuts

| Shortcut                                                | Function                                                                           |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| <kbd>Tab</kbd>                                          | Complete file & directory names and to further iterate over files                  |
| <kbd>Shift</kbd> + <kbd>Tab</kbd>                       | Go back to the previous names                                                      |
| <kbd>&#8593;</kbd> or <kbd>Ctrl</kbd> + <kbd>P</kbd>    | Go to all the commands previously executed in that instance of the cmd, one by one |
| <kbd>&#8595;</kbd> or <kbd>Ctrl</kbd> + <kbd>N</kbd>    | Go towards the recent commands                                                     |
| <kbd>Ctrl</kbd> + <kbd>R</kbd>                          | Search your command history                                                        |
| <kbd>Ctrl</kbd> + <kbd>&#8592;</kbd>/<kbd>&#8594;</kbd> | Jump words                                                                         |
| <kbd>Home</kbd> or <kbd>Ctrl</kbd>                      | Jump to the beginning and end of the line                                          |
| <kbd>End</kbd> or <kbd>Ctrl</kbd> + <kbd>E</kbd>        | Jump to the end of the line                                                        |
| <kbd>Ctrl</kbd> + <kbd>C</kbd>                          | Stop running processes in your terminal and bring back the prompt                  |

## File System

Let's get a brief on the Linux file system. If you've used Windows, you would be familiar with `C:`, `D:` etc.  
In Linux, directory structure starts with `/` symbol, which is referred as the `root` directory
The `~`(tilde) is shorthand for your `home` directory. Within your home directory, you will find common directories, such as Documents, Music, Video, etc.,

<p align="center"><img src="https://www.informit.com/content/images/chap04_9780133017601/elementLinks/thfig04-09.jpg" style="max-width:40%"></p>

> [A Gist on the file system](https://gist.github.com/HarshKapadia2/18150e1e57eab1f0e500f18feea890aa) folders and their general functions.

### Absolute and Relative Paths

An **absolute or full path** points to the same location in a file system regardless of the current working directory. To do that, it must start from the root directory.

An absolute path always starts with a forward slash (`/`), which represents the start of the filesystem.

> Eg: `/home/username` is an absolute path.

By contrast, a **relative path** starts from some given working directory, avoiding the need to provide the full absolute path. A filename can be considered as a relative path based at the current working directory. If the working directory is not the file's parent directory, a file not found error will result if the file is addressed by its name.

A relative path never starts with a forward slash (`/`).

A relative path can start with a

-   `.`
    -   Represents the CWD (Current Working Directory).
-   `..`
    -   Represents the parent directory of the CWD.
-   `~`
    -   Represents the home directory of the logged in user.

> Eg: `../docs` is a relative path

## Basics of Linux/Unix Commands

### Command Structure

The components of the command line are:

-   the command
-   any options required by the command
-   the command's arguments (if required)

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

-   `man <command>` is used to display the user manual of any command that we can run on the terminal. It provides a detailed view of the command. eg: `man ls`.
-   `help` command provides documentation for builtin commands.

```bash
$ help pwd
pwd: pwd [-LP]
  Print the name of the current working directory.

  Options:
    -L  print the value of $PWD if it names the current working directory
    -P  print the physical directory, without any symbolic links

  By default, `pwd' behaves as if `-L' were specified.

  Exit Status:
  Returns 0 unless an invalid option is given or the current directory
  cannot be read.
```

### Variables

Syntax: `${var_name}` or `$var_name`

Pre-defined variables: `$HOME`, etc...

Custom variables:

```bash
$ foo=bar
$ echo ${foo}
bar
```

NOTE: Strings in bash can be defined with `'` and `"` delimiters, but they are not equivalent. Strings delimited with `'` are literal strings and will not substitute variable values whereas `"` delimited strings will.

```bash
$ name=selena

$ echo 'Hey ${name}!'
Hey ${name}!

$ echo "Hey ${name}!"
Hey Selena!
```

## Basic Commands

### Print name of cwd (current working directory)

Use `pwd` to print name of current/working directory

```bash
$ pwd
/home/username
```

### Clear screen & command history

-   Use `clear` or <kbd>Ctrl</kbd> + <kbd>L</kbd> to clear the screen of the cmd.
-   Use `history` to view the last 500 commands executed on the terminal.

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

-   Relative paths are well, relative to current working directory
-   `.` refers to current directory
-   `..` refers to directory one hierarchy above
-   `../..` refers to directory two hierarchies above and so on

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

> NOTE:
>
> -   [About the Use of Dot-Slash (`./`) in Commands](http://www.linfo.org/dot_slash.html)
> -   [Absolute vs Relative Path in Linux: What's the Difference?](https://linuxhandbook.com/absolute-vs-relative-path)

-   `cd ~/` or `cd ~` or `cd` will go to directory specified by `HOME` shell variable (which is usually set to user's home directory)

    ```bash
    $ pwd
    /
    $ echo "$HOME"
    /home/username

    $ cd
    $ pwd
    /home/username
    ```

-   _Note:_ Specifying `/` at end of path argument is optional

## Package manager

-   A package delivers and maintains new software for Linux-based computers. Just as Windows-based computers rely on executable installers, the Linux ecosystem depends on packages that are administered through software repositories.
-   Different Linux distros use different package managers. Ubuntu uses APT (Advanced Package Tool) to manage its packages.

### Check for package updates

```bash
$ # To check if any packages on the system have updates
$ sudo apt-get update

$ # To update all packages
$ sudo apt-get upgrade
```

NOTE: Always run the update command before the upgrade command.

### Install a package

```bash
$ sudo apt-get install <package_name>
$ # This might prompt you with a Y (yes) or n (no) option.
```

### Remove a package

```bash
$ sudo apt-get remove <package_name>
$ # This might prompt you with a Y (yes) or n (no) option.
```

## Run files on cmd

-   You can only run files if you have the permission to execute them. Refer [Changing permissions section](#changing-permissions) for more details.

```bash
$ ./file_to_run
```

## Listing directory contents & directory structure

-   `ls` to list all files and directories in the cwd (current working directory).

    ```bash
    $ ls
    projects  report.log
    ```

-   `ls path` to view files in another directory without changing the cwd. The path can be absolute/relative.

    ```bash
    $ ls /var/
    backups  lib  lock  mail
    ```

-   Use the `-a` option to list all the files, including the hidden files and folders, in the cwd (current working directory).

    ```bash
    $ ls
    CODE_OF_CONDUCT.md  CONTRIBUTING.md  LICENSE  README.md  build  build.sh  src  temp.md

    $ ls -a
    .  ..  .git  .github  .gitignore  CODE_OF_CONDUCT.md  CONTRIBUTING.md  LICENSE  README.md  build  build.sh  src  temp.md
    ```

-   Use the `-A` option to print the same things as the `-a` option, but without printing `.` and `..`.

    ```bash
    $ ls -a
    .  ..  .git  .github  .gitignore  CODE_OF_CONDUCT.md  CONTRIBUTING.md  LICENSE  README.md  build  build.sh  src  temp.md

    $ ls -A
    .git  .github  .gitignore  CODE_OF_CONDUCT.md  CONTRIBUTING.md  LICENSE  README.md  build  build.sh  src  temp.md
    ```

-   Use the `-l` option for the long listing format. This format shows details like file permissions, ownership, size, timestamp, etc. (See [changing permissions](#changing-permissions) section for details on permissions, groups, etc)

    ```bash
    $ ls -l
    total 52
    -rwxrwxrwx 1 harshkapadia harshkapadia  3431 Apr 21 23:09 CODE_OF_CONDUCT.md
    -rwxrwxrwx 1 harshkapadia harshkapadia 20566 Apr 21 23:09 LICENSE
    -rwxrwxrwx 1 harshkapadia harshkapadia  1253 Apr 21 23:09 README.md
    drwxrwxrwx 1 harshkapadia harshkapadia  4096 Apr 22 00:48 build
    ...
    ```

-   `tree` to view directory structure.

-   It is not part of a standard Linux distribution, so you will need to install it.

    ```bash
    $ # Install tree
    $ sudo apt install tree

    $ sudo tree
    .
    ├── projects
    │  ├── a.txt
    │  ├── b.txt
    │  └── backup
    │    ├── a.txt
    │    └── b.txt
    └── report.log
    2 directories, 5 files
    ```

    -   Use `which` to find the location of a file.

    ```bash
    $ which bash
    /usr/bin/bash
    ```

## Changing Permissions

-   In the output of `ls -l` command, the first 10 characters displayed are related to type of file and its permissions.
    ```bash
    $ ls -l
    total 84
    lrwxrwxrwx 1 username eg  12 Mar 21 12:08 projects -> ../projects/
    -rw-rw-r-- 1 username eg 39120 Feb 14  2019 report.log
    ```

First character indicates the **file type** The most common are

-   `-` regular file
-   `d` directory
-   `l` symbolic link
-   for complete list, see `-l` option in `info ls`

The other 9 characters represent three sets of **file permissions** for 'user', 'group' and 'others' - in that order

-   `user` file properties for owner of file G - `u`
-   `group` file properties for the group the file belongs to - `g`
-   `others` file properties for everyone else - `o`

    **Permission characters and values**

| Character | Meaning       | Value | File                         | Directory                         |
| --------- | ------------- | ----- | ---------------------------- | --------------------------------- |
| r         | read          | 4     | file can be read             | can see contents of directory     |
| w         | write         | 2     | file can be modified         | can add/remove files in directory |
| x         | execute       | 1     | file can be run as a program | can access contents of directory  |
| -         | no permission | 0     | permission is disabled       | permission is disabled            |

```bash
$ chmod 664 sample.txt
```

This means it will change the permission of sample.txt to rw-rw-r-- i.e, `user` and `group` only have read and write permissions and `others` only have read permission.

#### Further Reading:

-   [File Permissions](https://www.mkssoftware.com/docs/man1/ls.1.asp#Long_Output_Format)

## Creating directories

-   `mkdir dir_name` will create a folder in the cwd, if the `dir_name` doesn't already exist in the cwd.
-   Use `""` if the `dir_name` has spaces, eg: `mkdir "dir name"`.
-   Multiple folders can be created using `mkdir {dir1,dir2,dir3}`.
    -   **Do not add any spaces** in the curly brackets for the directory names.
-   Use the flag `-p` to create intermediate directories if they do not exist and not cause an error if they already exist.

```bash
# mkdir [option] dir_name
$ mkdir new_dir

# Spaces in directory name
$ mkdir "New Folder"

# Creating multiple directories
$ mkdir {dir1,dir2,dir3}

# Creating intermediate directories without causing errors if they already exist
$ mkdir -p public/css/summary public/html
```

## Creating files

### `touch` command

-   This is the easiest way to create a file in Linux.
    ```bash
    $ touch sample.txt
    ```

### Redirect operator (>)

-   This operator tells the system to output results into whatever you specify next. The target is usually a filename. You can use this symbol by itself to create a new file.
    ```bash
    $ > sample.txt
    ```

### `cat` command

-   The `cat` command is short for **concatenate**. It can be used to output the contents of several files, one file, or even part of a file. If the file doesn’t exist, the `cat` command will create it.
    ```bash
    $ cat > sample.txt
    ```

### `echo` command

-   The `echo` command will print out anything written after it.

    ```bash
    $ echo Print this text
    Print this text
    ```

-   It will print out environment variables like `$HOME`, `$USER`, `$SHELL`, `$HOSTNAME`, etc as well.

    ```bash
    $ echo $SHELL
    /bin/bash
    ```

-   It can be used to add text to a file using the [output redirection operator](#redirect-operator-). (It overwrites the contents of the entire file.)

    ```bash
    $ cat sample.txt
    Original text

    $ echo New text! > sample.txt

    $ cat sample.txt
    New text!
    ```

-   It can be used to append text to a file using the [output redirection operator](#redirect-operator-).

    ```bash
    $ cat sample.txt
    Original text

    $ echo New text! >> sample.txt

    $ cat sample.txt
    Original text
    New text!
    ```

### Using text editors

-   Vi Text Editor
    ```bash
    $ vi sample.txt
    ```
-   Vim Text Editor
    ```bash
    $ vim sample.txt
    ```
-   Nano Text Editor
    ```bash
    $ nano sample.txt
    ```
    Jump to [Editing Files](#edit-files) for more details.

## Redirecting output

### Redirect to a file

-   To redirect the output of a command to a file, use the `>` symbol.

Eg: `ls -al > listings.txt` will save the output of command ls -al is re-directed to `listings.txt` instead of your screen.

Note that if `listings.txt` already had some data, then this will **overwrite** the old data.

-   To append to an existing file, use the `>>` symbol.

Eg: `ls -al >> listings.txt` will append the output of command ls -al is re-directed to `listings.txt`.

### Redirect to another command

-   Sometimes, it can be useful to use the output of one command as the input to another command. This can be achieved using **pipes**.

-   A pipe is created using the pip character (`|`).

-   Eg: To display output of a directory listing one page at a time, use `ls -la | less`.

## Editing a file

### Vi Text Editor

-   **Vi** is the oldest text editor in Linux. It was created alongside the Linux operating system for directly editing text files.
    ```bash
    $ vi sample.txt
    ```
    > This will start the text editor in your terminal.
    >
    > -   Press the letter `i` to switch to insert mode, then type a few words to try it out.
    > -   To save and exit press `Esc :x` and hit `Enter`.

### Vim Text Editor

-   **Vi** editor wasn’t very user-friendly. **Vim** is a newer version, which stands for **Vi editor, Modified**.
    ```bash
    $ vim sample.txt
    ```
    > This screen will look similar to the **Vi** editor screen.
    >
    > -   Press **`i`** to insert text, and type a few words.
    > -   Save the file and exit by entering: <kbd>Esc</kbd> + `:wq` + <kbd>Enter</kbd>

### Nano Text Editor

-   **Nano** is a newer and much easier text editor to navigate.
    ```bash
    $ nano sample.txt
    ```
    > By default, Nano puts you directly into editing mode. It also displays a helpful list of commands at the bottom of the screen.
    >
    > -   Enter some text, then press <kbd>Ctrl</kbd>+<kbd>O</kbd> to save the changes.
    > -   Press <kbd>Ctrl</kbd>+<kbd>X</kbd> to exit the editor.

#### Further Reading:

-   [Getting Started with Vim: An Interactive Guide](https://scotch.io/tutorials/getting-started-with-vim-an-interactive-guide)

## Reading file content

### cat

-   concatenate files and print on the standard output
    ```bash
    $ cat sample.text
    ```

### less

-   displays contents of a file, automatically fits to size of Terminal, allows scrolling in either direction and other options for effective viewing
    ```bash
    $ less sample.txt
    ```

### head

-   displays the first 10 lines of a text file by default
    ```bash
    $ head sample.txt
    ```

### tail

-   head command displays the last 10 lines of a text file by default
    ```bash
    $ tail sample.txt
    ```

## Copying and moving files

-   The `cp` command is used to copy files and directories
-   To copy a single file or directory, specify the source as first argument and destination as second argument
-   Similar to `rm` command, use `-r` for directories

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

-   The Secure Copy (`scp`) command can be used to transfer files from one machine to another. (It uses [SSH](https://networking.harshkapadia.me/ssh) under the hood.)

    ```bash
    $ scp file_to_be_transferred.txt remote_username@0.0.0.0:/remote/directory/new_file_name.txt
    ```

> [More details](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files)

## Renaming files

### `mv` command

-   `mv` command is used to rename or move files from one location to another.
    ```bash
    $ # mv [OPTIONS] source destination
    $ mv file1.txt file2.txt
    ```

### `rename` command

-   `rename` command in Linux is used to rename the named files according to the regular expression _perlexpr_.
-   It is not part of a standard Linux distribution, so you will need to install it.

    ```bash
    $ # Install rename
    sudo apt-get install rename

    $ # Syntax
    $ # rename [OPTIONS] perlexpr files
    $ rename 's/.html/.php/' \*.html
    ```

-   The above example will change all files with the extension `.html` to `.php`

#### Further Reading:

-   [Rename command](https://www.computerhope.com/unix/rename.htm)

## Deleting files & directories

-   **This will permanently delete your files.** They will not be found in the 'Trash' folder.

-   To delete files
    ```bash
    $ rm samplefile.txt
    ```
-   To delete directories, use -r option
    ```bash
    $ rm -r sampledir
    ```
-   To delete empty directories
    ```bash
    $ rmdir sampledir
    ```

## Chaining commands

You can chain multiple commands using `&`, `&&`, `|`, `||` and `;` operators.

### & Operator

```bash
$ command1 &
```

-   This will run command_1 in the background so that other commands can be executed.

### && Operator

```bash
$ command1 && command2
```

-   This will run will run command_1 and then run command_2 only if command_1 finished successfully.

### | Operator

```bash
$ command1 | command2
```

-   The output of the command1 acts as input to command2.

### || Operator

```bash
$ command1 || command2
```

-   This will run will run command_1 and then run command_2 only if command_1 **did not** finish successfully.

### ; Operator

```bash
$ command1 ; command2
```

-   This will run will run command_1 and then run command_2 even if command_1 did not finish successfully.

## Finding Strings and Counting Occurences

### `grep`

-   [Origin of `grep`](https://www.youtube.com/watch?v=NTfOnGZUZDk)

-   To find the occurence of a string, use `grep "<string>" file_name.ext`

    ```bash
    $ grep "current" bank.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    ```

-   To count the occurence(s) of a string, use `grep -c "<string>" file_name.ext`
    ```bash
    $ grep -c "current" bank.lst
    2
    ```
-   To find the occurence(s) of a string with the line number, use `grep -n "<string>" file_name.ext`

    ```bash
    $ grep -n "current" bank.lst
    1:101 Aditya 0 14/11/2000 current
                              ^^^^^^^
    3:103 Naman0 20/08/2009 current
                            ^^^^^^^
    ```

-   To find the occurence(s) of a line without the string, use `grep -v "<string>" file_name.ext`

    ```bash
    $ grep -v "current" bank.lst
    108 Chirag 0 15/12/2012 Current
    109 Arya 16000 14/12/2010 Current
    110 Priya 130 16/11/2009 Saving
    ```

-   To find files with the occurence of a string, use `grep -l "<string>" *.ext`

    ```bash
    $ grep -l "current" *.lst
    bank.lst
    customers.lst
    ```

-   To find files without the occurence of a string, use `grep -L "<string>" *.ext`

    ```bash
    $ grep -L "current" *.java
    bnk.java
    cust.java
    ```

-   To find lines from different files with a string (including the file names), use `grep -H "<string>" *.ext`

    ```bash
    $ grep -H "current" *.lst
    bank.lst:101 Aditya 0 14/11/2000 current
                                     ^^^^^^^
    bank.lst:103 Naman0 20/08/2009 current
                                   ^^^^^^^
    clist.lst:101 Aditya 0 14/11/2000 current
                                      ^^^^^^^
    clist.lst:103 Naman0 20/08/2009 current
                                    ^^^^^^^
    newbank.lst:101 Aditya 0 14/11/2000 current
                                        ^^^^^^^
    newbank.lst:103 Naman0 20/08/2009 current
                                      ^^^^^^^
    ```

    -   To find lines from different files with a string (without including the file names), use `grep -h "<string>" *.ext`

    ```bash
    $ grep -h "current" *.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    ```

-   To find the occurence of a string while ignoring the case, use `grep -i "<string>" file_name.ext`

    ```bash
    $ grep -i "current" bank.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    106 Mukesh 14000 20/12/2009 Current
                                ^^^^^^^
    108 Chirag 0 15/12/2012 Current
                            ^^^^^^^
    ```

-   To find the occurence of strings, use `grep -e "<string_1>" -e "<string_2>" -e "<string_3>"... file_name.ext` (Can be used to ignore case as well, by entering all the allowed strings.)

    ```bash
    $ grep -e "current" -e "Mu" bank.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    106 Mukesh 14000 20/12/2009 Current
        ^^
    ```

-   To find all lines with a string ignoring the case of a few characters, use:

    ```bash
    $ grep "[Cc]urrent" bank.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    106 Mukesh 14000 20/12/2009 Current
                                ^^^^^^^
    108 Chirag 0 15/12/2012 Current
                            ^^^^^^^
    109 Arya 16000 14/12/2010 Current
                              ^^^^^^^
    ```

-   To find a number of lines before and after a string, use `grep -<number> "<string>" file_name.ext`

    ```bash
    $ grep -1 "current" bank.lst
    101 Aditya 0 14/11/2000 current # The line above this is not printed as this is itself the first line in the file
                            ^^^^^^^
    102 Anil 10000 20/05/2011 saving
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    104 Ram 10000 15/08/2010 saving
    ```

-   To find all lines starting with a string, use `grep "^<string>" file_name.ext`

    ```bash
    $ grep "^11" bank.lst
    110 Priya 130 16/11/2009 Saving
    ^^
    ```

-   To find all lines starting within a string range, use `grep "^[<string>-<string>]" file_name.ext`

    ```bash
    $ grep "^[1-2]" bank.lst
    101 Aditya 0 14/11/2000 current
    ^
    ...

    110 Priya 130 16/11/2009 Saving
    ^
    201 Bina 3000 11/03/2010 saving
    ^
    202 Diya 4000 13/04/2018 saving
    ^
    203 Gargi 2000 21/01/2015 saving
    ^
    ```

-   To find all lines not starting with a string, use `grep ^[^<string>] <file_name.ext>` (The outer `^` is negating the pattern.)

    ```bash
    $ grep "^[^1]" bank.lst
    201 Bina 3000 11/03/2010 saving
    ^
    202 Diya 4000 13/04/2018 saving
    ^
    203 Gargi 2000 21/01/2015 saving
    ^
    ```

-   To find all lines not starting with a string in a range of characters, use `grep ^[^<string>-<string>] <file_name.ext>` (The outer `^` is negating the pattern.)

    ```bash
    $ grep "^[^0-1]" bank.lst
    201 Bina 3000 11/03/2010 saving
    ^
    202 Diya 4000 13/04/2018 saving
    ^
    203 Gargi 2000 21/01/2015 saving
    ^
    ```

-   To find all lines ending with a string, use `grep "<string>$" file_name.ext`

    ```bash
    $ grep "nt$" bank.lst
    101 Aditya 0 14/11/2000 current
                                 ^^
    103 Naman0 20/08/2009 current
                               ^^
    106 Mukesh 14000 20/12/2009 Current
                                     ^^
    108 Chirag 0 15/12/2012 Current
                                 ^^
    109 Arya 16000 14/12/2010 Current
                                   ^^
    ```

-   To find all lines starting or ending with a string **anywhere in the line** and having a fixed number of characters after or before it respectively, use `grep "...<string>" file_name.ext` or `grep "<string>..." file_name.ext` (Every `.` indicates one character.)

    ```bash
    $ grep "......nt" bank.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    106 Mukesh 14000 20/12/2009 Current
                                ^^^^^^^
    108 Chirag 0 15/12/2012 Current
                            ^^^^^^^
    109 Arya 16000 14/12/2010 Current
                              ^^^^^^^
    ```

-   To find all lines starting and ending with a string and having a fixed number of characters in between, use `grep "<string>...<string>" file_name.ext` (Every `.` indicates one character.)

    ```bash
    $ grep "Cur..nt" bank.lst
    106 Mukesh 14000 20/12/2009 Current
                                ^^^^^^^
    108 Chirag 0 15/12/2012 Current
                            ^^^^^^^
    109 Arya 16000 14/12/2010 Current
                              ^^^^^^^
    ```

-   To find all lines starting and ending with a string and having any number of characters in between, use `grep "<string>.*<string>" file_name.ext`

    ```bash
    $ grep "C.*nt" bank.lst
    106 Mukesh 14000 20/12/2009 Current
                                ^^^^^^^
    108 Chirag 0 15/12/2012 Current
                            ^^^^^^^
    109 Arya 16000 14/12/2010 Current
                              ^^^^^^^
    ```

-   To find lines with strings stored in a file, use `grep -f <pattern_file.ext> <target_file.ext>`

    ```bash
    $ cat pattern.txt
    current
    Saving
    ^d

    $ grep -f pattern.txt bank.lst
    101 Aditya 0 14/11/2000 current
                            ^^^^^^^
    103 Naman0 20/08/2009 current
                          ^^^^^^^
    110 Priya 130 16/11/2009 Saving
                             ^^^^^^
    ```

## AWK

-   AWK is a programming language executed by the AWK interpreter.
-   The AWK language is a data-driven scripting language consisting of a set of actions to be taken against streams of textual data – either run directly on files or used as part of a pipeline – for purposes of extracting or transforming text, such as producing formatted reports.
-   It designed for text processing and typically used as a data extraction and reporting tool.
-   Like `sed` and [`grep`](#grep), it is a filter, and is a standard feature of most Unix-like operating systems.
-   It is named after the three people who developed it, namely Alfred Aho, Peter Weinberger and Brian Kernighan.
-   General syntax for the AWK command: `awk option '/pattern/ {action}' <file_name.ext>`

    -   An AWK command must have a pattern, an action or both.
    -   Specifying an option is optional.
    -   If a pattern is not specified, it will be entire line.
    -   If an action is not specified, by default it is print.

-   Print all records of file

    ```awk
    $ awk '{print}' bank.lst
    101 Aditya 0 14/11/2000 current
    102 Anil 10000 20/05/2011 saving
    ...
    110 Priya 130 16/11/2009 Saving
    201 Bina 3000 11/03/2010 saving
    202 Diya 4000 13/04/2018 saving
    203 Gargi 2000 21/01/2015 saving
    ```

-   Print first 3 fields (Fields indicated by: `$<field_no>`)

    ```awk
    $ awk '{print $1 $2 $3}' bank.lst
    101Aditya0
    102Anil10000
    ...
    110Priya130
    201Bina3000
    202Diya4000
    203Gargi2000
    ```

-   Sepearate fields by tabs.

    ```awk
    $ awk '{print $1 "\t" $2 "\t" $3}' bank.lst
    101     Aditya  0
    102     Anil    10000
    ...
    110     Priya   130
    201     Bina    3000
    202     Diya    4000
    203     Gargi   2000
    ```

-   Format specifiers

    ```awk
    $ awk '{printf "%3d \t %7s \t %5d\n", $1, $2, $3}' bank.lst
    101       Aditya             0
    102         Anil         10000
    ...
    110        Priya           130
    201         Bina          3000
    202         Diya          4000
    203        Gargi          2000
    ```

-   Print only those records having a pattern.

    ```awk
    $ awk '/current/ {print}' bank.lst
    101 Aditya 0 14/11/2000 current
    103 Naman 0 20/08/2009 current

    # OR

    $ awk '/current/ {print $0}' bank.lst  # '$0' means the entire line
    101 Aditya 0 14/11/2000 current
    103 Naman 0 20/08/2009 current
    ```

-   Print records based on mathematical conditions

    ```awk
    $ awk '$3 < 5000 {print $1 "\t" $2 "\t" $3}' bank.lst
    101     Aditya  0
    103     Naman   0
    108     Chirag  0
    110     Priya   130
    201     Bina    3000
    202     Diya    4000
    203     Gargi   2000

    $ awk '$3 > 3000 && $3 < 8000 {print $1 "\t" $2 "\t" $3}' bank.lst  # '||' is logical OR
    105     Jyotsna 5000
    202     Diya    4000
    ```

-   Print records if a field matches a certain string/pattern or not.

    ```awk
    $ awk '$5 == "current"' bank.lst  # OR awk '$5 ~/current/' bank.lst
    101 Aditya 0 14/11/2000 current
    103 Naman 0 20/08/2009 current

    $ awk '$5 != "current"' bank.lst  # OR awk '$5 !~/current/' bank.lst
    102 Anil 10000 20/05/2011 saving
    104 Ram 10000 15/08/2010 saving
    ...
    110 Priya 130 16/11/2009 Saving
    201 Bina 3000 11/03/2010 saving
    202 Diya 4000 13/04/2018 saving
    203 Gargi 2000 21/01/2015 saving
    ```

-   Print records with a field ending or not ending with a string/pattern.

    ```awk
    $ awk '$5 ~/nt$/' bank.lst
    101 Aditya 0 14/11/2000 current
    103 Naman 0 20/08/2009 current
    106 Mukesh 14000 20/12/2009 Current
    108 Chirag 0 15/12/2012 Current
    109 Arya 16000 14/12/2010 Current

    $ awk '$5 !~/nt$/' bank.lst
    102 Anil 10000 20/05/2011 saving
    104 Ram 10000 15/08/2010 saving
    105 Jyotsna 5000 16/06/2012 saving
    107 Vishal 14500 30/11/2011 saving
    110 Priya 130 16/11/2009 Saving
    201 Bina 3000 11/03/2010 saving
    202 Diya 4000 13/04/2018 saving
    203 Gargi 2000 21/01/2015 saving
    ```

-   Print records with a field value, while ignoring the case.

    ```awk
    $ awk '$5 ~/[Cc]urrent/' bank.lst
    101 Aditya 0 14/11/2000 current
    103 Naman 0 20/08/2009 current
    106 Mukesh 14000 20/12/2009 Current
    108 Chirag 0 15/12/2012 Current
    109 Arya 16000 14/12/2010 Current
    ```

-   Built-in AWK variables

    -   https://www.thegeekstuff.com/2010/01/8-powerful-awk-built-in-variables-fs-ofs-rs-ors-nr-nf-filename-fnr/
    -   https://www.linuxnix.com/awk-scripting-learn-awk-built-in-variables-with-examples/

-   Print record numbers 4 to 6.

    ```awk
    $ awk 'NR > 3 && NR < 7 {print $1 "\t" $2}' bank.lst
    104     Ram
    105     Jyotsna
    106     Mukesh

    $ awk 'NR == 4, NR == 6 {print $1 "\t" $2}' bank.lst
    104     Ram
    105     Jyotsna
    106     Mukesh
    ```
