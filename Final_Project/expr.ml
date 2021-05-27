(*Hwk 05.  Extend the construts below as specified.*)
(*Some functions have been taken from sample programs of Eric Van Wyk in public repo and modified*)

type value 
  = Int of int
  | Bool of bool
  | Closure of string * expr * value_environment
  | Ref of expr
  | PairV of value * value
  | ListV of value list

and value_environment = (string * value) list
                               
and expr 
  = Val of value

  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr 

  | Lt  of expr * expr
  | Eq  of expr * expr
  | And of expr * expr
  | Not of expr

  | Let of string * typ * expr * expr
  | Id  of string

  | App of expr * expr
  | Lam of string * typ * expr

  | LetRec of string * typ * expr * expr
  | If of expr * expr * expr
  
  | Pair of expr * expr
  | Fst of expr
  | Snd of expr
  
  | Nil
  | Cons of expr * expr
  | Head of expr
  | Tail of expr

and typ = Int_type 
        | Bool_type
        | Func_type of typ * typ
        | Pair_type of typ * typ
        | List_type of typ
        | Nil_type 

type type_environment = (string * typ option) list 

let rec check (x: typ) : string =
  match x with
  | Int_type -> ("int")
  | Bool_type -> ("bool")
  | Func_type (x1, x2) -> "(" ^ check x1 ^ " -> " ^ check x2 ^ ")"
  | Pair_type (x1, x2) -> "(" ^ check x1 ^ " * " ^ check x2 ^ ")"
  | List_type x1 -> "(" ^ check x1 ^ " list)"
  | Nil_type -> ("list")

(* Part 1. Complete unparse *)

let rec unparse (e: expr) : string =
  match e with
  
  | Add (x1,x2) -> "(" ^ unparse x1 ^ " + " ^ unparse x2 ^ ")"
  | Sub (x1,x2) -> "(" ^ unparse x1 ^ " - " ^ unparse x2 ^ ")"
  | Mul (x1,x2) -> "(" ^ unparse x1 ^ " * " ^ unparse x2 ^ ")"
  | Div (x1,x2) -> "(" ^ unparse x1 ^ " / " ^ unparse x2 ^ ")"
  
  | Lt  (y1,y2) -> "(" ^ unparse y1 ^ " < " ^ unparse y2 ^ ")"
  | Eq  (y1,y2) -> "(" ^ unparse y1 ^ " = " ^ unparse y2 ^ ")"
  | And (y1,y2) -> "(" ^ unparse y1 ^ " && " ^ unparse y2 ^ ")"
  | Not n -> "( ~ " ^ unparse n ^ ")"
  
  | Let (z,t,z1,z2) -> "(let " ^ z ^ " : " ^ check t ^ " = " ^ unparse z1 ^ " in " ^ unparse z2 ^ ")"
  | Id z -> z
  
  | App (a1,a2) -> "(" ^ unparse a1 ^ " " ^ unparse a2 ^ ")"
  | Lam (a,t,a1) -> "(fun ( " ^ a ^ " : " ^ (check t) ^ ")" ^ " -> " ^ unparse a1 ^ ")"
  
  | LetRec (b,t,b1, b2) -> "(let rec " ^ b ^ " : " ^ (check t) ^ " = " ^ unparse b1 ^ " in " ^ unparse b2 ^ ")" 
  | If (b,b1,b2) -> "( if " ^ unparse b ^ " then " ^ unparse b1 ^ " else " ^ unparse b2 ^ ")"
  
  | Pair (p1, p2) -> "(" ^ unparse p1 ^ " , " ^ unparse p2 ^ ")"
  | Fst f -> "(fst " ^ unparse f ^ ")"
  | Snd s -> "(snd " ^ unparse s ^ ")"
  
  | Nil -> "[]"
  | Cons (c1,c2) -> "(" ^ unparse c1 ^ " :: " ^ unparse c2 ^ ")"
  | Head h -> "(List.hd " ^ "(" ^ unparse h ^ "))" 
  | Tail t -> "(List.tl " ^ "(" ^ unparse t ^ "))"

(* Part 2. Complete freevars *) 
      
