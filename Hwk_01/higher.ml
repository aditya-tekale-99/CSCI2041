(*All odds*)
let all_odds x = List.filter(fun y -> y mod 2 <> 0) x

(*Decrement*)
let decrement_all x = List.map(fun y -> y - 1 ) x

(*Min of Integer List as a fold*)
let min_fold lst = match lst with
	|[]-> failwith "empty lst"
	|x::y -> List.fold_left(fun a b-> if b < a then b else a) x y

(*Sum and prod*)
let sum_prod x = (List.fold_left (+) 0 x, List.fold_left ( * ) 1 x)

(*Partition left*)
let partition_left f lst =
	let f (pass,fail) elem = if f elem
				  then(pass@[elem],fail)
				  else(pass, fail @ [elem])
	in
	List.fold_left f ([], []) lst

(*Partition right*)
let partition_right f lst = 
	let f elem (pass,fail) = if f elem 
				  then (elem::pass, fail)
				  else (pass, elem::fail)
	in
	List.fold_right f lst ([], [])

(*Generality of Folds*)
(*I used foldl as its easier to read and understand the code, atleast for me, while compared to foldr (takes me some time to figure out whats happeneing while using foldr)*)
let map_as_fold f x = List.fold_left (fun e l -> e @ [f l] ) [] x
