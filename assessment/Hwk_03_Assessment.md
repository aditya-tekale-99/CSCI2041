# Hwk_03 Assessment

Run on November 03, 15:09:38 PM.

*Test results are for the code in this repository as it appeared on October 21 at 17:15 CT.*

+ Pass: Change into directory "Hwk_03".

## Part 1

+ Pass: Check that file "trees.ml" exists.

### `size`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   size   (Node ("World",
        Node (" ", 
              Node ("Hello", Empty, Empty),
              Empty
             ),
        Node ("!",
              Empty,
              Empty
             )
       )
   )
   ```
   matches the pattern `4`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   size   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `6`.

   




### `sum`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   sum   (Node (-3, 
        Node (-2, Empty, Empty),
        Node (-1,
              Node (4, Empty, Empty), 
              Empty
              )
       )
   )
   ```
   matches the pattern `-2`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   sum   (Node (3,
        Node (3, 
              Empty,
              Empty
             ),
        Node (2,
              Node (5, Empty, Empty),
              Node (5,Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `18`.

   




### `product`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   product   (Node (-3, 
        Node (-2, Empty, Empty),
        Node (-1,
              Node (4, Empty, Empty), 
              Empty
              )
       )
   )
   ```
   matches the pattern `-24`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   product   (Node (3,
        Node (3, 
              Empty,
              Empty
             ),
        Node (2,
              Node (5, Empty, Empty),
              Node (5,Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `450`.

   




### `charcount`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   charcount   (Node ("World",
        Node (" ", 
              Node ("Hello", Empty, Empty),
              Empty
             ),
        Node ("!",
              Empty,
              Empty
             )
       )
   )
   ```
   matches the pattern `12`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   charcount   (Node ("French ", 
	Node ("love ", 
		Node ("I ",
			Empty,
			Node ("really ", Node ("", Empty, Empty), Empty)),
	        Empty),
        Node ("Toast.", Empty, Empty))
	)


   ```
   matches the pattern `27`.

   




### `concat`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   concat   (Node ("World",
        Node (" ", 
              Node ("Hello", Empty, Empty),
              Empty
             ),
        Node ("!",
              Empty,
              Empty
             )
       )
   )
   ```
   matches the pattern `"Hello World!"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   concat   (Node ("French ", 
	Node ("love ", 
		Node ("I ",
			Empty,
			Node ("really ", Node ("", Empty, Empty), Empty)),
	        Empty),
        Node ("Toast.", Empty, Empty))
	)


   ```
   matches the pattern `"I really love French Toast."`.

   




### Assert Cases

+  _0_ / _5_ : Pass: Part 1: Extra assert cases (1pt per function).

    

### Style

+  _7_ / _7_ : Pass: Part 1 Style: check if each function looks OK (no obvious problems with style).

    

## Part 2

### `list_tree_size`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   list_tree_size   (Node (["13"],
        Node (["45";"6"], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node (["1";"6"], Empty, Empty),
              Node (["928"],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `6`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   list_tree_size   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `10`.

   




### `list_tree_sum`

+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_sum   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `45`.

   


   Test failed. The following errors were reported:

   ```
                        Line 1, characters 1-14:
    1 | (list_tree_sum   (Node ([1;3],
         ^^^^^^^^^^^^^
    Error: Unbound value list_tree_sum
    Hint: Did you mean list_tree_size?
    ```


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_sum   (Node ([],
        Node ([1;2], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([4;5],
              Node ([-3], Empty, Empty),
              Node ([],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `9`.

   


   Test failed. The following errors were reported:

   ```
                        Line 1, characters 1-14:
    1 | (list_tree_sum   (Node ([],
         ^^^^^^^^^^^^^
    Error: Unbound value list_tree_sum
    Hint: Did you mean list_tree_size?
    ```


### `list_tree_product`

+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_product   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `311040`.

   


   Test failed. The following errors were reported:

   ```
                        Line 1, characters 1-18:
    1 | (list_tree_product   (Node ([1;3],
         ^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_product
    ```


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_product   (Node ([],
        Node ([1;2], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([4;5],
              Node ([-3], Empty, Empty),
              Node ([],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `-120`.

   


   Test failed. The following errors were reported:

   ```
                        Line 1, characters 1-18:
    1 | (list_tree_product   (Node ([],
         ^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_product
    ```


### `list_tree_charcount`

+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_charcount   (Node (["13"],
        Node (["45";"6"], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node (["1";"6"], Empty, Empty),
              Node (["928"],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `10`.

   


   Test failed. The following errors were reported:

   ```
                        Line 1, characters 1-20:
    1 | (list_tree_charcount   (Node (["13"],
         ^^^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_charcount
    ```


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_charcount   (Node (["like "; "French "; "Toast "; ""],
        Node ([], 
              Node (["I "; ""; "really "], Empty, Empty), Empty), 
        Node (["pancake!"], Empty, Empty) 
       )
   )
   ```
   matches the pattern `35`.

   


   Test failed. The following errors were reported:

   ```
              Line 1, characters 1-20:
    1 | (list_tree_charcount   (Node (["like "; "French "; "Toast "; ""],
         ^^^^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_charcount
    ```


### `list_tree_concat`

+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_concat   (Node (["13"],
        Node (["45";"6"], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node (["1";"6"], Empty, Empty),
              Node (["928"],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `"4561316928"`.

   


   Test failed. The following errors were reported:

   ```
                        Line 1, characters 1-17:
    1 | (list_tree_concat   (Node (["13"],
         ^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_concat
    ```


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_concat   (Node (["like "; "French "; "Toast "; ""],
        Node ([], 
              Node (["I "; ""; "really "], Empty, Empty), Empty), 
        Node (["pancake!"], Empty, Empty) 
       )
   )
   ```
   matches the pattern `"I really like French Toast pancake!"`.

   


   Test failed. The following errors were reported:

   ```
              Line 1, characters 1-17:
    1 | (list_tree_concat   (Node (["like "; "French "; "Toast "; ""],
         ^^^^^^^^^^^^^^^^
    Error: Unbound value list_tree_concat
    ```


### Assert Cases

+  _0_ / _5_ : Pass: Part 2: Extra assert cases (1pt per function).

    

### Style

+  _7_ / _7_ : Pass: Part 2 Style: check if each function looks OK (no obvious problems with style).

    

## Part 3

+ Pass: Check that file "reduce.ml" exists.

### `size`

+ Pass: The function ``size`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   size   (Node ("World",
        Node (" ", 
              Node ("Hello", Empty, Empty),
              Empty
             ),
        Node ("!",
              Empty,
              Empty
             )
       )
   )
   ```
   matches the pattern `4`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   size   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `6`.

   


  This test was not run because of an earlier failing test.

### `sum`

+ Pass: The function ``sum`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   sum   (Node (-3, 
        Node (-2, Empty, Empty),
        Node (-1,
              Node (4, Empty, Empty), 
              Empty
              )
       )
   )
   ```
   matches the pattern `-2`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   sum   (Node (3,
        Node (3, 
              Empty,
              Empty
             ),
        Node (2,
              Node (5, Empty, Empty),
              Node (5,Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `18`.

   


  This test was not run because of an earlier failing test.

### `product`

+ Pass: The function ``product`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   product   (Node (-3, 
        Node (-2, Empty, Empty),
        Node (-1,
              Node (4, Empty, Empty), 
              Empty
              )
       )
   )
   ```
   matches the pattern `-24`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   product   (Node (3,
        Node (3, 
              Empty,
              Empty
             ),
        Node (2,
              Node (5, Empty, Empty),
              Node (5,Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `450`.

   


  This test was not run because of an earlier failing test.

### `charcount`

+ Pass: The function ``charcount`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   charcount   (Node ("World",
        Node (" ", 
              Node ("Hello", Empty, Empty),
              Empty
             ),
        Node ("!",
              Empty,
              Empty
             )
       )
   )
   ```
   matches the pattern `12`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   charcount   (Node ("French ", 
	Node ("love ", 
		Node ("I ",
			Empty,
			Node ("really ", Node ("", Empty, Empty), Empty)),
	        Empty),
        Node ("Toast.", Empty, Empty))
	)


   ```
   matches the pattern `27`.

   


  This test was not run because of an earlier failing test.

### `concat`

+ Pass: The function ``concat`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   concat   (Node ("World",
        Node (" ", 
              Node ("Hello", Empty, Empty),
              Empty
             ),
        Node ("!",
              Empty,
              Empty
             )
       )
   )
   ```
   matches the pattern `"Hello World!"`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   concat   (Node ("French ", 
	Node ("love ", 
		Node ("I ",
			Empty,
			Node ("really ", Node ("", Empty, Empty), Empty)),
	        Empty),
        Node ("Toast.", Empty, Empty))
	)


   ```
   matches the pattern `"I really love French Toast."`.

   


  This test was not run because of an earlier failing test.

### `list_tree_size`

+ Pass: The function ``list_tree_size`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_size   (Node (["13"],
        Node (["45";"6"], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node (["1";"6"], Empty, Empty),
              Node (["928"],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `6`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   list_tree_size   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `10`.

   


  This test was not run because of an earlier failing test.

### `list_tree_sum`

+ Pass: The function ``list_tree_sum`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_sum   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `45`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   list_tree_sum   (Node ([],
        Node ([1;2], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([4;5],
              Node ([-3], Empty, Empty),
              Node ([],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `9`.

   


  This test was not run because of an earlier failing test.

### `list_tree_product`

+ Pass: The function ``list_tree_product`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_product   (Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `311040`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   list_tree_product   (Node ([],
        Node ([1;2], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([4;5],
              Node ([-3], Empty, Empty),
              Node ([],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `-120`.

   


  This test was not run because of an earlier failing test.

### `list_tree_charcount`

+ Pass: The function ``list_tree_charcount`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_charcount   (Node (["13"],
        Node (["45";"6"], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node (["1";"6"], Empty, Empty),
              Node (["928"],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `10`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   list_tree_charcount   (Node (["like "; "French "; "Toast "; ""],
        Node ([], 
              Node (["I "; ""; "really "], Empty, Empty), Empty), 
        Node (["pancake!"], Empty, Empty) 
       )
   )
   ```
   matches the pattern `35`.

   


  This test was not run because of an earlier failing test.

### `list_tree_concat`

+ Pass: The function ``list_tree_concat`` must not be recursive.





+  _0_ / _0.5_ : Fail: 
Check that the result of evaluating
   ```
   list_tree_concat   (Node (["13"],
        Node (["45";"6"], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node (["1";"6"], Empty, Empty),
              Node (["928"],Empty,Empty)
             )
       )
   )
   ```
   matches the pattern `"4561316928"`.

   


   Test failed. The following errors were reported:

   ```
    type 'a tree = Empty | Node of 'a * 'a tree * 'a tree
    val int_tree : int tree =
      Node (3, Node (1, Node (4, Empty, Empty), Empty), Node (2, Empty, Empty))
    val str_tree : string tree =
      Node ("love ", Node ("really ", Node ("I ", Empty, Empty), Empty),
       Node ("OCaml!", Empty, Empty))
    val ints_tree : int list tree =
      Node ([1; 3], Node ([4; 5; 6], Empty, Node ([], Empty, Empty)),
       Node ([], Node ([1; 6], Empty, Empty), Node ([9; 2; 8], Empty, Empty)))
    val strs_tree : string list tree =
      Node (["Ocaml!  "; "It "; "must "; "be "],
       Node (["do "; "love "], Node (["I "; "really "], Empty, Empty), Empty),
       Node (["your "; "favorite "; "too!"], Empty, Empty))
    File "reduce.ml", line 42, characters 2-7:
    42 | 	|Empty -> b
           ^^^^^
    Error: This pattern matches values of type 'c tree
           but a pattern was expected which matches values of type
             'a -> 'b -> 'b -> 'b
    ```


+  _0_ / _0.5_ : Skip: 
Check that the result of evaluating
   ```
   list_tree_concat   (Node (["like "; "French "; "Toast "; ""],
        Node ([], 
              Node (["I "; ""; "really "], Empty, Empty), Empty), 
        Node (["pancake!"], Empty, Empty) 
       )
   )
   ```
   matches the pattern `"I really like French Toast pancake!"`.

   


  This test was not run because of an earlier failing test.

### Style

+  _6_ / _6_ : Pass: Part 3 Style: check if each function looks OK (no obvious problems with style).

    

## Part 4

+ Pass: Check that file "binary_trees.ml" exists.

### `insert_by`

+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   insert_by compare 6     (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))
   ```
   matches the pattern `    (Fork (
        Fork (
	    Nil,
	    -2,
	    Fork (Nil, 5, Leaf 6)
	),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   insert_by compare 11     (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))
   ```
   matches the pattern `    (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Leaf 11,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   insert_by compare 13     (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))
   ```
   matches the pattern `    (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   insert_by (fun x y -> compare x y * (-1)) 11     (Fork (
        Fork (Nil, 13, Leaf 12),
        10,
        Leaf 3
    ))
   ```
   matches the pattern `    (Fork (
        Fork (
	    Nil,
	    13,
	    Fork (Nil, 12, Leaf 11)    
	),
        10,
        Leaf 3
    ))`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _2_ : Pass: insert_by: extra assert cases

    

+  _0_ / _4_ : Pass: insert_by: check that function style looks OK (no obvious problems with style).

    

### `from_list`

+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   from_list compare [10; -2; 5; 13; 14; 16; 20]
   ```
   matches the pattern `    (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   from_list (fun x y -> compare x y * (-1)) [10; 10; 3; 13; 12; 12]
   ```
   matches the pattern `    (Fork (
        Fork (Nil, 13, Leaf 12),
        10,
        Leaf 3
    ))`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _1_ : Pass: from_list: uses List.fold_left

    

+  _0_ / _1_ : Pass: from_list: makes call to `insert_by` in fold's helper function

    

+  _0_ / _2_ : Pass: from_list: extra assert cases

    

+  _0_ / _2_ : Pass: from_list: check that function style looks OK (no obvious problems with style).

    

### `reduce`

+  _0_ / _1_ : Pass: reduce: Nil - returns accumulator argument

    

+  _0_ / _1_ : Pass: reduce: Fork - applies a generic function to Fork value and the 2 reduced children.

    

+  _0_ / _1_ : Pass: reduce: Leaf - applies a generic function (different from Fork's) to Leaf value (Leaf v -> f v)

    

+  _0_ / _2_ : Pass: reduce: extra assert cases

    

+  _0_ / _2_ : Pass: reduce: check that function style looks OK (no obvious problems with style).

    

### `to_list`

+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   to_list     (Fork (
        Fork (Nil, -2, Leaf 5),
        10,
        Fork (
            Nil,
            13,
            Fork (
                Nil,
                14,
                Fork (Nil, 16, Leaf 20)
            )
        )
    ))
   ```
   matches the pattern `[-2; 5; 10; 13; 14; 16; 20]`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```
   to_list     (Fork (
        Fork (Nil, 13, Leaf 12),
        10,
        Leaf 3
    ))
   ```
   matches the pattern `[13; 12; 10; 3]`.

   


   Test failed. The following errors were reported:

   ```
    type 'a btree = Nil | Leaf of 'a | Fork of 'a btree * 'a * 'a btree
    File "binary_trees.ml", line 10, characters 12-21:
    10 |     assert (insert_by compare 4 Nil = Leaf 4);
                     ^^^^^^^^^
    Error: Unbound value insert_by
    ```


+  _0_ / _1_ : Pass: to_list: doesn't use rec keyword

    

+  _0_ / _1_ : Pass: to_list: uses reduce

    

+  _0_ / _2_ : Pass: to_list: extra assert cases

    

+  _0_ / _1_ : Pass: to_list: check that function style looks OK (no obvious problems with style).

    

#### Total score: _32_ / _100.0_

