# Windows Command Prompt (cmd)

- **Shorthands**
   - cmd = Windows Command Prompt
   - cwd = current working directory
   - dir(s) = directory(ies), ie, folder(s)
   - var(s) = variable(s)
   - CRUD = Create, Rename, Update & Delete

## Open cmd

- `Win + R`
- Type in `cmd` and press enter!

OR

- Search for `cmd` in the start menu.

## Current working directory (cwd)

- The location in the laptop to which the cmd is currently pointing to.
- Eg: `C:\Users\user_name>`

## Keyboard shortcuts

- Use `tab` to complete file & directory names and to further iterate over files. This can be done after partially typing out the name as well. Use `shift + tab` to go back to the previous names.
- Pressing the `upper arrow key` gives you all the commands previously executed in that instance of the cmd, one by one. The `down arrow key` can be used to go towards the recent commands.
- Use `ctrl + left/right arrow` to jump words.
- Use `home` and `end` keys to jump to the beginning and end of the line respectively.

## Help for any command

- `command /?` brings up a brief overview of what the command does and the options/flags that can be used with it, eg: `dir /?`.

## Clear screen & command history

- Use `cls` to clear the screen of the cmd.
- Pressing the `upper arrow key` gives you all the commands previously executed in that instance of the cmd, one by one. The `down arrow key` can be used to go towards the recent commands.

## Stop running processes

- `ctrl + c` will stop running processes (like Node.js servers, etc) in your terminal and bring back the prompt (the cwd text on the command line).

## Changing directories

- `cd <dir_name_or_relative/path/to/dir>` to change directory (dir).
- To go back one directory (ie, to the parent dir), use `cd ..`.
- `cd ../..` to go back 2 dir at one time.
- Use tab to auto-complete dir names.
- `cd \` to go to root dir.
- To change to a different drive `drive_name:`, eg: `C:`.
- Using absolute path
   - `cd drive_name:/dir_1/dir_2`
   - Works only in the same drive. Switch to the particular drive to use the absolute path.
   
## Run files on cmd

- Go the the dir and type `file_name.ext`.
- cmd uses the default program for that file type to open the file.

## Path variable

- Type `path` to view the contents of the system and user path variables.
- It stores the (absolute) path (ie, directory) to certain executable files/programs.
- This helps in executing programs without going to the dir in which the executable file of the program exists.
- When a program name is typed, the cwd is checked for the executable and if it is not found, the path variable dirs are checked. If not found, an error `'program_name' is not recognized as an internal or external command, operable program or batch file.` is thrown.
- As the path var has absolute paths, the executable name can be typed at any location that the cwd points to.
- Use `set path="absolute/path/to/exe_dir"` to set path temporarily for an instance of the cmd.
- GUI: Search for `env` in the start menu and click on the `environment variables` button to CRUD path vars.

## Listing files, directories, drives and dir structure

- `dir` to list all files and directories in the cwd (current working directory).
- `dir path\to\dir` to view files in another dir without changing the cwd. (Use `""` if command doesn't work.)
- `dir /a` to llist hidden dirs as well.
- `dir file_name.ext` lists only that file.
- To list all files of a certain extension `dir *.ext`.
- Listing all available drives on laptop `wmic logicaldisk get name`.
- `tree` to view dir structure.
- `du -c` to list all dirs with their sub-dirs and the number of files in each (du = disk usage).

## Creating directories

- `mkdir dir_name` will create a folder in the cwd, if the `dir_name` doesn't already exist in the cwd.
- Use `""` if the `dir_name` has spaces, eg: `mkdir "dir name"`.
- Multiple folders can be created using `mkdir dir_1 dir_2`.

## Deleting directories

- **This will permanently delete your files.** They will not be found in the 'Recycle Bin'.
- `rmdir dir_name` will delete the folder from the cwd, **if it is empty**.
- `rmdir /s dir_name` will delete the folder and it's contents from the cwd.
- Use `""` if the `dir_name` has spaces, eg: `rmdir "dir name"`.
- Multiple folders can be deleted using `rmdir dir_1 dir_2`.

## Creating files

- Use `type nul > file_name.ext` to create an empty file in the cwd.
- Use `echo enter text here > file_name.ext` to create a file with data in it (data without spaces is accepted).

OR

- Use `copy con file_name.ext` to create a file. It will wait for input. Enter the input (`enter` key can be used to go to the next line) and hit `ctrl + z` and then the `enter` key when done with the input.

## Writing to a file

- If the same file is written to using a command like `echo enter text here > file_name.ext`, the original contents are overwritten.
- To append to a file, use `echo enter text to be appended here >> existing_file_name.ext` and the text will be appended on the next line of the file.
- To write a command's output to a file, use `command > file_name.ext`

## Editing a file

- Vim editor works in cmd.
- `vim file_name.ext` to start the editor in the cmd itself.
- Find Vim commands [here](https://cognitivewaves.wordpress.com/vi-editor/).

## Reading file content

- `type file_name.ext` or `cat file_name.ext` or `cat path/to/file/file_name.ext` prints out the contents of the file.

## Copying and moving files

NOTE: Use `""` for absolute paths.

- `xcopy file_name.ext/source_dir destination_dir` to copy the file/all the files in a dir (`source_dir`) to the `destination_dir`. This only copies the files in the `source_dir`, not the sub-dirs.
- To copy all files AND sub-dirs (except empty ones) of a dir (`source_dir`) to the `destination_dir`, use `xcopy source_dir destination_dir /s`.

OR 

- `copy file_to_be_copied.ext destination_dir_path` to copy the file to the `destination_dir`.
- `move file.ext/source_dir destination_dir` to move files or dirs.

## Renaming files

- `rename source_file.ext/source_dir destination_dir` to rename a file or a dir.

## Deleting a file

- `del file_name.txt` **permanently** deletes the file from the cwd.

## File attributes

- Attributes include 'archived', 'hidden', 'system', etc.
- `attrib /?` for overview.
- Go to dir and type `attrib` to view the attributes of the files in it.
- Adding attributes, eg: `attrib -h +r file_name.txt`.

## Background and text colour

- `color bt` (b = background colour, t = text colour)
- For colour legend, type `color /?`.
- Type `color` to reset all colours to default.
