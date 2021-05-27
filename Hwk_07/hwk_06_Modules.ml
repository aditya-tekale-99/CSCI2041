open LazeeModules
open StreamModules

module type Hwk_06_Sig = sig
  type 'a stream

  val take: int -> 'a stream -> 'a list

  val from: int -> int stream
  val nats: int stream
  val cubes_from: int -> int stream
  val cubes_from_zip: int -> int stream
  val cubes_from_map: int -> int stream
  val facts: int stream
  val facts': int stream
  val primes: int stream
end

module Hwk_06(S: StreamSig) : Hwk_06_Sig = struct
   type 'a lazee = 'a hidden ref

 and 'a hidden = Value of 'a 
               | Thunk of (unit -> 'a)

let delay (unit_to_x: unit -> 'a) : 'a lazee = 
  ref (Thunk unit_to_x)

let force (l: 'a lazee) : unit = match !l with
  | Value _ -> ()
  | Thunk f -> l := Value (f ())

let demand (l: 'a lazee) : 'a = 
  force l; 
  match !l with
  | Value v -> v
  | Thunk f -> raise (Failure "this should not happen")

type 'a stream = Cons of 'a * 'a stream lazee


let rec from n =
  Cons ( n, delay ( fun () -> from (n+1) ) )

let ones =
  let rec mk_ones () = Cons (1, delay ( mk_ones ) )
  in mk_ones ()

let nats = from 1


let head (s: 'a stream) : 'a = match s with
  | Cons (v, _) -> v

let tail (s :'a stream) : 'a stream = match s with
  | Cons (_, tl) -> demand tl

let rec take (n: int) (s: 'a stream) : 'a list =
  match n with
  | 0 -> []
  | _ -> (match s with
          | Cons (h, t) -> h :: take (n-1) (demand t) 
         )

let rec filter (p: 'a -> bool) (s: 'a stream) : 'a stream =
  match s with
  | Cons (hd, tl) -> 
     let rest = delay (fun () -> filter p (demand tl)) in
     if p hd 
     then Cons (hd, rest)
     else demand rest

let rec map (f: 'a -> 'b) (s: 'a stream) : 'b stream =
  match s with
  | Cons (h, t) -> Cons (f h, delay (fun () -> map f (demand t)))

let rec zip (f: 'a -> 'b -> 'c) (s1: 'a stream) (s2: 'b stream) : 'c stream =
  match s1, s2 with
  | Cons (h1, t1), Cons (h2, t2) ->
     Cons (f h1 h2, delay (fun () -> zip f (demand t1) (demand t2)))



let mul_p x y =
  let () = print_endline ("multiplying " ^ string_of_int x ^ " and " ^
                            string_of_int y ^ ".")
  in x * y

let rec factorials () =
  Cons (1, delay (fun () -> zip mul_p nats (factorials ())))

let facts = factorials ()

let rec cubes_from (n: int): int stream = 
	Cons ((n * n * n), delay (fun () -> cubes_from (n + 1)))

let rec cubes_from_map (n: int): int stream =
	map (fun n -> n) (cubes_from n) 

let rec cubes_from_zip (n: int): int stream =
	zip (fun x y -> x) (cubes_from n) (cubes_from n)


let facts' = 
  let dummy = ref nats
  in
  let factorial = Cons (1, delay (fun () -> zip mul_p nats ( ! dummy )))
  in
  let () = dummy := factorial
  in
  factorial


let helper f x = not (f x)
let multiple a b = b mod a = 0

let sift (a: int) (b: int stream): int stream = filter (helper (multiple a))b

let rec sieve (n: int stream): int stream = 
	match n with
	 |Cons (x,xs) -> Cons (x, delay(fun () -> sieve (sift x (demand xs))))

let primes = sieve (from 2)
end
