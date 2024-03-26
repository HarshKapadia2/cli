# Shell Scripting

-   [History of various Shells](https://askubuntu.com/a/976504)
-   [Shell vs Bash](https://medium.com/@varunkumar_53845/sh-vs-bash-a-summary-50f92a719e0d)
-   [Is bash scripting the same as shell scripting?](https://askubuntu.com/a/172487)
    -   `sh` = Bourne Shell
    -   `bash` = Bourne Again Shell
-   Unix had the Bourne Shell, which was modified in Linux and is called Bash (Bourne Again SHell).
-   [Unix vs Linux](https://www.guru99.com/difference-unix-vs-linux.html)
-   [Shell scripting crash course (beginners)](https://www.youtube.com/watch?v=v-F3YLd6oMw)
-   [Absolute vs Relative Path in Linux: What's the Difference?](https://linuxhandbook.com/absolute-vs-relative-path)
-   [The Missing Semester of Your CS Education](https://missing.csail.mit.edu)
-   [Google's Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
-   [Shell Script Best Practices](https://sharats.me/posts/shell-script-best-practices)
-   [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)
-   Check Shell scripts: [shellcheck.net](https://www.shellcheck.net)

---

-   The `#` is called 'sharp' and the `!` is called a 'bang', so together (`#!`) they're called a 'shebang' or 'hashbang'.
-   A shebang is used to declare the dialect being used by the script.
-   To find the location of the dialect, use the 'which' command. Eg: `which bash` Output: `/usr/bin/bash`
-   Add this as the first line in every Shell script.

    ```bash
    #!/usr/bin/bash
    ```

-   Running/executing a Shell script

    -   Two ways
        -   `./script.sh` (Preferred, as the terminal can decide the interpreter to be used.)
        -   `sh script.sh`
    -   [Difference between `./script.sh` and `sh script.sh`.](https://unix.stackexchange.com/a/136550)
        -   [About the Use of Dot-Slash (`./`) in Commands](http://www.linfo.org/dot_slash.html)
    -   [What is the difference between sourcing ('.' or 'source') and executing a file in bash? (`./test.sh` vs `. ./test.sh` or `source ./test.sh`)]
        -   [What does 'source' do?](https://superuser.com/questions/46139/what-does-source-do)
        -   [What is the difference between executing a Bash script vs sourcing it?](https://superuser.com/questions/176783/what-is-the-difference-between-executing-a-bash-script-vs-sourcing-it)

-   Error handling (`set -Eeuo pipefail`, `trap`, etc.): [How to Trap Errors in Bash Scripts on Linux](https://www.howtogeek.com/821320/how-to-trap-errors-in-bash-scripts-on-linux)

-   Debugging/printing commands to terminal: [What does `set -x` do?](https://stackoverflow.com/questions/36273665/what-does-set-x-do)

-   Output to terminal

    ```bash
    echo Selena Gomez
    ```

-   Variables

    -   Allowed: letters, numbers and underscores

    ```bash
    NAME="Harsh Kapadia"  # no spaces between var name, '=' and var value allowed.
    echo "My name is $NAME"
    echo "My name is ${NAME}"
    ```

    -   Strings in bash can be defined with `'` and `"` delimiters, but they are not equivalent. Strings delimited with `'` are literal strings and will not substitute variable values whereas `"` delimited strings will.

    ```bash
    $ name=selena

    $ echo 'Hey ${name}!'
    Hey ${name}!

    $ echo "Hey ${name}!"
    Hey Selena!

    $ echo "Hey '${name}'!"
    Hey 'Selena'!
    ```

    -   `${}` and `$()` are different.
        -   `${abc}` is variable/parameter substitution.
        -   `$(abc)` is command substitution and will execute whatever is inside the `()`, which means it is usually used to run a command or store the output of a command.
        -   [More info and good practices](https://superuser.com/a/935427)
    -   [Parsing command-line arguments](https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash)
    -   [`set` in Bash to set and clear arguments and `set --`](https://unix.stackexchange.com/questions/378566/ways-to-set-positional-parameters-in-bash)
    -   Built-in Shell variables
        -   [Built-in Shell variables `$#`, `$*`, etc](https://superuser.com/a/247131)
        -   [Special parameters](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_05_02)
    -   [Environment variables](https://unix.stackexchange.com/questions/495161/import-environment-variables-in-a-bash-script)
    -   Output redirection
        -   [What does " 2>&1 " mean?](https://stackoverflow.com/questions/818255/what-does-21-mean)
        -   [How does cmd > /dev/null 2>&1 work?](https://stackoverflow.com/questions/16995425/how-does-cmd-dev-null-21-work)

-   User input

    ```bash
    read -p "Enter your name: " NAME # 'p' stands for prompt
    echo "Hey $NAME, nice to meet you!"
    ```

-   If statement

    ```bash
    if [ "$NAME" == "Selena Gomez" ] # The spaces are important!
    then
    	echo "Hey Sel!"
    fi # ending if statement

    # Or

    if [[ "$NAME" == "Selena Gomez" ]]; then
    	echo "Hey Sel!";
    fi;

    if command -v "apt-get" > /dev/null; then
    	echo "The command 'apt-get' is available!"
    else
    	echo "The command 'apt-get' is not available."
    fi # From: https://unix.stackexchange.com/a/602841
    ```

    > NOTE:
    >
    > -   [More on `if`-`else`](https://linuxhandbook.com/if-else-bash)
    > -   [When are square brackets required in a Bash if statement?](https://stackoverflow.com/questions/8934012/when-are-square-brackets-required-in-a-bash-if-statement)
    > -   Quoting variables
    >     -   [Difference between quoting variables in shell script "if" statements?](https://unix.stackexchange.com/questions/86800/difference-between-quoting-variables-in-shell-script-if-statements)
    >     -   [When to wrap quotes around a shell variable?](https://stackoverflow.com/questions/10067266/when-to-wrap-quotes-around-a-shell-variable)
    > -   [What is the bash command: `command`?](https://askubuntu.com/questions/512770/what-is-the-bash-command-command)
    >     -   ['which' vs 'command -v' in Bash](https://stackoverflow.com/questions/37056192/which-vs-command-v-in-bash)

> [Difference between `()`, `(())`, `[]` and `[[]]`](https://superuser.com/questions/1533900/difference-between-and-or-and-in-bash)

-   If-elif-else statement

    ```bash
    if [[ "$NAME" == "Selena Gomez" ]] # The spaces are important!
    then
    	echo "Selly!"
    elif [[ "$NAME" == "Selena" ]]
    then
    	echo "Yay it's Sel!"
    else
    	echo "Hiya!"
    fi # ending if statement
    ```

-   Comparisons

    -   `val1 -eq val2`: Returns true if the values are equal
    -   `val1 -ne val2`: Returns true if the values are not equal
    -   `val1 -gt val2`: Returns true if val1 is greater than val2
    -   `val1 -ge val2`: Returns true if val1 is greater than or equal to val2
    -   `val1 -lt val2`: Returns true if val1 is less than val2
    -   `val1 -le val2`: Returns true if val1 is less than or equal to val2

    ```bash
    NUM_1=22
    NUM_2=7
    NUM_3=1992

    if [ "$NUM_1" -gt "$NUM_2" ]
    then
    	echo "$NUM_1 is greater than $NUM_2!"
    fi
    ```

    > NOTE:
    >
    > -   [Understanding boolean operators in bash script](https://unix.stackexchange.com/questions/105935/understanding-boolean-operators-in-bash-script)
    > -   Comparisons
    >     -   For string comparisons, use `>`, `<`, `==` (Bash) or `=` (Bash and Shell)
    >     -   For numerical comparisons, use `-eq`, `-lt`, `-gt`, etc.
    >     -   [Shell equality operators (`=`, `==`, `-eq`)](https://stackoverflow.com/questions/20449543/shell-equality-operators-eq)
    >     -   [How do I negate a test with regular expressions in a bash script?](https://stackoverflow.com/questions/4542732/how-do-i-negate-a-test-with-regular-expressions-in-a-bash-script)

-   File conditions

    -   `-d file` True if the file is a directory
    -   `-e file` True if the file exists (note that this is not particularly portable, thus -f is generally used)
    -   `-f file` True if the provided string is a file
    -   `-g file` True if the group id is set on a file
    -   `-r file` True if the file is readable
    -   `-s file` True if the file has a non-zero size
    -   `-u` True if the user id is set on a file
    -   `-w` True if the file is writable
    -   `-x` True if the file is an executable

    ```bash
    FILE="text.txt"

    if [[ -f "$FILE" ]]; then
    	echo "$FILE is a file!";
    elif [[ ! -f "$FILE" ]]; then
    	echo "$FILE is not a file : (";
    fi;
    ```

-   Case statements

    ```bash
    read -p "Are you 21 or over? Y/N " ANSWER

    case "$ANSWER" in
    	[yY] | [yY][eE][sS]) # Accepts 'y', 'Y', 'yes', 'YES', 'Yes', 'yEs'...
    		echo "You can have a beer ( :"
    		;; # ';;' is equivalent to a 'break' statement in C language
    	[nN] | [nN][oO])
    		echo "Sorry, no drinking"
    		;;
    	*) # Default
    		echo "Please enter y/yes or n/no"
    		;;
    esac
    ```

-   For loop

    ```bash
    NAMES="Selena Felix Lucas Evelien Sean Elisabeth Robert Sonny"

    for NOME in $NAMES
    	do
    		echo "Hello $NOME! ( :"
    done

    # touch file_1.md file_2.md file_3.md
    FILES=$(ls *.md)

    for FOLE in $FILES
    	do
    		echo "Renaming $FOLE to test_$FOLE"
    		mv $FOLE test_$FOLE
    done

    max=10
    for (( i=2; i <= $max; ++i )) # The whitespaces in this line don't matter.
    	do
    		echo "$i"
    done
    ```

-   While loop

    ```bash
    # Read from file, line by line
    LINE=1

    while read -r CURRENT_LINE
    	do
    		echo "$LINE: $CURRENT_LINE"
    		((LINE++)) # '(())': https://superuser.com/questions/1533900/difference-between-and-or-and-in-bash
    done < "./test_f1.md"
    ```

    > [More on the Bash While Loop](https://linuxize.com/post/bash-while-loop)

> [Difference between `()`, `(())`, `[]` and `[[]]`](https://superuser.com/questions/1533900/difference-between-and-or-and-in-bash)

-   String manipulation

    -   Delete the shortest `substring` match from the front of `${str}`: `${str#substring}`
    -   Delete the shortest `substring` match from the back of `${str}`: `${str%substring}`
    -   Delete the longest `substring` match from the front of `${str}`: `${str##substring}`
    -   Delete the longest `substring` match from the back of `${str}`: `${str%%substring}`

    ```bash
    $ str="Hey Selena! Hey Lucas!"

    $ echo ${str#*Hey}
    Selena! Hey Lucas!

    $ echo ${str%Hey*}
    Hey Selena!

    $ echo ${str##*Hey}
    Lucas!

    $ echo ${str%%Hey*}

    ```

> NOTE:
>
> -   The asterisk (`*`) is a catchall to match any and all characters. ([More info](<https://www.livefirelabs.com/unix_tip_trick_shell_script/unix_operating_system_fundamentals/unix-special-characters.htm#:~:text=metacharacters%20are%20%22*%22%2C%20%22%3F%22%2C%20%22%5B%5D%22%2C%20and%20%22%2D%22.-,The%20Asterisk,-The%20*%20(asterisk)%20metacharacter>))
> -   [Delete the last character of a string using string manipulation in shell script (`${var::-1}`)](https://unix.stackexchange.com/questions/144298/delete-the-last-character-of-a-string-using-string-manipulation-in-shell-script)

-   Internal Field Separator (IFS)

    -   Used to separate a string based on a certain character.
    -   Default value: Three character string comprising a space, tab and newline.

    ```bash
    $ string="foo bar foobar"

    $ for i in $string
    > do
    >    echo "'$i' is the substring"
    > done
    'foo' is the substring
    'bar' is the substring
    'foobar' is the substring
    ```

    -   Custom values can be set.
    -   [More info and use cases](https://www.baeldung.com/linux/ifs-shell-variable)
    -   [Unset IFS - unexpected behaviour](https://stackoverflow.com/a/58511401/11958552)
    -   [How do I split a string on a delimiter in Bash?](https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash)

-   Functions

    ```bash
    function greet()
    {
    	echo "Hello $1! Your age is $2!"
    }
    greet "Selena" "29"
    ```

    > -   [More about Bash Functions](https://linuxize.com/post/bash-functions)
    > -   [How to store output of a function in a variable in bash](https://stackoverflow.com/questions/64724576/how-to-store-output-of-a-function-in-a-variable-in-bash)
    > -   [Return value in a Bash function](https://stackoverflow.com/questions/17336915/return-value-in-a-bash-function)
    > -   [How to pass array as an argument to a function in Bash](https://stackoverflow.com/questions/16461656/how-to-pass-array-as-an-argument-to-a-function-in-bash)
    > -   [Passing arrays as parameters in bash](https://stackoverflow.com/questions/1063347/passing-arrays-as-parameters-in-bash)
    > -   [Access arguments to Bash script inside a function](https://stackoverflow.com/questions/3966048/access-arguments-to-bash-script-inside-a-function)
    >     -   [How to access command line arguments of the caller inside a function?](https://stackoverflow.com/questions/2740906/how-to-access-command-line-arguments-of-the-caller-inside-a-function)

-   Create a folder and write to a file

    ```bash
    mkdir "hello"
    touch "hello/world.md"
    echo "# Hello World" >> "hello/world.md"
    echo "Created hello/world.md"
    echo "Contents:"
    cat "hello/world.md"
    ```

-   Arrays

    -   [Using Arrays in Bash](https://linuxhandbook.com/bash-arrays)
    -   [How to split a string into an array in Bash?](https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash)
    -   [How do I split a string on a delimiter in Bash?](https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash)
    -   [Double quote array expansions to avoid re-splitting elements.](https://www.shellcheck.net/wiki/SC2068)
    -   [Convert a text string in bash to array](https://stackoverflow.com/questions/19657683/convert-a-text-string-in-bash-to-array)
    -   [Appending to Arrays in Bash](https://linuxhandbook.com/bash-append-array)
