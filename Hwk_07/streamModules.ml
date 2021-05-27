open LazeeModules

module type StreamSig = sig
  type 'a lazee
  val delay: (unit -> 'a) -> 'a lazee
  val demand: 'a lazee -> 'a 

  type 'a t = Cons of 'a * 'a t lazee

  val head : 'a t -> 'a
  val tail : 'a t -> 'a t
  val take : int -> 'a t -> 'a list
  val filter : ('a -> bool) -> 'a t -> 'a t
  val map : ('a -> 'b) -> 'a t -> 'b t
  val zip : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t
  
end

module Stream (L: LazeeSig) : StreamSig = struct
  type 'a lazee = 'a L.t
  let delay = L.delay
  let demand = L.demand
  
  type 'a t = Cons of 'a * 'a t lazee
  
  let head x = match x with
  	|Cons (h, _) -> h
  let tail x = match x with
  	|Cons (_, t) -> L.demand t
  let rec take n s =
  	match n, s with
  		|0, _ -> []
  		|_, Cons (v,t) -> v :: take (n-1) (L.demand t)
  let rec filter (p: 'a -> bool) (s: 'a t): 'a t =
  	match s with
  		|Cons (h,t) ->
  		  let rest = L.delay (fun () -> filter p (L.demand t)) in
  		   if p h then Cons (h, rest) else L.demand rest
  let rec map (f: 'a -> 'b) (x: 'a t) : 'b t =
  	match x with
  		|Cons (h,t) -> 
  		  Cons (f h, L.delay (fun () -> map f (L.demand t)))
  let rec zip (f: 'a -> 'b -> 'c) (x1: 'a t) (x2: 'b t): 'c t =
  	match x1, x2 with
  		|Cons (h,t), Cons (h1,t1) -> 
  		  Cons (f h h1, L.delay (fun () -> zip f (L.demand t) (L.demand t1)))

end

module Stream_Lazy = Stream(Lazee_v1)
module Stream_Slow = Stream(Lazee_v2)

