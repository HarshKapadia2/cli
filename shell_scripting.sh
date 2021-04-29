# Shell Scripting


# Shell vs Bash: https://medium.com/@varunkumar_53845/sh-vs-bash-a-summary-50f92a719e0d
# Shell scripting crash course (beginners): https://www.youtube.com/watch?v=v-F3YLd6oMw


# The '#' is called 'sharp' and the '!' is called a 'bang', so together they're called a 'shebang'.
# A shebang is used to declare the dialect being used by the script.
# To find the location of the dailect, use the 'which' command. Eg: `which bash` Output: `/usr/bin/bash`

#!/usr/bin/bash


# Output to terminal
echo Selena Gomez


# Variables
# Uppercase by convention
# Allowed: letters, numbers and underscores
NAME="Harsh Kapadia" # no spaces between var name, '=' and var value allowed.
echo "My name is $NAME"
echo "My name is ${NAME}"


# User input
read -p "Enter your name: " NAME # 'p' stands for prompt
echo "Hey $NAME, nice to meet you!"


# If statement
if [ "$NAME" == "Selena Gomez" ] # The spaces are important!
then
	echo "Hey Sel!"
fi # ending if statement


# If-elif-else statement
if [ "$NAME" == "Selena Gomez" ] # The spaces are important!
then
	echo "Selly!"
elif [ "$NAME" == "Selena" ]
then
	echo "Yay it's Sel!"
else
	echo "Hiya!"
fi # ending if statement


# Comparisons
# val1 -eq val2: Returns true if the values are equal
# val1 -ne val2: Returns true if the values are not equal
# val1 -gt val2: Returns true if val1 is greater than val2
# val1 -ge val2: Returns true if val1 is greater than or equal to val2
# val1 -lt val2: Returns true if val1 is less than val2
# val1 -le val2: Returns true if val1 is less than or equal to val2
NUM_1=22
NUM_2=7
NUM_3=1992

if [ "$NUM_1" -gt "$NUM_2" ]
then
	echo "$NUM_1 is greater than $NUM_2!"
fi


# File conditions
# -d file   True if the file is a directory
# -e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
# -f file   True if the provided string is a file
# -g file   True if the group id is set on a file
# -r file   True if the file is readable
# -s file   True if the file has a non-zero size
# -u    	True if the user id is set on a file
# -w    	True if the file is writable
# -x    	True if the file is an executable
FILE="text.txt"

if [ -f "$FILE" ]
then
	echo "$FILE is a file!"
else
	echo "$FILE is not a file : ("
fi


# Case statements
read -p "Are you 21 or over? Y/N " ANSWER

case "$ANSWER" in
	[yY] | [yY][eE][sS]) # Accepts 'y', 'Y', 'yes', 'YES', 'Yes', 'yEs'...
		echo "You can have a beer ( :"
		;;
	[nN] | [nN][oO])
		echo "Sorry, no drinking"
		;;
	*) # Default
		echo "Please enter y/yes or n/no"
		;;
esac


# For loop
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


# While loop
# Read from file, line by line
LINE=1

while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
		((LINE++)) # '(())': https://www.geeksforgeeks.org/basic-operators-in-shell-scripting/
done < "./test_f1.md"


# Functions
function greet()
{
	echo "Hello $1! Your age is $2!"
}
greet "Selena" "29"


# Create a folder and write to a file
mkdir "hello"
touch "hello/world.md"
echo "# Hello World" >> "hello/world.md"
echo "Created hello/world.md"
echo "Contents:"
cat "hello/world.md"
