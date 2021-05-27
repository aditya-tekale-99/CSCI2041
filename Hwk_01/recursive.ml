(*even or odd*)
let odd x = x mod 2 <> 0

(*GCD, Euclid's Algorithm*)
let rec euclid a b = 
	if b = 0 then a 
	else euclid b (a mod b)

(*Fractions*)
let frac_simplify (a,b) =
	let f = euclid a b 
	in ((a/f), (b/f))
	
(*Minimum*)
let rec min_list lst =
	match lst with
		|[]-> 0
		|x::[] -> x
		|x::xs -> let y = min_list xs
		in
		if x>y then y
		else x

(*Dropping list elements*)
let rec drop x lst=
	match lst with 
		|[] -> []
		|h::t -> if (x>0) then drop (x-1) t else lst