let rec freevars (e: expr) : string list =
  match e with
  
  | Val _ -> []  
  | Add (a,b) |Sub (a,b) |Mul (a,b) |Div (a,b) |Lt (a,b) |Eq (a,b) |And (a,b) |App (a,b) |Pair (a,b) |Cons (a,b) -> freevars a @ freevars b
  | Not a -> freevars a
  | Let (a,t,dexpr,body) -> freevars dexpr @ (List.filter (fun b -> a <> b) (freevars body))
  | Id x -> [x]
  | Lam (a,t,dexpr) -> (List.filter (fun b -> a <> b) (freevars dexpr))
  | LetRec (a,t,dexpr,body) ->  List.filter (fun b -> a <> b) (freevars dexpr @ (freevars body))
  | If(a,b,c) -> freevars a @ freevars b @ freevars c
  | Fst x | Snd x | Head x | Tail x -> freevars x
  | Nil -> []

(* Part 3. Type checking *)           
type result = OK of typ
            | Errs of (expr * string) list

let type_int (a: result) (b: expr): (expr * string) list =
  match a with
  | OK Int_type -> []
  | OK Bool_type -> [(b, "int bool")]
  | Errs errs -> errs

let type_bool (a: result) (b: expr): (expr * string) list = 
  match a with
  | OK Bool_type -> []
  | OK Int_type -> [(b, "bool int")]
  | Errs errs -> errs

let rec lookup_type (v: string) (env: type_environment): result =
  match env with
  | [] -> Errs ([(Id v, "not bounded identifier")])
  | (x, Some y):: xs -> if v = x then OK y else lookup_type v xs

let rec type_check (e:expr) (env: type_environment) : result =
  match e with
  | Val (Int _) -> OK Int_type
  | Val (Bool _) -> OK Bool_type
  | Add (a,b) | Sub (a,b) | Mul (a,b) | Div (a,b) -> (
     match type_check a env, type_check b env with
     | OK Int_type, OK Int_type -> OK Int_type
     | h,t -> Errs (type_int h a @ type_int t b)
    )
  | Lt (a,b) | Eq (a,b) -> (
     match type_check a env, type_check b env with
     | OK Int_type, OK Int_type -> OK Bool_type
     | OK (List_type lt), OK (List_type tl) -> OK Bool_type
     | h,t -> Errs (type_int h a @ type_bool t b)
    )
  | And (a,b) -> (
     match type_check a env, type_check b env with
     | OK Bool_type, OK Bool_type -> OK Bool_type
     | h,t -> Errs (type_bool h a @ type_bool t b)
    )
  | Not a -> (
     match type_check a env with
     | OK Bool_type -> OK Bool_type
     | h -> Errs (type_bool h a)
    )
  | Let (a,t,e1,e2) -> 
     let t1 = type_check e1 env
     in
     ( match t1 with
       |Errs errs -> Errs errs
       |OK y -> if y = t then type_check e2 ((a, Some t)::env) else Errs [(Let (a,t,e1,e2), "expression errors")]
     )
  | Id x -> lookup_type x env
  | App (a,b) -> (
     match type_check a env with
      | Errs errs -> Errs errs
      | OK Func_type (m,n) -> ( match type_check b env with 
                                | OK i -> if m = i then OK n else Errs [(App (a,b), "mismatch")]
                                | Errs errs -> Errs errs
                               )
      | OK l -> raise (Failure "out of bounds")
     )
  | Lam (a,t,b) -> (
     let x = type_check b ((a, Some t):: env)
     in
     match x with
     | Errs errs -> Errs errs
     | OK t1 -> OK (Func_type (t,t1))
    )
  | LetRec (a,t,b,c) -> (
     let x = type_check b ((a, Some t):: env)
     in
     match x with
     | Errs errs -> Errs errs
     | OK tl -> if tl = t then type_check c ((a, Some t) :: env) else Errs [(LetRec (a,t,b,c), "mismatching of type")]
    )
  | If (a,b,c) -> (
     match type_check a env with
     | Errs errs -> Errs errs
     | OK Bool_type -> (match type_check b env, type_check c env with
                        | Errs x, Errs y -> Errs (x @ y)
                        | OK t, OK t1 -> if t = t1 then OK t else Errs [(If (a,b,c), "mistached types")]
                        | Errs t, OK t1 -> Errs t
                        | OK t, Errs t1 -> Errs t1 
                       )
     | OK t -> Errs [(a, "bool type was expected")]
    )
  | Pair (a,b) -> (
     match type_check a env, type_check b env with
      | Errs errs, _ ->  Errs [Pair (a,b), "pair expected"]
      | OK t1, OK t2 -> OK (Pair_type (t1,t2))
      | _, Errs errs -> Errs [Pair (a,b), "pair expected"]
     )
  | Fst f -> (
     match type_check f env with
     | Errs errs -> Errs errs
     | OK Pair_type (t1,t2) -> OK t1
     | _ -> Errs [(Fst f, "wont work")]
    )
  | Snd s -> (
    match type_check s env with
    | Errs errs -> Errs errs
    | OK Pair_type (t1,t2) -> OK t2
    | _ -> Errs [(Snd s, "pair expected")]
   ) 
  | Nil -> OK (List_type Nil_type)
  | Cons (a,b) -> (
     match type_check a env, type_check b env with
     | OK t1, OK (List_type t2) -> if t1 = t2 || t2 = Nil_type then OK (List_type t1) else Errs [(e, "error")]
     | OK t1, OK t2 -> Errs [(e, "will not work")]
     | Errs a, _ -> Errs a
     | _, Errs b -> Errs b
    )
  | Head h -> ( 
    match type_check h env with
    | Errs errs -> Errs errs
    | OK (List_type t) -> OK t
    | _ -> Errs [(h, "error")] 
   )  
  | Tail t -> (
     match type_check t env with
     | Errs errs -> Errs errs
     | OK (List_type t) -> OK (List_type t)
     | _ -> Errs [(t, "error")]
    )
                           
