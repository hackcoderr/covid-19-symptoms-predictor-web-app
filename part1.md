## Basic Linux Commands

---

1. Linux Provides a CLI (Command Line Interface) to Communicate with the OS.
   2.CLI is better for tasks which cannot be performed with the GUI.

---

<img src="https://img-a.udemycdn.com/course/750x422/2421042_3709_3.jpg" width="1500" height="500" alt="">

| Command     | Explanation                                               |
| :---------- | :-------------------------------------------------------- |
| pwd         | displays the current working directory of the terminal    |
| /           | Root directory                                            |
| echo        | Command that wriles its arguments to standard output.     |
| su          | Used to switch to root user                               |
| su username | Used to switch to a different user                        |
| sudo        | Excutes only that command with root/super user privileges |
| sudo        | Executes only that command to clear the terminal screen   |

|

### Working with Directory: 'ls' Command

> > ls [option][file|directory]

| Command-         | Explanation                                                                                                 |
| :--------------- | :---------------------------------------------------------------------------------------------------------- |
| ls               | This command lists all the contents in the current working directory                                        |
| ls path          | By specifying the path after ls, the content in that path will be displayed                                 |
| ls -l            | Using 'l' flag, lists all the contents along with lts owner settings,permissions,& time stamp(long formats) |
| ls -a            | Using 'a' flag, lists the hidden contents in the specified directory                                        |
| ls --author      | Using '--author' flag, lists the contents in the specified directory along with its owner                   |
| ls \*html        | Using '\*'flag, lists only the contents in the directory of a particular format                             |
| ls -lS >file.txt | Using '>' flag, copies the result of ls command into a text file                                            |

|

### Working with Directory:'cd'

> > \$ cd [directory]

| Command    | Explanation                                                                               |
| :--------- | :---------------------------------------------------------------------------------------- |
| cd/cd ~    | Change the directory to home directory                                                    |
| cd /       | Changes the directory to root directory                                                   |
| cd ..      | Changes the directory to its parents directory                                            |
| cd 'xx yy' | We specify the folder name in inverted commas because there is a space in the folder name |

|

### Working with Files: 'cat' Command

> > \$ cat [options]file1[file2..]

| Command | Explanation                                                                              |
| :------ | :--------------------------------------------------------------------------------------- |
| cat     | This command is used to display the content of text files and concatenate files into one |
| cat -b  | This is used to add line numbers to non blanks lines                                     |
| cat -n  | This is used to add line numbers to all lines                                            |
| cat -s  | This is to squeeze blanks lines into one line                                            |
| cat -E  | Show \$ at the end of line                                                               |

|

**NOTE:**\_

> > \$ cat > file1.txt

_The '>' flag can be used to create a new file and enter text contents from the terminal_

> > \$ cat >> file1.txt

_The '>>' flag can be used to append text contents to an exiting file from the terminal_
