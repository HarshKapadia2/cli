# Shell Scripting

-   [Shell vs Bash](https://medium.com/@varunkumar_53845/sh-vs-bash-a-summary-50f92a719e0d)
-   Unix had the Bourne Shell, which was modified in Linux and is called Bash (Bourne Again SHell).
-   FYI: [Unix vs Linux](https://www.guru99.com/difference-unix-vs-linux.html)
-   [Shell scripting crash course (beginners)](https://www.youtube.com/watch?v=v-F3YLd6oMw)
-   [Absolute vs Relative Path in Linux: What's the Difference?](https://linuxhandbook.com/absolute-vs-relative-path)
-   [Shell Script Best Practices](https://sharats.me/posts/shell-script-best-practices)

---

-   The `#` is called 'sharp' and the `!` is called a 'bang', so together (`#!`) they're called a 'shebang' or 'hashbang'.
-   A shebang is used to declare the dialect being used by the script.
-   To find the location of the dailect, use the 'which' command. Eg: `which bash` Output: `/usr/bin/bash`
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

-   Output to terminal

    ```bash
    echo Selena Gomez
    ```

-   Variables

    -   Uppercase by convention
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
    ```

-   If-elif-else statement

    ```bash
    if [ "$NAME" == "Selena Gomez" ] # The spaces are important!
    then
    	echo "Selly!"
    elif [ "$NAME" == "Selena" ]
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

    if [ -f "$FILE" ]
    then
    	echo "$FILE is a file!"
    else
    	echo "$FILE is not a file : ("
    fi
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
    ```

-   While loop

    ```bash
    # Read from file, line by line
    LINE=1

    while read -r CURRENT_LINE
    	do
    		echo "$LINE: $CURRENT_LINE"
    		((LINE++)) # '(())': https://www.geeksforgeeks.org/basic-operators-in-shell-scripting
    done < "./test_f1.md"
    ```

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

> The asterisk (`*`) is a catchall to match any and all characters. ([More info](<https://www.livefirelabs.com/unix_tip_trick_shell_script/unix_operating_system_fundamentals/unix-special-characters.htm#:~:text=metacharacters%20are%20%22*%22%2C%20%22%3F%22%2C%20%22%5B%5D%22%2C%20and%20%22%2D%22.-,The%20Asterisk,-The%20*%20(asterisk)%20metacharacter>))

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

-   Functions

    ```bash
    function greet()
    {
    	echo "Hello $1! Your age is $2!"
    }
    greet "Selena" "29"
    ```

-   Create a folder and write to a file

    ```bash
    mkdir "hello"
    touch "hello/world.md"
    echo "# Hello World" >> "hello/world.md"
    echo "Created hello/world.md"
    echo "Contents:"
    cat "hello/world.md"
    ```