let check e = type_check e [] 

(* Part 4. Evaluation *)

let rec lookup (v: string) (env: value_environment): value = match env with
		|[] -> raise (Failure "incompatible")
		|(x,y)::xs -> if v = x then y else lookup v xs

let rec eval (env: value_environment) (e:expr) : value =
  match e with
  | Val v -> v
  | Add (e1, e2) ->
     ( match eval env e1, eval env e2 with
       | Int v1, Int v2 -> Int (v1 + v2)
       | _ -> raise (Failure "incompatible types, Add")
     )
  | Sub (e1,e2) ->
     ( match eval env e1, eval env e2 with
       | Int v1, Int v2 -> Int (v1 + v2)
       | _ -> raise (Failure "incompatible types, Sub")
     )
  | Mul (e1,e2) ->
     ( match eval env e1, eval env e2 with
        |Int v1, Int v2 -> Int (v1 * v2)
        | _ -> raise (Failure "incompatible types, Mul")
     )
  | Div (e1,e2) ->
     ( match eval env e1, eval env e2 with
       | Int v1, Int v2 -> Int (v1 / v2)
       | _ -> raise (Failure "incompatible types, Div")
     )
  | Lt (e1,e2) ->
     ( match eval env e1, eval env e2 with
       | Int v1, Int v2 -> Bool (v1 < v2)
       | _ -> raise (Failure "incompatible types, Lt")
     )
  | Eq (e1,e2) ->
     ( match eval env e1, eval env e2 with
       | Int v1, Int v2 -> Bool (v1 = v2)
       | Bool v1, Bool v2 -> Bool (v1 = v2)
       | PairV (v1,v2), PairV (v3,v4) -> Bool (v1 = v3 && v2 = v4)
       | ListV v1, ListV v2 -> Bool (v1 = v2)
       | _ -> raise (Failure "incompatible types, Eq")
     )
  | And (e1,e2) ->
     ( match eval env e1, eval env e2 with
       | Bool v1, Bool v2 -> Bool (v1 && v2)
       | _ -> raise (Failure "incompatible types, And")
     )
  | Not e1 ->
     ( match eval env e1 with
       | Bool n -> Bool (not n)
       | _ -> raise (Failure "incompatible types, Not")
     )
  | Let (n, t, dexpr, body) -> let v = eval env dexpr in eval ( (n,v)::env ) body
  | Id n -> lookup n env
  | App (e1,e2) -> 
     ( match eval env e1 with
       | Closure (n,n1,n2) -> eval ((n,eval env e2)::n2)n1
       | Ref n -> eval env (App (n,e2))
       | _ -> raise (Failure "incompatible types, App")
      )
  | Lam (n, t, dexpr) -> Closure (n,dexpr,env)
  | LetRec (f, t, dexpr, body) -> 
     ( match dexpr with 
       |Lam (n, t, fbody) -> eval((n,eval((n, Ref fbody)::env)fbody)::env)body
       |_ -> raise (Failure "let rec expressions must declare a function")
     )
  | If (e1,e2,e3) -> 
     ( match eval env e1 with
       | Bool n -> if n = true then eval env e2 else eval env e3
       | _ -> raise (Failure "incompatible types, If")
     )
  | Pair (e1,e2) -> PairV (eval env e1, eval env e2)
  | Fst e1 -> 
    ( match eval env e1 with
      | PairV (x, _) -> x
      | _ -> raise (Failure "incompatible type, Fst")
    )
  | Snd e1 -> 
    ( match eval env e1 with
      | PairV (_,x) -> x
      | _ -> raise (Failure "incompatible type, Snd")
    )
  | Head e1 -> 
    (match eval env e1 with
     | ListV (h::t) -> h
     | _ -> raise (Failure "incompatible type, Head")
    )
  | Tail e1 ->
    (match eval env e1 with 
     | ListV (h::t) -> ListV t
     | _ -> raise (Failure "incompatible type, Tail")
    )
  | Nil -> ListV []
  | Cons (e1,e2) -> (match eval env e1, eval env e2 with
                     | h, ListV t -> ListV (h::t)
                     | _ -> raise (Failure "incompatible types, Cons")
                    )
  
