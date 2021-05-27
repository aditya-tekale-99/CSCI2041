# Hwk_03 Feedback

Run on November 02, 08:49:10 AM.

+ Pass: Change into directory "Hwk_03".

## Part 1

+ Pass: Check that file "trees.ml" exists.

+ Pass: Check that an OCaml file "trees.ml" has no syntax or type errors.

    OCaml file "trees.ml" has no syntax or type errors.



Be sure your ``trees.ml`` file contains the sample trees ``str_tree`` and ``int_tree`` that are provided in the Hwk 03 specification.

+ Pass: 
Check that the result of evaluating
   ```
   size str_tree
   ```
   matches the pattern `4`.

   




+ Pass: 
Check that the result of evaluating
   ```
   sum int_tree
   ```
   matches the pattern `10`.

   




+ Pass: 
Check that the result of evaluating
   ```
   product int_tree
   ```
   matches the pattern `24`.

   




+ Pass: 
Check that the result of evaluating
   ```
   charcount str_tree
   ```
   matches the pattern `20`.

   




+ Pass: 
Check that the result of evaluating
   ```
   concat str_tree
   ```
   matches the pattern `"I really love OCaml!"`.

   




## Part 2. Trees with lists

+ Pass: Check that file "trees.ml" exists.

+ Pass: Check that an OCaml file "trees.ml" has no syntax or type errors.

    OCaml file "trees.ml" has no syntax or type errors.



Be sure your ``trees.ml`` file contains the sample trees ``strs_tree`` and ``ints_tree`` that are provided in the Hwk 03 specification.

+ Pass: 
Check that the result of evaluating
   ```
   list_tree_size strs_tree
   ```
   matches the pattern `11`.

   




+ Fail: 
Check that the result of evaluating
   ```
   list_tree_sum ints_tree
   ```
   matches the pattern `45`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-14:
    1 | (list_tree_sum ints_tree) = (45) ;;
         ^^^^^^^^^^^^^
    Error: Unbound value list_tree_sum
    Hint: Did you mean list_tree_size?
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_product ints_tree
   ```
   matches the pattern `311040`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-18:
    1 | (list_tree_product ints_tree) = (311040) ;;
         ^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_product
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_charcount strs_tree
   ```
   matches the pattern `54`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-20:
    1 | (list_tree_charcount strs_tree) = (54) ;;
         ^^^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_charcount
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_concat strs_tree
   ```
   matches the pattern `"I really do love Ocaml!  It must be your favorite too!"`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-17:
    1 | (list_tree_concat strs_tree) = ("I really do love Ocaml!  It must be your favorite too!") ;;
         ^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_concat
    ```


## Part 3 - using ``reduce``

+ Pass: Check that file "reduce.ml" exists.

+ Pass: Check that an OCaml file "reduce.ml" has no syntax or type errors.

    OCaml file "reduce.ml" has no syntax or type errors.



+ Pass: Make sure you are only using recursion in functions reduce

   



Be sure your ``reduce.ml`` file contains the sample trees ``strs_tree``, ``strs_tree``, ``int_tree``, and ``ints_tree`` that are provided in the Hwk 03 specification.

+ Fail: 
Check that the result of evaluating
   ```
   size str_tree
   ```
   matches the pattern `4`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-5:
    1 | (size str_tree) = (4) ;;
         ^^^^
    Error: Unbound value size
    ```


+ Fail: 
Check that the result of evaluating
   ```
   sum int_tree
   ```
   matches the pattern `10`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-4:
    1 | (sum int_tree) = (10) ;;
         ^^^
    Error: Unbound value sum
    ```


+ Fail: 
Check that the result of evaluating
   ```
   product int_tree
   ```
   matches the pattern `24`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-8:
    1 | (product int_tree) = (24) ;;
         ^^^^^^^
    Error: Unbound value product
    Hint: Did you mean reduce?
    ```


+ Fail: 
Check that the result of evaluating
   ```
   charcount str_tree
   ```
   matches the pattern `20`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-10:
    1 | (charcount str_tree) = (20) ;;
         ^^^^^^^^^
    Error: Unbound value charcount
    ```


+ Fail: 
Check that the result of evaluating
   ```
   concat str_tree
   ```
   matches the pattern `"I really love OCaml!"`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-7:
    1 | (concat str_tree) = ("I really love OCaml!") ;;
         ^^^^^^
    Error: Unbound value concat
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_size strs_tree
   ```
   matches the pattern `11`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-15:
    1 | (list_tree_size strs_tree) = (11) ;;
         ^^^^^^^^^^^^^^
    Error: Unbound value list_tree_size
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_sum ints_tree
   ```
   matches the pattern `45`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-14:
    1 | (list_tree_sum ints_tree) = (45) ;;
         ^^^^^^^^^^^^^
    Error: Unbound value list_tree_sum
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_product ints_tree
   ```
   matches the pattern `311040`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-18:
    1 | (list_tree_product ints_tree) = (311040) ;;
         ^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_product
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_charcount strs_tree
   ```
   matches the pattern `54`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-20:
    1 | (list_tree_charcount strs_tree) = (54) ;;
         ^^^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_charcount
    ```


+ Fail: 
Check that the result of evaluating
   ```
   list_tree_concat strs_tree
   ```
   matches the pattern `"I really do love Ocaml!  It must be your favorite too!"`.

   


   Test failed. The following errors were reported:

   ```
    Line 1, characters 1-17:
    1 | (list_tree_concat strs_tree) = ("I really do love Ocaml!  It must be your favorite too!") ;;
         ^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_concat
    ```


## Part 4 - sorted binary trees

+ Pass: Check that file "binary_trees.ml" exists.

+ Fail: Check that an OCaml file "binary_trees.ml" has no syntax or type errors.

    OCaml file binary_trees.ml has errors.

    Run "ocaml binary_trees.ml" to see them.

    Make sure that you are using ocaml version 4.08.1.  Run "ocaml -version" to check the version number.

+ Skip: Make sure you are only using recursion in functions insert_by, reduce, check, form_check

   

  This test was not run because of an earlier failing test.

+ Skip: 
Check that the result of evaluating
   ```
   insert_by compare 4 Nil
   ```
   matches the pattern `Leaf 4`.

   


  This test was not run because of an earlier failing test.

+ Skip: 
Check that the result of evaluating
   ```
   insert_by compare 2 (insert_by compare 4 Nil)
   ```
   matches the pattern `Fork (Leaf 2, 4, Nil)`.

   


  This test was not run because of an earlier failing test.

+ Skip: 
Check that the result of evaluating
   ```
   insert_by compare 4 (insert_by compare 2 Nil)
   ```
   matches the pattern `Fork (Nil, 2, Leaf 4)`.

   


  This test was not run because of an earlier failing test.

+ Skip: 
Check that the result of evaluating
   ```
   insert_by compare 4 (insert_by compare 4 Nil)
   ```
   matches the pattern `insert_by compare 4 Nil`.

   


  This test was not run because of an earlier failing test.

+ Skip: 
Check that the result of evaluating
   ```
   from_list compare [4;2;5;3;6;7;8] = Fork (Fork (Nil, 2, Leaf 3), 4, Fork (Nil, 5, Fork (Nil, 6, Fork (Nil, 7, Leaf 8))))
   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+ Skip: 
Check that the result of evaluating
   ```
   List.sort compare [4;2;5;3;6;7;8]
   ```
   matches the pattern `to_list (from_list compare [4;2;5;3;6;7;8])`.

   


  This test was not run because of an earlier failing test.

