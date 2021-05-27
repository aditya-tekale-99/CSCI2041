(* This file contains a few helper functions and type declarations
   that are to be used in Homework 2. *)

(* Place part 1 functions 'take', 'drop', 'length', 'rev',
   'is_elem_by', 'is_elem', 'dedup', and 'split_by' here. *)

let rec take n l = match l with
  | [] -> [] 
  | x::xs -> if n > 0 then x::take (n-1) xs else []

let rec drop n l = match l with
  | [] -> [] 
  | x::xs -> if n > 0 then drop (n-1) xs else l

(*Length Function*)
let length (lst : 'a list): int  = List.fold_left(fun x y -> x+1) 0 lst

(*List Reverse*)
let rev (lst: 'a list): 'a list = List.fold_left(fun ele x -> x :: ele) []lst

(*is_elem_by*)
let is_elem_by (f: 'a -> 'b -> bool) (elem: 'b) (lst:'a list): bool  =
	let f = List.filter(fun x -> f x elem) lst
	in
	match f with
	|[] -> false
	| _ -> true

(*is_elem*)
let is_elem (elem: 'a) (lst: 'a list):bool =
	is_elem_by (=) elem lst

(*removing duplicates*)
let dedup (lst: 'a list): 'a list =
	let dup2 = List.sort(fun x y -> if x < y then -1 else 1) lst
	in
	let f a elem =
		match elem with 
			|h :: _ -> if h = a then elem else a::elem
			|[] -> [a]
	in
	List.fold_right f dup2 []

(*Splitting function*)
(*split_by using three arguments*)
let split_by (f: 'a -> 'b -> bool) (lst: 'b list) (sptr: 'a list): 'b list list = 
	(*using pattern match to split the elements*)
	let f a b =
		match a, b with
			|a, _ when is_elem_by f a sptr -> []::b
			|a, x::xs -> (a::x)::xs
			|a, [] -> [[a]]
	in
	(*returns final list*)
	List.fold_right f lst [[]]



(* Some functions for reading files. *)
let read_file (filename:string) : char list option =
  let rec read_chars channel sofar =
    try 
      let ch = input_char channel
      in read_chars channel (ch :: sofar)
    with
    | _ -> sofar
  in
  try 
    let channel = open_in filename
    in 
    let chars_in_reverse = read_chars channel []
    in Some (rev chars_in_reverse)
  with
    _ -> None

(*Part 2*)
type word = char list
type line = word list

let convert_to_non_blank_lines_of_words (lst: char list): char list list list = 
	let line = split_by (=) lst ['\n'];
	in
	let f a b =
		let word = split_by (=) a [' '; '.'; '!'; '?'; ','; ';'; ':'; '-']
		in
		let empty a b =
			if a = [] then b else a :: b
			in
			(List.fold_right empty word []) :: b
	in
	List.fold_right f line []
	
type result = OK 
	    | FileNotFound of string
	    | IncorrectNumLines of int 
	    | IncorrectLines of (int * int) list
	    | IncorrectLastStanza

let convert_to_char_list (lst: char list option) : char list =
	match lst with 
	|None -> failwith "Error"
	|Some lst' -> lst'

let delete (x: line list): line list =
	List.fold_right (fun a b -> if a = [] then b else a::b) x []

let lowercase (x: line list): line list =
	let lower y = List.fold_right( fun a b -> (Char.lowercase_ascii a):: b) y []
	in
	let low (z: line): line = List.fold_right (fun a b -> (lower a)::b) z []
	in
	List.fold_right(fun a b -> (low a)::b) x []

let sort (lst: 'a list): 'a list =
	List.sort( fun a b -> if a < b then -1 else 1) lst

let last_stanza (ls: line list): word list =
	let word a b = a :: b
	in
	let line l lst = (List.fold_right word l []) @ lst
	in
	dedup (List.fold_right line ls []) 

let parse3stanza (l1: line) (l2: line) (l3: line) (l4:line) (l5: line) (l6: line) (x: int): (int*int) list =
	let a = if l1 = l2 then [] else [(x+1, x+2)]
	in
	let b = if l3 = l4 then a else a @ [(x+3, x+4)]
	in
	if b!= [] then b else let n = sort(l1 @ l3)
	in
	if n = (sort(l5 @ l6)) then b else b @ [(x+5, x+6)]

(*Part 3*)
let paradelle (filename: string): result = 
	let file = read_file(filename)
	in
	if file = None then FileNotFound (filename) 
	else let x = delete (convert_to_non_blank_lines_of_words (convert_to_char_list (file)))
	in
	let lowchar = lowercase x
	in
	if ( length lowchar) != 24 then IncorrectNumLines (length lowchar)
	else match lowchar with
		|x1::x2::x3::x4::x5::x6::y -> (let xres = parse3stanza x1 x2 x3 x4 x5 x6 0 in
		match y with
		|y1::y2::y3::y4::y5::y6::z -> (let yres = xres @ (parse3stanza y1 y2 y3 y4 y5 y6 6) in
		match z with 
		|z1::z2::z3::z4::z5::z6::x -> ( let zres = yres @ (parse3stanza z1 z2 z3 z4 z5 z6 12) in
		if length zres = 0 then let n = dedup (x1@x2@x3@x4@x5@x6@y1@y2@y3@y4@y5@y6@z1@z2@z3@z4@z5@z6)
		in 
		if ( n = (last_stanza x)) then OK else IncorrectLastStanza
		else IncorrectLines (zres) )
		| _ -> IncorrectNumLines (length lowchar)
		)
		| _ -> IncorrectNumLines (length lowchar)
		) 
		| _ -> IncorrectNumLines (length lowchar)
		