let evaluate e = eval [] e

let inc = Lam ("n", Int_type, Add(Id "n", Val (Int 1)))
let add = Lam ("x", Int_type, Lam("y", Int_type, Add(Id "x", Id "y")))

(* some sample expressions *)

let e1 = Add (Val (Int 3), Val (Int 5))
let e2 = Add (Val (Int 3), Val (Bool true))
let e3 = Mul (Val (Bool true), Val (Int 5))
let e4 = Add (e2, e3)

let e5 = Let ("x", Int_type, Add (Val (Int 3), Val (Int 4)),
              Add (Id "x", Val (Int 5))
           )
       
let e6 = Let ("x", Int_type, Add (Val (Int 3), Val (Int 4)),
              Lt (Id "x", Val (Int 5))
           )
       
(* ``let x = 3 < 5 in x && let x = 1 + 2 in x = 3 *)
let e7 = Let ("x", Bool_type,
              Lt (Val (Int 3), Val (Int 5)),
              And (Id "x",
                   Let ("x", Int_type,
                        Add (Val (Int 1), Val (Int 2)),
                        Eq (Id "x", Val (Int 3))
                       )
                  )
             )


(* ``let x = 3 < 5 in y && let x = 1 + 2 in x = 3 *)
let e8 = Let ("x", Bool_type,
              Lt (Val (Int 3), Val (Int 5)),
              And (Id "y",
                   Let ("x", Int_type,
                        Add (Val (Int 1), Val (Int 2)),
                        Eq (Id "x", Val (Int 3))
                       )
                  )
             )

let err_1 = Let ("x", Int_type, Add (Val (Int 3), Val (Int 4)),
                 And (Id "x", Val (Bool true))
              )

let err_2 = Let ("x", Int_type, Add (Id "x", Val (Int 4)),
                 And (Id "y", Val (Bool true))
              )

let inc_use = Let ("inc", Func_type (Int_type, Int_type), 
                   Lam ("n", Int_type, Add (Id "n", Val (Int 1))),
                   App (Id "inc", Val (Int 3))
                )

let sumToN : expr =
    LetRec ("sumToN", Func_type (Int_type, Int_type),
            Lam ("n", Int_type,
                 If (Eq (Id "n", Val (Int 0)),
                     Val (Int 0),
                     Add (Id "n",
                          App (Id "sumToN",
                               Sub (Id "n", Val (Int 1))
                              )
                         )
                    )
                ),
            Id "sumToN"
           )

let sumTo3 = App (sumToN, Val (Int 4))

