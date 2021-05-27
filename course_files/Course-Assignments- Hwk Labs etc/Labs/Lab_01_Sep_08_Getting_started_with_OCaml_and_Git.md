# Lab 1: Getting started with GitHub and OCaml

*CSci 2041: Advanced Programming Principles, Fall, 2020

**Due:** Friday, September 11 at 5:00pm.  You should be able to complete
lab work during the lab.   But occasionally some work may not get
completed, thus this due date. 

A quick survey with a very important question and a chance at some very small amount of extra credt:  https://forms.gle/GYgtcvHpDVoQfKeXA

# Introduction

Welcome to CSci 2041.  Please be sure to get a copy of the syllabus
from the public class repo ([link](https://github.umn.edu/umn-csci-2041-F20/public-class-repo/blob/master/Course-Info/Syllabus.md)).  Read it before lecture
on Wednesday.

### Goals of this lab:

+ In this lab, you will set up remote access to a CSE Lab Machine.

+ You will set up your University of Minnesota GitHub
repository that will be used to turn in your homework assignments for
this course.

+ You will also install the OCaml compilers and associated tools that we
will be using in this class.

+ Finally, you will modify an OCaml program, run it, and turn it in
via GitHub. 

We will discuss how to set up your own computer with OCaml and Git so
that you can do course work from you own computer in the
next few weeks.  Working on your own computer will be easier, but our
first goal is the learn a bit about OCaml and Git.

### GitHub:

* The University of Minnesota has its own GitHub installation -
  https://github.umn.edu - that we
  will be using in the course.  We **are not** using
  https://github.com.

* Git is a software version control system that we will be using in
  the class.  You will turn your work in using GitHub, not 
  Canvas.  We will provide feedback on your work using GitHub as well.


### Set up your CSE Labs account if you do not have one

If you do not yet have a CSE Labs account, perhaps because your are a College of
Liberal Arts student, then create that account now.

To do so, go to this web site and fill in the requested information:

https://wwws.cs.umn.edu/account-management/


# Lab Steps to Complete

## Working with CSE Lab Machines From Home

 To remote access a CSE Lab Machine from your own device, use one of the options outlined in [this guide](https://github.umn.edu/umn-csci-2041-F20/public-class-repo/blob/master/Course-Resources/How-Tos/Working-with-CSE-Lab-Machines-From-Home.md). It's recommended that you work from a lab machine, as it already has Git and OCaml installed.

You can choose to install OCaml locally on your own machine, but keep in mind that all assignments are graded on lab machines and must work there.

All the next steps in this lab assume you're working from a lab machine.

## Working with GitHub and Git

### Initialize your GitHub account

+ If you've already logged into https://github.umn.edu, then proceed
to the next step since your repository should already be set up.

+ If you've never logged into https://github.umn.edu, then do so now.
Then give your University Internet Id (we'll call this UIID for short)
to the grad TA in charge of your lab so that they can set up your repository.  This is the same
as the part of your University email address that comes before the
`@umn.edu` part of the address.

+ Note that this is **not** your student ID number that appears on
your student Id card.  We will never ask you for that number.


### Verify that your 2041 repository is set up

+ If your University Internet Id is **user0123** then your repository
will be named **repo-user0123**.  In the examples and text below,
replace **user0123** with your University Internet Id.

+ Log into https://github.umn.edu and select the **umn-csci-2041-F20**
organization and click on the repository named **repo-user0123**.

+ At the URL
  https://github.umn.edu/umn-csci-2041-F20/repo-user0123 
  you should see a list of files in your repository.  This will
  include only a file named **README.md**.

If this file is not there, speak to a TA in your lab.

This repository is a database containing the files and the history of
all their changes made since they were added to the repository.  It is
much more than a simple copy of a set of files.


### Setting up Git in your CSE Labs account

+ Log into your CSE (College of Science and Engineering) account.

+ Verify Git is installed.  Execute the following:

(But don't type the `%`.  That is meant to symbolize the prompt you see in your terminal window.  It may be different that the `%` sign.  You'll just type `git --version`.  Don't type the `%` in any of the other examples below.) 
``` 
% git --version
```

+ Configure Git.

You need to tell Git what your name, email address and favorite
editor are. Below is the series of commands that you should
enter. Be sure to fill in the appropriate details for yourself 

```
% git config --global user.name "YOUR NAME HERE"
% git config --global user.email "YOUR UMN EMAIL ADDRESS"
% git config --global core.editor "nano"
```

If you have a favorite editor (for example `emacs` or `vim` instead of
`nano`) then you can enter the command to start that editor where it says
`nano` above.

Note that your name appears between double quotes since it has spaces
in it. Your email address doesn't, so it doesn't need to be in
quotes. If you would like "emacs -nw" as your editor (emacs such that
it doesn't open a new window but opens in the terminal) then you'll
want double quotes around that 2 word phrase. 

Check that these are set correctly; execute

```
% git config -l
```

(If you later set up Git and OCaml on your own computer you will want
to repeat the steps above on that computer.)


### Create a space for your Git workspaces

Create a directory in your CSE account named "csci2041" (You can use
some other name, of course, but in the discussion we will assume that
you used "csci2041"). Then enter your newly created directory.

```
% mkdir csci2041
% cd csci2041
```

In **csci2041** you will put copies of a "public" read-only repository
containing files that we want to distribute to you during the semester
and also copies of your individual repository that only you and the
TAs and instructor have access to.

(If you later set up Git and OCaml on your own computer you will want
to repeat the steps above on that computer.)

### Clone your individual repository

The Git "clone" operation makes a copy of a repository and places it
in your account.  This copy contains the files and also all the
history of changes---just like the repository stored on
https://github.umn.edu.

In your **csci2041** directory, execute the following
```
% git clone http://github.umn.edu/umn-csci-2041-F20/repo-user1234.git
```

(If you later set up Git and OCaml on your own computer you will want
to repeat the stepsa above on that computer.)

After entering your UIID credentials this will create the directory
called repo-user1234.  
It will contain a **README.md** file.

Execute the following:
```
% cd repo-user1234
% ls
```

When you clone your repository Git will create some hidden files
stored in the **.git** directory that contain the long name of this
repository, so that we won't need to type it anymore.
This directory contains the copy of the repository with all the past
history of changes to the files and other information.  So now there
are two copies of your repository. 

These hidden files tell Git where the GitHub central server is so that
operations involving the server won't need this long name. 

Execute the following:
```
% ls -a
% ls .git/
```

Modifying these hidden **.git** files by hand, or creating them by
copying directories, is an extremely bad idea. It will cause you many
headaches with Git. **So don't do it!**  


*You only need to do this clone step once to initially install the
repository in your account.*

If you have another computer and want to do some of your homework on
that, then you will need to repeat this step for that computer as
well.


### Commands that access the repository

The following command reads these hidden files and will tell you the
URL of the central repository, and some other information.

Execute the following:
```
% git remote --verbose
```

A status operation will also tell you if you've made changes to your
workspace since the last time you updated it with files from the
repository. This is important because we grade your work by getting it
out of your repository. If it is in your workspace but not the central
GitHub repository we can't see it and it won't be graded.

Run the following: 
```
% git status 
``` 

Since the files in your
workspace (see below) and repositories (both local and the one on
https://github.umn.edu) are the same, Git tells you as much.


### Working files

So, if the hidden directory **.git** is another copy of the
repository, what are the files in this top-level repository directory?

These files are copies of the files that you can edit.  You can create
new files and delete files that are no longer needed.  **But**, we
will need to "commit" any changes that we make to these files to the
repository, eventually, so that the repository and the "working files"
in your account are synchronized.

Ensure you are in your git repository. Then create a `Lab_01` directory and 
change into it by executing the following:
```
% mkdir Lab_01
% cd Lab_01
```

Using the text editor of your choice, create a file named `fib.ml`
in your just-created `Lab_01` directory.  Copy and paste the following OCaml
code into that file and save it.
```
(* Author: Eric Van Wyk
   Modified by: ... replace the text between the dots with your name ... *)

(* A function computing the Fibonacci sequence: 1, 1, 2, 3, 5, 8, ... *)

(* There is a bug in the following program.  Can you fix it? *)

let rec fib x =
  if x < 3 then 1 else fib (n-1) + fib (n-1)
```

Add your name into the comment on the second line of the file.

Don't worry about the rest of the file, we will learn how to read this
OCaml code soon enough.  There is in fact a bug in this program, but
don't fix it just yet.  We use the error in some example interactions
below.

### Adding files

Check the status of your working files and repository by executing the
following: 
```
% git status
```

This tells you that there is now an "untracked" file named `fib.ml`
and that Git is not tracking changes to this file.  To tell Git to do
so, we must `add` the file using the following command:
```
% git add fib.ml
```

Now run `git status` again and see what it says.  What is Git telling
you here?

### Committing changes

Git is now aware of this file and sees that changes have been made
that have not be "committed".  Only "committed" changes to the file
can be pushed up to the central GitHub server (http://github.umn.edu)
and thus it is only these that will be graded or assessed.

To commit the file changes you've made, execute the following
```
% git commit -m "Adding my name to the file"
```

The text in quotes is the commit message. It should provide a brief 
description of what changes are being made in this commit; in this case
we have added our name to the file `fib.ml`.

Now go back to your browser and refresh the page showing your
repository.  Does this file show up there?

No, it doesn't.  The **commit** command adds your changes to your
local repository only.  We now need to **push** those changes from
your local repository up to the one stored on https://github.umn.edu.
We will do that next.

But first, run 
``` 
% git status 
``` 
What is it telling you?  Your
changes are committed to the local repository but not the "central"
one on https://github.umn.edu


### Pushing changes

Run
```
% git push
```
This pushes your changes from your local repository up to the central
one. 

Run
```
% git status
```
again.  It should now tell you that your working copy of the files and
both repositories are all synchronized. 


In your web browser, check that a file named `Lab_01_Feedback.md` has
been added to your repository.  You can click on the link to see its
contents.  These files will typically be generated for your
assignments everytime you push changes to your programs up to
GitHub and they will give you some feedback on your assignment.

If the feedback indicates that something is wrong, then fix your code
and ``add``, ``commit``, and ``push`` it again.  The feedback file
should be updated soon to indicate if your fix was successful.  Note
the timestamp in these files so you know if the feeback file has been
generated again.

**You can push new versions of your code as often as you like until
  you are satisfied with it.**

If the results here are not what you expect then you need to either
fix the issues identified with your program, or, talk to a TA or post
a question on Piazza to see if there is a problem with the tools that
automatically generate these files.

In this case, these tools will verify that your program is in the
right directory, in the right file, but broken and not yet working.
Later in the lab you will fix the problems.

Now run the following:
```
% git pull
```
This will "pull" the feedback file down to your local workspace.  You
will need to do a ``git pull`` before you can do another ``git push``
so that the changes made to your repository on https://github.umn.edu
by the feedback scripts can be merged into your local copy.

This merge should always succeed for the work we do in 2041.  If it
fails, pay close attention to the error messags from git to see if you
can fix things.  


### Clone the public repository

Go back to your **csci2041** directory, by executing the following
command: 
```
% cd ../..
```

Now clone the public class repository by executing the following
command: 
```
% git clone http://github.umn.edu/umn-csci-2041-F20/public-class-repo.git
```

In the directory `Labs` you will see the Markdown file
`Lab_01_Sep_08_Getting_started_with_OCaml_and_Git.md` from which this
web page is generated.

When we add new files to the central repository you will be asked to
execute the following:
```
% git pull
```
This "pulls" changes from the central repository down to your local
one and updates the working copy of those files in your account with
the changes. 

Try it.  It doesn't have any effect, but it doesn't cause any harm
either.


## Working with OCaml

### Set up OCaml

Go back to your account home directory:
```
% cd
```

We need to verify that the correct version of OCaml is installed. The libraries are 
slightly different between versions and so it is important to use the correct one.

Execute the following command:
```
% which ocaml
```

This will indicate if ocaml is installed and display the path to the 
ocaml compiler on the machine. It should be **/usr/bin/ocaml**
or something similar.

Next, execute the following:
```
% ocaml -version
```

This should tell you that you are using version 4.08.1 of OCaml.

### Use OCaml

Go back to the `Lab_01` directory in your individual repository.
Perhaps by the following commands: 
```
% cd
% cd csci2041/repo-user0123/Lab_01
```

Start the OCaml interpreter:
```
% ocaml
```

At the OCaml prompt (#) enter the following (do type "#use", not just
"use"): 
```
#  #use "fib.ml" ;;
```
Note that the prompt is "#" and directives to the interpreter to load
files and quit also begin with a "#". 

OCaml will report an error in the program:
> File "fib.ml", line 9, characters 28-29:
> Error: Unbound value n 

Quit OCaml using the "quit" command as illustrated below:
```
# #quit ;;
```
You may also quit OCaml by typing Ctrl-D (the "end of file" character in Linux) at the prompt.

We will now need to fix the file.


### Fix the sample file

Using a text editor (Emacs, vim, gedit, Atom, VS Code etc.) edit the `fib.ml` file.

We have already seen one error: on line 9 we use a the name n which has not been
defined. Replace the variable n with the correct variable name, x.

Also, replace the text between dots in the comment with your name if you've not already done so.

Save the file and repeat the steps above to start OCaml and load the file.

If the file is successfully loaded you should compute the 5th Fibonacci number by typing the following:

```
# fib 5 ;;
```

There is a bug in this program.  It will return `8` instead of the
correct answer of `5`.  Let's fix that bug now.

The nth Fibonacci number is computed by adding together the previous two Fibonacci numbers. Traditionally, 
the first two fibonacci numbers are both `1`. We will use an extended sequence which has a `0` as the 
"0th" Fibonacci number. 

Your sequence should start with `fib 0` returning `0` and both `fib 1` and `fib 2` return `1`. You will 
need an if-then-else expression to check if `x = 0` and evaluate to the correct value if true. The else 
branch will also be an if-then-else expression, you may use the one that is there now. The final function 
should look something like the following
```
let rec fib x =
  if x = 0 then 0 else
    if x < 3 then 1 else fib (x-1) + fib (x-2)
```

After you've saved the file, test it.  Fire up `ocaml` again and see
if you get the right answer. 


### Commit and push so that the corrected version is up on GitHub.  

Now you need to just turn in your work.  First, see what Git says
about the status of your files 
```
% git status
```
It tells you that a file has been modified.  
You now need to commit your changes and push them up to your central
GitHub repository. 

Execute the appropriate `git add` and `git commit` commands and the
run `git push`.  What is the error message that you get?

It is telling you that changes have been made to code up on the GitHub
server and that you need to "pull" those changes before you can "push"
new changes up to the repository.

Execute the following:
```
% git pull
```

The above command "should" work and seems to work for many of you.  If it doesn't you'll get a message about the need to "merge" the local repository in your account with the repository up on the https://github.umn.edu server.
You will be put into an editor window where you could enter a message to document this "merge" operation.  There is no need for this comment, so just save the file.   Now try `git pull` again.  It should tell you that your repository is already up to date.

You should now see that feedback file in your local directory (just
above your `Lab_01` directory.  Verify that it is there.


Now do a `git push` to see that your changed code is pushed up to the
Github server.  Also verify that the feedback file gets updated to
indicate that your code is now working properly.

Verify that this worked, by using your browser to see the changes on
https://github.umn.edu. 


This concludes Lab 01.


### **Due:** Friday, September 11 at 5:00pm.  

You should be able to complete lab work during the lab.  But
occasionally some work may not get completed, thus this due date.

Note that these changes must exist in your repository on
https://github.umn.edu.  Doing the work, but failing to push those
changes to your central repository cannot be assessed.

After the due date, we will typically run additional tests and the
results of this assessment will be put a file named
`Lab_01_Assessment.md` in your repository.  This file will have your
score for the lab.  A similar pattern will be repeated for other
assignments. 

