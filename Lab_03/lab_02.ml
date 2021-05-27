(*Name: Aditya Tekale (tekal005@umn.edu)*)
(* Group members: Matt Yokanovich (yokan013@umn.edu), Mike Cao (cao00121@umn.edu) *)


(*1. Circle Circumference*) 
(*No changes made in this code as it is easy to read and understand whats happening*)
let circle_circum_v1 r = (2.0 *. 3.141 *. r)


(*2. Circle Circumference with nested let expression*)
(*Changes to make: use identation for easy readability*)
(*I used identation so as its easy to read the code and understand what's happeening*)

let circle_circum_v2 r = 
	let pi = 3.141
	in 2.0 *. pi *. r


(*3. Product of List of Elements*)
(*Changes to make: use identation*)
(*Used identation in this code to make it easy to read and undertsand what's happening*)

let rec product xs = match xs with
	|[] -> 1
	| x::rest -> x * product rest


(*4. Sum of Squared Difference*)
(*Changes to make: remove first two cases and use a raise in end and use identation*)
(*Used a raise case from lab manual and removed first two cases which returned 0 for empty list and single list, using this raise makes the code small as i wont have to use two cases and its easier to understand whats hapepening when executed in ocaml or utop*)

let rec sum_sqrdiffs xs = match xs with
	|x1::(x2::[]) -> (x1-x2)*(x1-x2)
	|x1::x2::l-> (x1-x2)*(x1-x2) + sum_sqrdiffs (x2::l)
	|_ -> raise(Failure "sum_sqrdiffs input list needs atlease two elements") 


(*5. 2D points and distance between them*)
(*Changes to make: use **2.0 for squaring *)
(*Used a '**2.0' rather than '(x2-.x1)*.(x2-.x1)', my group member(Matt) mentioned about this to me, by doing so, it makes my code easier to read and undertsand at just one quick glance*)

let distance (x1, y1) (x2, y2) = sqrt((x2-.x1) ** 2.0 +. (y2-.y1) ** 2.0)


(*6. Triangle Perimeter*)
(*Changes to make: use identation*)
(*Used Identation to make the code look neat and easy to read*)

let triangle_perimeter p1 p2 p3 =  
	let d1 = distance p1 p2
	in
	let d2 = distance p2 p3
	in
	let d3 = distance p3 p1
	in
	d1+.d2+.d3

