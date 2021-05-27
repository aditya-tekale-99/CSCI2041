(*1. Circle Circumference*)
let circle_circum_v1 r = (2.0 *. 3.141 *. r)


(*2. Circle Circumference with nested let expression*)
let circle_circum_v2 r = 
(let pi = 3.141
in 2.0 *. pi *. r)


(*3. Product of List of Elements*)
let rec product xs = match xs with
|[] -> 1
| x::rest -> x * product rest


(*4. Sum of Squared Difference*)
let rec sum_sqrdiffs xs = match xs with
|[] -> 0
|x1::[] -> 0
|x1::(x2::[]) -> (x1-x2)*(x1-x2)
|x1::x2::l-> (x1-x2)*(x1-x2) + sum_sqrdiffs (x2::l)


(*5. 2D points and distance between them*)
let distance (x1, y1) (x2, y2) = sqrt((x2-.x1) *. (x2-.x1) +. (y2-.y1) *. (y2-.y1))


let upper_right(x,y) = x> 0.0 && y> 0.0

(*6. Triangle Perimeter*)
let triangle_perimeter p1 p2 p3 =  
let d1 = distance p1 p2
in
let d2 = distance p2 p3
in
let d3 = distance p3 p1
in
d1+.d2+.d3
