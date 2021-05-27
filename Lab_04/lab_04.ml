(*length*)
let length lst =
	List.fold_left(fun x y -> x+1) 0 lst

(*andf*)
let andf lst =
	List.fold_left(fun x y -> x && y) true lst

(*orf*)
let orf lst = 
	List.fold_left(fun x y -> x || y) false lst

(*is-element*)
let is_elem elem lst =
	List.fold_left(fun x y -> if y == elem then true else x) false lst

(*list reverse*)
let rev lst =
	List.fold_left(fun ele x -> x :: ele) []lst

(*ASCII*)
let ascii_sum lst =
	List.fold_left(fun x y -> Char.code y + x) 0 lst

(*lebowski*)
let lebowski lst =
	List.fold_right(fun x y -> if x == '.'
	 then [',';' ';'d';'u';'d';'e';'.']@y
	  else x::y) lst[]

