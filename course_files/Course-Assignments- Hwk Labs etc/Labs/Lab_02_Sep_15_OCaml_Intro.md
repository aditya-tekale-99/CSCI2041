# Lab 2: Introduction to OCaml

*CSci 2041: Advanced Programming Principles, Spring 2019*

**Due:** Friday, Sep 18 at 5:00pm. You should be able to complete lab
work before or during the lab.  But occasionally some work may not get
completed, thus this due date.

# Introduction

### Goals of this lab:

+ In this lab you will write a few functions in OCaml to begin the
process of learning how best to use the language.

+ You will create a file named *lab_02.ml* in a *Lab_02* directory
  inside your individual class repository.

  Since we use some scripts in grading different aspects of your work
  it is critical that you name your directories and files exactly as
  specified.


# Getting started.

In your individual repository, make a directory named *Lab_02* and
change into it: 
```
% mkdir Lab_02
% cd Lab_02
```

Create an empty file with the name *lab_02.ml*:
```
% touch lab_02.ml
```

It is in this file that you will put your solutions to the programming 
problems below.

In a separate terminal window, run ``utop`` (the system used in
lecture) or ``ocaml`` to start the OCaml interpreter.  To load the
contents of your file type
```
#use "lab_02.ml" ;;
```
at the ``#`` prompt.  As you edit your file you'll need to do this
again each time to load your changes.


# OCaml programming 

Some of the functions that you are asked to solve below are similar to
ones we've solved in class.  These can be found in ``getting_started.ml`` in
the ``Resources/Sample Programs`` directory of the public repository.  Open
another tab in your browser and you can see that file
[here](../../Course-Resources/Sample%20Programs/getting_started.ml).


### #1 Circle circumference, version 1

Write a function named ``circle_circum_v1`` with the type ``float ->
float``.  This function should take as input the radius of a circle and 
compute its circumference.

For this version, do not use any nested let-expressions or function
calls; only use literals like ``3.1415`` and floating point operators
such as ``*.``, ``+.``, or ``/.``.

For example, ``circle_circum_v1 2.5`` should evaluate to about ``15.70``.


### #2 Circle circumference, version 2

Now write another version of this function, this time named
``circle_circum_v2`` with the same type as ``circle_circum_v1``.

This version, however, must use a nested let-expression to define the
constant ``pi`` to have the appropriate value.  If there are any
computations that are duplicated use a nested ``let``-expression to give
that sub-computation a name and use it accordingly in the computation.


### #3 Product of a list of elements

In lecture, we wrote a function to compute the sum of all the values
in a list of integers.  It had the type ``int list -> int``.

Write a similar function named ``product`` that computes the product
of the values in a list of integers.  It will have the same type as
the sum function.

For example, ``product [2; 3; 4]`` should evaluate to ``24``.


### #4 Sum of squared differences

For this problem, you are to write a function that again has the type
``int list -> int``.  It must be called ``sum_sqrdiffs`` and it will
compute the sum of the squared differences between all successive pairs of
numbers in the list.

For example, ``sum_sqrdiffs [4; -1; 5; 2]`` will evaluate to ``70``. The desired
computation is 
``(4-(-1))^2 + ((-1)-5)^2 + (5-2)^2 = 70.``

For lists with 0 or only 1 element, return the value 0.

You just write a recursive list-processing function for this
task. Write the function so that it carries out the operation as
outlined above to compute the squared difference between each
successive pair of numbers.

For this function, you will (yet again) write a ``match`` expression as the body of the function.

How many pattern clauses do you need?  We have to consider cases in which the number of elements is
- 0: this is the empty list
- 1: the single element list

- 2: this is going to be our "base case" and will be a pattern that
  matches a 2-element list.  The following will work for the pattern but
  you must fill in the expression to determine value to compute
  ```
    | x1::(x2::[]) -> ... write your expression here ...
  ```
  This pattern has something more complex than a simple name to the
  right of the ``::`` cons constructor.  It has another nested pattern
  that matches a list of one element.  Together, this pattern only
  matches lists with exactly 2 elements.  Note that the parenthesis
  are not required here; they only make it explicit that the cons
  constructor is right associative.

- more than 2: You will also need another pattern that matches lists
  of 2 or more elements.  This second pattern will need to bind 2
  elements of the list to some names so that your expression can
  compute their squared difference.  It will be similar to the one
  above, but you need to figure out the details.


Don't hesitate to discuss this problem with your fellow students - all
of these can be done collaboratively.


### #5 2D points and distance between them

Tuples in OCaml are simple data structures for holding a few values of
possibly different types.  For example, we might represent points on a
plane using two floating point values in a tuple.  This type is
written ``float * float``.

A function that returns ``true`` if a point is in the "upper-right" quadrant 
of a plane might be implemented as follows:
```
let upper_right (x,y) = x > 0.0 && y > 0.0
```
This function has the type ``float * float -> bool``.

Implement a function named ``distance`` with type ``float * float ->
float * float -> float`` to compute the distance between two points
(each represented as a tuple of 2 ``float`` values).

You may find the ``sqrt`` function useful in this function. If you are unsure
about the formula to use, ask your neighbors or TA for help. Such discussion
is always encouraged in lab!


### #6 Triangle perimeter

This problem asks you to compute the perimeter of a triangle.  For a
triangle with 3 corners named p1, p2, and p3, the perimeter is the
distance from p1 to p2 plus the distance from p2 to p3 plus the
distance from p3 back to p1.

Implement a function named ``triangle_perimeter`` with type ``float *
float -> float * float -> float * float -> float`` to do this.
You should make use of the ``distance`` function you wrote in the
previous step to do this, rather than duplicating the distance formula
multiple times in your implementation.


*This concludes lab 02.*

Note that these changes must exist in your repository on
github.umn.edu.  Doing the work, but failing to push those changes to
your central repository cannot be assessed.

