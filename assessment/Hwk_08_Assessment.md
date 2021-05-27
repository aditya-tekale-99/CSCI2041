# Hwk_08 Assessment

Run on December 20, 10:23:18 AM.

*Test results are for the code in this repository as it appeared on December 16 at 17:15 CT.*

+ Fail: Change into directory "Hwk_08".

     Directory "Hwk_08" not found.

+ Skip: Check that file "search_exceptions.ml" exists.

  This test was not run because of an earlier failing test.

``Part 1``

+  _0_ / _2_ : Skip: 
Check that the result of evaluating
   ```ocaml
   List.mem [4; 2; 1; -7]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _2_ : Skip: 
Check that the result of evaluating
   ```ocaml
   List.mem [4; -5; 1]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _2_ : Skip: 
Check that the result of evaluating
   ```ocaml
   List.mem [3; -5; 2]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _2_ : Skip: 
Check that the result of evaluating
   ```ocaml
   List.mem [3; 4; -7]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _2_ : Skip: 
Check that the result of evaluating
   ```ocaml
   subsetsum_exn_ref_all [3; 4; -2; -9]
   ```
   matches the pattern `[]`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: The function subsetsum_exn_ref_all uses OCaml references in an appropriate way and the function is a good effort at a solution

  This test was not run because of an earlier failing test.

+ Skip: Check that file "search_wolf.ml" exists.

  This test was not run because of an earlier failing test.

``Part 2``

+  _0_ / _10_ : Skip: 
Check that the result of evaluating
   ```ocaml
   
match (crossing_continuation (fun c -> Some c)) with
  | None -> false
  | Some c -> List.mem c
    [[(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, L, R, R); (L, L, L, R);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)];
     [(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, R, R, L); (L, R, L, L);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)]]

   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _10_ : Skip: 
Check that the result of evaluating
   ```ocaml
   
  List.sort compare (crossing_all ()) =
    [[(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, L, R, R); (L, L, L, R);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)];
     [(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, R, R, L); (L, R, L, L);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)]]

   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: crossing_continuation uses a continuation as required and the code is a reasonable attempt

  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: crossing_all shows reasonable effort and uses a reference to hold the list of solutions

  This test was not run because of an earlier failing test.

+ Skip: Check that file "twentyfour.ml" exists.

  This test was not run because of an earlier failing test.

``Part 3``

+  _0_ / _5_ : Skip: 
Check that the result of evaluating
   ```ocaml
   rat_simplify (eval (BinOp (Rat (4,1), Add, Rat (3,1) ) ) )
   ```
   matches the pattern `(7, 1)`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: 
Check that the result of evaluating
   ```ocaml
   rat_simplify (eval (BinOp (Rat (4,1), Div, Rat (3,1) ) ) )
   ```
   matches the pattern `(4, 3)`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: 
Check that the result of evaluating
   ```ocaml
   try rat_simplify (eval (BinOp (Rat (4,1), Div, Rat (0,1) ) ) ) with
    | EvalError DivByZero -> (99,99)
   ```
   matches the pattern `(99,99)`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _10_ : Skip: 
Check that the result of evaluating
   ```ocaml
   find_expr [(8,1); (3,1); (8,1); (3,1)]
   ```
   matches the pattern `Some (BinOp (Rat (8, 1), Div, BinOp (Rat (3, 1), Sub, BinOp (Rat (8, 1), Div, Rat (3, 1)))))`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _10_ : Skip: 
Check that the result of evaluating
   ```ocaml
   match find_expr [(4,1); (2,1); (6,1); (3,1)] with
  | None -> false
  | Some e -> e = BinOp (Rat (4, 1), Add,
                         BinOp (Rat (2, 1), Add,
                                BinOp (Rat (6, 1), Mul, Rat (3, 1))))
              ||
              e = BinOp (Rat (4, 1), Mul,
                         BinOp (Rat (2, 1), Mul,
                                BinOp (Rat (6, 1), Sub, Rat (3, 1))))

   ```
   matches the pattern `true`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _10_ : Skip: 
Check that the result of evaluating
   ```ocaml
   find_expr [(2,1); (3,1); (5,1); (7,1)]
   ```
   matches the pattern `None`.

   


  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: reasonable style and proper indentation

  This test was not run because of an earlier failing test.

+  _0_ / _5_ : Skip: shows reasonable effort

  This test was not run because of an earlier failing test.

#### Total score: _0_ / _100_

