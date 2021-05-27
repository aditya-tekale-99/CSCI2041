# Lab 10: Questions and discussion of Hwk 06 and Quiz 3

## CSci 2041: Advanced Programming Principles, Fall 2020

**There is nothing to turn in for this lab.**

Today's lab will be spent discussing questions you may yet have
regarding Hwk 06 and Quiz 3.

Travis, Eduardo, and Perry will hold general discussions in the open
Zoom meeting for the lab. Join the queue on Slack to meet with the other TAs
to discuss specific issues with syntax or type errors that may be preventing
your progress on the homework.

# Quiz 2 solutions

Since Quiz 2 covered some material that will also be covered on Quiz 3
and since Quiz 2 is not yet graded, the solution to Quiz 2 is provided
below.

# Part 1
```ocaml
type 'a tree = Leaf of 'a
             | Fork of 'a tree * 'a tree


let t = Fork (
            Fork (Leaf 1, Leaf 3),
            Fork (Leaf 4,
                  Fork (Leaf 6, Leaf 8))
          )

let rec sum (t: int tree) : int = match t with
  | Leaf v -> v
  | Fork (t1, t2) -> sum t1 + sum t2


let rec prod (t: int tree) : int = match t with
  | Leaf v -> v
  | Fork (t1, t2) -> prod t1 * prod t2


let () = 
  assert (sum t = 22);
  assert (sum (Leaf 4) = 4);
  assert (prod t = 576);
  assert (prod (Leaf 4) = 4)


let rec reduce (l: 'a -> 'b) (f: 'b -> 'b -> 'b) (t: 'a tree) : 'b =
  match t with
  | Leaf v -> l v
  | Fork (t1, t2) -> f (reduce l f t1) (reduce l f t2)

let sumr t = reduce (fun a -> a) (+) t

let prodr t = reduce (fun a -> a) ( * ) t

let () = 
  assert (sumr t = 22);
  assert (sumr (Leaf 4) = 4);
  assert (prodr t = 576);
  assert (prodr (Leaf 4) = 4)


let string_of_int_tree (t: int tree) : string =
  reduce string_of_int (^) t


let () =
  assert (string_of_int_tree (Leaf 4) = "4");
  assert (string_of_int_tree (Fork (Leaf 1, Leaf 23)) = "123");
  assert (string_of_int_tree (Fork (Leaf 1, Fork (Leaf 2, Leaf 3))) = 
            "123")
```

# Part 2

## A proof of ``all_evens lst = all_evens_f lst``

Consider the following function definitions:
```
let even x = x mod 2 = 0
           
let rec all_evens (lst: int list) : int list =
  match lst with
  | [] -> []
  | x::xs when even x -> x :: (all_evens xs)
  | x::xs -> all_evens xs

let rec filter (f: 'a -> bool) (lst: 'a list) : 'a list =
  match lst with
  | [] -> []
  | x::xs when f x -> x :: filter f xs
  | _::xs -> filter f xs

let all_evens_f lst = filter even lst
```

### 1. Principle of induction
```
P(lst) holds if P( [] ) holds and
             (if P(xs) then P(x::xs) holds)
```
### 2. Base case
``all_evens [] = all_evens_f ``

### 3. Inductive case
``all_evens (x::xs) = all_evens_f (x::xs)``

### 4. Inductive hypothesis
``all_evens xs = all_evens_f xs``

### 5. Base case
```
  all_evens []
= []
  by def of all_evens
= filter even []
  by def of filter
= all_evens_f []
  by def of all_even_f
```

### 6. Inductive case
Case: x is even
```
  all_evens (x::xs) 
= x :: all_evens xs
  by def of all_evens and our case assumption
= x :: all_evens_f xs
  by inductive hypothesis
= x :: filter even xs
  by def of all_evens_f
= filter even (x::xs)
  by def of filter
= all_evens_f (x::xs)
  by def of all_evens_f
```

Case: x is not even
```
  all_evens (x::xs) 
= all_evens xs
  by def of all_evens and our case assumption
= all_evens_f xs
  by inductive hypothesis
= filter even xs
  by def of all_evens_f
= filter even (x::xs)
  by def of filter
= all_evens_f (x::xs)
  by def of all_evens_f
```
