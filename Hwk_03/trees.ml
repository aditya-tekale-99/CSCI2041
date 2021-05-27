(*PART 1*)

(* A tree type declaration. *)
type 'a tree = Empty 
             | Node of 'a * 'a tree * 'a tree

(* A sample tree containing ints *)
let int_tree : int tree =
  Node (3, 
        Node (1,
              Node (4, Empty, Empty), Empty), 
        Node (2, Empty, Empty) 
       )

(* A sample tree containing strings *)
let str_tree : string tree = 
  Node ("love ", 
        Node ("really ", 
              Node ("I ", Empty, Empty), Empty), 
        Node ("OCaml!", Empty, Empty) 
       )

(*size*)
let rec size (x: 'a tree): int =
	match x with 
	|Empty -> 0
	|Node (t,t1,t2) -> 1 + size t1 + size t2

(*sum*)
let rec sum (x: 'a tree): int = 
	match x with
	|Empty -> 0
	|Node (t, t1, t2) -> t + sum t1 + sum t2

(*product*)
let rec product (t: int tree): int = 
	match t with
	|Empty -> 1
	|Node (a,a1,a2) -> a * product a1 * product a2

(*charcount*)
let rec charcount (x: string tree): int =
	match x with
	|Empty -> 0
	|Node (t, t1, t2) -> String.length t + charcount t1 + charcount t2

(*concat*)
let rec concat (x: string tree): string =
	match x with 
	|Empty -> ""
	|Node (t, t1, t2) -> concat t1 ^ t ^ concat t2

let () = 
  print_string "Testing part 1 ... " ;
  try
    
    assert (size str_tree = 4);
    assert (sum int_tree = 10);
    assert (product int_tree = 24);
    assert (charcount str_tree = 20);
    assert (concat str_tree = "I really love OCaml!");
    
    print_string "tests passed.\n"
  with
    Assert_failure (file, line, column) -> 
    let msg = "\n\n\nAssert failed on line " ^ string_of_int line ^ 
                ", column " ^ string_of_int column ^ "\n\n\n\n"
    in print_string msg

(*PART 2*)

let ints_tree: int list tree =
  Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )

let strs_tree: string list tree = 
  Node (["Ocaml!  "; "It "; "must "; "be "],
        Node (["do "; "love "], 
              Node (["I "; "really "], Empty, Empty), Empty), 
        Node (["your "; "favorite "; "too!"], Empty, Empty) 
       )

(*list_tree_size*)
let rec list_tree_size (x: 'a list tree): int =
	match x with 
	|Empty -> 0
	|Node (t,t1,t2) -> List.length t + list_tree_size t1 + list_tree_size t2



(*list_tree_concat*)

let () = 
  print_string "Testing part 2 ... " ;
  try
    
    assert (list_tree_size strs_tree = 11);
    (*assert (list_tree_sum ints_tree = 45);
    assert (list_tree_product ints_tree = 311040);
    assert (list_tree_charcount strs_tree = 54);
    assert (list_tree_concat strs_tree = 
              "I really do love Ocaml!  It must be your favorite too!");
     *)
    print_string "tests passed.\n"
  with
    Assert_failure (file, line, column) -> 
    let msg = "\n\n\nAssert failed on line " ^ string_of_int line ^ 
                ", column " ^ string_of_int column ^ "\n\n\n\n"
    in print_string msg
