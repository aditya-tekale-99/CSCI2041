```
Homework 4: Reasoning about Correctness 
by Aditya Tekale
```

Problem 1
```
let rec prod = function
	|[] -> 1
	|y::ys -> y * prod ys

Show: prod(l1 @ l2) = prod l1 * prod l2 

1) Base case: prod ([] @ l2) = prod [] * prod l2

2) Inductive case: Show prod((y::ys) @ l2) = prod (y::ys) * prod l2               

3) Iductive hypothesis: prod(ys @ l2) = prod ys * prod l2

4) Principle of induction: ∀l , P (l) holds if P ([ ]) holds and P (l') => ∀v, P (v :: l'))

5) Base Case Proof

  prod ([] @ l2)
= prod l2
  by properties of lists and @
= 1 * prod l2
  by arithmetic
= prod [] + prod l2
  by def of prod

6) Inductive Case proof

  prod((y::ys) @ l2)
= prod(y::(ys @ l2))
  by properties of lists and @
= y * prod (ys @ l2)
  by def of prod
= y * (prod ys * prod l2)
  by inductive hypothesis
= (y * prod ys) * prod l2
  by arithmetic
= prod(y::ys) * prod l2
  by def of prod
``` 

Problem 2
```
let rec sum = function
	|[] -> 0
	|y::ys -> y + sum ys

let rec length = function
	|[] -> 0
	|y::ys -> 1 + length ys

let rec inc_all = function
	|[] -> []
	|y::ys -> (y+1) :: inc_all ys

Show: sum(inc_all l) = length l + sum l

1) Base case: sum(inc_all []) = length [] + sum []

2) Inductive case: sum(inc_all (y::ys)) = length (y::ys) + sum (y::ys)

3) Inductive Hypothesis: sum(inc_all ys) = length ys + sum ys

4) Principle of induction: ∀l , P (l) holds if P ([ ]) holds and P (l') => ∀v, P (v :: l'))

5) Base case proof

  sum(inc_all [])
= sum([])
  by properties of lists
= 0 + sum []
  by arithmetic
= length [] + sum []
  by def of length

6) Inductive case proof

  sum(inc_all (y::ys))
= sum (inc_all y ::(ys))
  by properties of lists
= sum y (inc_all ys)
  by arithemtic
= sum (inc_all ys)
  by induction hypothesis
= length ys + sum ys
  by def of sum(inc_all)
```

Problem 3
```
let rec map f l = match l with
  | [] -> []
  | y::ys -> f y :: map f ys

let inc x = x + 1

Show: map inc l = inc_all l

1) Base case: map inc [] = inc_all []

2) Inductive case: map inc (y::ys) = inc_all (y::ys)

3) Inductive Hypothesis: map inc ys = inc_all ys

4) Principle of induction: ∀l , P (l) holds if P ([ ]) holds and P (l') => ∀v, P (v :: l'))

5) Base case proof

  map inc []
= map []
  by properties of lists
= 1 + map []
  by arithmetic
= inc_all []
  by def. of map inc

6) Inductive case proof

  map inc(y::ys)
= map (inc y :: (ys))
  by properties of lists
= y (map inc ys)
  by def. of map
= map inc ys 
  by inductive hypothesis
= inc_all ys
  by def. of map inc
```

Problem 4
```
type 'a tree = Empty
             | Node of 'a * 'a tree * 'a tree

let rec to_list (t: 'a tree) : 'a list = match t with
  | Empty -> []
  | Node (v, tl, tr) -> to_list tl @ [v] @ to_list tr

let rec product (t: int tree): int = 
	match t with
	|Empty -> 1
	|Node (a,a1,a2) -> a * product a1 * product a2
  
Show: prod (to_list t) = product t

1) Base case: prod (to_list Empty) = product Empty

2) Inductive case: prod (to_list Node(v,tl,tr)) = product (Node(v,tl,tr))

3) Inductive Hypothesis: prod (to_list (t1)) = product (t1) 
                         prod (to_list (t2)) = product (t2)

4) Inductive principle: ∀t ∈ ’a btree, P(t) holds if 
				- P(Empty) and 
				- P (t1) and P (t2) => P(Node(t1 ,v,t2))

5) Base case proof:

  Consider the LHS that is,
  prod (to_list Empty)
= prod []
  by def of to_list
= prod Empty
  by def of product
= 1
  by def of product
  
  Consider the RHS that is,
  product Empty
= product 1
  by def of product
= prod Empty
  by def of product
= 1
  by def of product
  
As LHS = RHS, the base case is proved.

6) Inductive case proof:

 prod (to_list Node(v,t1,t2)) = product (Node(v,t1,t2))
 
 Consider the LHS
  prod(to_list(v,t1,t1))
= prod(v, t1, t2)
  by def of to_list
= Node (v,t1,t2)
  by def of product

  Consider the RHS
  product (Node(v,t1,t2)
= product (v,t1,t2)
  by def of product
= Node (v,t1,t2)
  by def of product

As mentioned in the inductive hypothesis, LHS = RHS, by inductive hypothesis we can say that the inductive case is proved. 
  
```

Problem 5
```
let rec size (x: 'a tree): int =
	match x with 
	|Empty -> 0
	|Node (t,t1,t2) -> 1 + size t1 + size t2

let rec size_r (x: 'a tree): int =
	let add3 t t1 t2 = t + t1 + t2
	in
	reduce 0 add3 x

let rec reduce (b: 'a) (f: 'b -> 'a -> 'a -> 'a) (t: 'b tree): 'a =
	match t with
	|Empty -> b
	|Node (v, t1, t2) -> f v (reduce b f t1) (reduce b f t2)

Show: size t = size_r t

1) Base case: size Empty = size_r Empty

2) Inductive case: size (v,t1,t2) = size_r (v,t1,t2)

3) Inductive hypothesis: size t1 = size_r t1
                         size t2 = size_r t2

4) Principle of Induction: ∀t ∈ ’a btree, P(t) holds if 
				- P(Empty) and 
				- P (t1) and P (t2) => P(Node(t1 ,v,t2))

5) Base case proof: 
  
  Consider the LHS
  size Empty
= 0
  by def of size
= reduce 0 add3 
  by def of size_r
= size_r t
  by def of size_r
= size_r Empty
  by def of size_r
  
6) Inductive case proof

  size(v,t1,t2)
= size t1 
  by def of size
= size_r t1
  by def of ind. hypothesis
= size_r (v,t1,t2)
  by principle of ind. hyp.
```

