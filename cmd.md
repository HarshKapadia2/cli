# Windows Command Prompt (cmd)

- Source
   - [thenewboston on YouTube](https://www.youtube.com/watch?v=MBBWVgE0ewk&list=PL6gx4Cwl9DGDV6SnbINlVUd0o2xT4JbMu&index=1)
   - My knowledge
- **Shorthands**
   - cmd = Windows Command Prompt
   - cwd = current working directory

## Open cmd

- Press <kbd>Win</kbd> + <kbd>R</kbd>.
- Type in `cmd` and press enter!

OR

- Search for `cmd` in the start menu.
- Press <kbd>Enter</kbd> for a standard command prompt and <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Enter</kbd> for an Administrator command prompt.

OR

- Press <kbd>Win</kbd> + <kbd>X</kbd>.
- Then, press <kbd>C</kbd> for a standard command prompt and <kbd>A</kbd> for an Administrator command prompt.

## Current working directory (cwd)

- The location in the file system to which the cmd is currently pointing to.
- Eg: `C:\Users\user_name>`
- The `cd` command without any arguments will print the current directory.
- The full path to the current directory is stored in the `%cd%` variable.

## Keyboard shortcuts

- Use <kbd>Tab</kbd> to complete file & directory names and to further iterate over files. This can be done after partially typing out the name as well. Use <kbd>Shift</kbd> + <kbd>Tab</kbd> to go back to the previous names.
- Pressing the <kbd>&#8593;</kbd> gives you all the commands previously executed in that instance of the cmd, one by one. The <kbd>&#8595;</kbd> can be used to go towards the recent commands.
- Use <kbd>Ctrl</kbd> + <kbd>&#8592;</kbd>/<kbd>&#8594;</kbd> to jump words.
- Use <kbd>Home</kbd> and <kbd>End</kbd> keys to jump to the beginning and end of the line respectively.

## Help for any command

- `<command> /?` brings up a brief overview of what the command does and the options/flags that can be used with it, eg: `dir /?`.

## Clear screen & command history

- Use `cls` to clear the screen of the cmd.

## Stop running processes

- <kbd>Ctrl</kbd> + <kbd>C</kbd> will stop running processes (like Node.js servers, etc) in your terminal and bring back the prompt (the cwd text on the command line).

## Changing directories

- `cd <dir_name_or_relative/path/to/dir>` to change directory.
- To go up by one level (ie, to the parent directory), use `cd ..`.
- `cd ..\..` to go up 2 directories at one time.
- Use tab to auto-complete file and folder names.
- `cd \` to go to root dir.
- To change to a different drive `drive_name:`, eg: `C:`.
- Using absolute path:
   - `cd drive_name:\dir_1\dir_2`
   - Works only in the same drive. Switch to the particular drive to use the absolute path.
   
## Run files on cmd

- Go the the directory and type `file_name.ext`.
- cmd uses the default program for that file type to open the file.

## Path variable

- Type `path` to view the contents of the system and user path variables.
- It stores the (absolute) path (ie, directory) to certain executable files/programs.
- This helps in executing programs without going to the directory in which the executable file of the program exists.
- When a program name is typed, the cwd is checked for the executable and if it is not found, the path variable dirs are checked. If not found, an error `'program_name' is not recognized as an internal or external command, operable program or batch file.` is thrown.
- As the path variable has absolute paths, the executable name can be typed at any location that the cwd points to.
- Use `set path="%path%;absolute/path/to/exe_dir"` to set path temporarily for an instance of the cmd.  
  Note the `%path%`, because omitting it will overwrite the `path`. Overwriting the `path` with `set path="path/to/file"` is usually a bad idea, as you will be unable to use most standard commands like `more`.
- GUI: Search for `env` in the start menu and click on the `environment variables` button to view and edit all environment variables.

## Listing files, directories, drives and directory structure

- `dir` to list all files and directories in the cwd (current working directory).
- `dir path\to\dir` to view files in another directory without changing the cwd. (Use `""` if command doesn't work.)
- `dir /a` to llist hidden dirs as well.
- `dir file_name.ext` lists only that file.
- To list all files of a certain extension `dir *.ext`.
- Listing all available drives `wmic logicaldisk get name`.
- `tree` to view directory structure. `tree /f` to view files as well as directories.

## Creating directories

- `md dir_name` will create a folder in the cwd, if the `dir_name` doesn't already exist in the cwd.
- Use `""` if the `dir_name` has spaces, eg: `md "dir name"`.
- Multiple folders can be created using `md dir_1 dir_2`.

## Deleting directories

- **This will permanently delete your files.** They will not be found in the 'Recycle Bin'.
- `rmdir dir_name` will delete the folder from the cwd, **if it is empty**.
- `rmdir /s dir_name` will delete the folder and it's contents from the cwd.
- Use `""` if the `dir_name` has spaces, eg: `rmdir "dir name"`.
- Multiple folders can be deleted using `rmdir dir_1 dir_2`.

## Creating files

- Use `type nul > file_name.ext` to create an empty file in the cwd.
- Use `echo "enter text here" > file_name.ext` to create a file with data in it.

OR

- Use `copy con file_name.ext` to create a file. It will wait for input. Enter the input and hit <kbd>Ctrl</kbd> + <kbd>Z</kbd> and then the <kbd>Enter</kbd> key when done with the input.

OR

- Use `echo. > file_name.ext` to create an empty file. Note that there is no space between `echo` and `.`.

## The `find` command

- The `find` command will look for a word/phrase in a file or folder.  
  Eg: `find "Hello" hello.txt` will print all the lines with the word `Hello` in the file `hello.txt`.
- By default, the text is case sensitive (`Hello` is different from `hello`). Use the `/i` flag to ignore case.  
  Eg: `find /i "Hello" hello.txt`.
- You can also tell it to search all the files in the current folder with `find "Hello" *`, or another folder with `find "Hello" text\*`.

## Redirecting output

### Redirect to a file
- To redirect the output of a command to a file, use the `>` symbol.
  Eg: `dir > files.txt` will save the output of the `dir` command to a file named `files.txt`.  
  Note that if `files.txt` already had some data, then this will **overwrite** the old data.
- To append to a file, use the `>>` symbol.
  Eg: `dir >> files.txt` will append the output the `dir` command to a file named `files.txt`.  
  You can check this by running the command twice, and then viewing the contents of the file with `more files.txt`.
- You can use this to create a file with some content with `echo "Hello, world" > hello.txt`.

### Redirect to another command
- Sometimes, it can be useful to use the output of one command as the input to another command. This can be achieved using **pipes**.
- A pipe is created using the pip character (`|`).
- Eg: To list all the `.txt` files in the current directory, use `dir | find ".txt"`.

## Editing a file

- Vim editor works in cmd. Note that Vim is **not** installed in Windows by default. You can [install Vim from here](https://www.vim.org/download.php).
- Run `vim file_name.ext` to start the editor in the cmd itself.
- Run `vimtutor` for an interactive tutorial on how to use Vim.
- Online documentation can be found [here](https://vimhelp.org/).
- Find Vim commands [here](https://cognitivewaves.wordpress.com/vi-editor/).

## Reading file content

- `type file_name.ext` prints out the contents of the file.
- `more file_name.ext` prints out the contents, but pauses after every page.

## Copying and moving files

NOTE: Use `""` for absolute paths.

- `xcopy file_name.ext/source_dir destination_dir` to copy the file/all the files in a folder (`source_dir`) to the `destination_dir`. This only copies the files in the `source_dir`, not the sub-dirs.
- To copy all files AND sub-dirs (except empty ones) of a folder (`source_dir`) to the `destination_dir`, use `xcopy source_dir destination_dir /s`.

OR 

- `copy file_to_be_copied.ext destination_dir_path` to copy the file to the `destination_dir`.
- `move file.ext/source_dir destination_dir` to move files or dirs.

## Renaming files

- `ren source_file.ext/source_dir destination_dir` to rename a file or a dir.

## Deleting a file

- `del file_name.txt` **permanently** deletes the file from the cwd.

## File attributes

- Attributes include 'archived', 'hidden', 'system', etc.
- `attrib /?` for overview.
- Go to directory and type `attrib` to view the attributes of the files in it.
- Adding attributes, eg: `attrib -h +r file_name.txt`.

## Background and text color

- `color bt` (b = background color, t = text color)
- For color legend, type `color /?`.
- Type `color` to reset all colors to default.

## Chaining commands

- You can chain multiple commands using `&`, `&&` and `||`.
- `command_1 & command_2` will run `command_1` and then run `command_2`.
- `command_1 && command_2` will run `command_1` and then run `command_2` only if `command_1 finished successfully.
- `command_1 && command_2` will run `command_1` and then run `command_2` only if `command_1 **did not** finish successfully.
- Running `echo ^G` (Typed as `echo `, then <kbd>Ctrl</kbd> + <kbd>G</kbd>) will cause a beep sound.
- A useful trick is to add `& echo ^G` after a command that you know will take a long time to complete. You can go do something else and this will alert you when the command finishes.