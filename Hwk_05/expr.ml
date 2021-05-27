(*Hwk 05.  Extend the construts below as specified.*)

type value 
  = Int of int
  | Bool of bool
  | Closure of string * expr * value_environment
  | Ref of expr

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

and typ = Int_type 
        | Bool_type
        | Func_type of typ * typ

type type_environment = (string * typ option) list 


(* Part 1. Complete unparse *)

let rec unparse (e: expr) : string =
  match e with
  
  |Add (x1,x2) -> "(" ^ unparse x1 ^ " + " ^ unparse x2 ^ ")"
  |Sub (x1,x2) -> "(" ^ unparse x1 ^ " - " ^ unparse x2 ^ ")"
  |Mul (x1,x2) -> "(" ^ unparse x1 ^ " * " ^ unparse x2 ^ ")"
  |Div (x1,x2) -> "(" ^ unparse x1 ^ " / " ^ unparse x2 ^ ")"
  
  |Lt  (y1,y2) -> "(" ^ unparse y1 ^ " < " ^ unparse y2 ^ ")"
  |Eq  (y1,y2) -> "(" ^ unparse y1 ^ " = " ^ unparse y2 ^ ")"
  |And (y1,y2) -> "(" ^ unparse y1 ^ " && " ^ unparse y2 ^ ")"
  |Not n -> "( ~ " ^ unparse n ^ ")"
  
  |Let (z,t,z1,z2) -> "(let " ^ z ^ " = " ^ unparse z1 ^ " in " ^ unparse z2 ^ ")"
  |Id z -> z
  
  |App (a1,a2) -> "(" ^ unparse a1 ^ " " ^ unparse a2 ^ ")"
  |Lam (a,t,a1) -> "(fun " ^ a ^ " -> " ^ unparse a1 ^ ")"
  
  |LetRec (b,t,b1, b2) -> "(let " ^ b ^ " = " ^ unparse b1 ^ " in " ^ unparse b2 ^ ")"
  |If (b,b1,b2) -> "( if " ^ unparse b ^ " then " ^ unparse b1 ^ ", else " ^ unparse b2 ^ ")"
  
  | Val (Int i) -> string_of_int i
  | Val (Bool b) -> string_of_bool b
  | _ -> failwith "complete this function"


(* Part 2. Complete freevars *) 
      
let rec freevars (e: expr) : string list =
  match e with
  |Val _ -> []  
  |Add (a,b) |Sub (a,b) |Mul (a,b) |Div (a,b) |Lt (a,b) |Eq (a,b) |And (a,b) -> freevars a @ freevars b
  |Not a -> freevars a
  |Let (a,t,dexpr,body) -> freevars dexpr @ (List.filter (fun b -> a <> b) (freevars body))
  |Id x -> [x]
  |App (a,b) -> freevars a @ freevars b
  |Lam (a,t,dexpr) -> (List.filter (fun b -> a <> b) (freevars dexpr))
  |LetRec (a,t,dexpr,body) -> freevars body @ (List.filter (fun b -> a <> b) (freevars dexpr))
  |If(a,b,c) -> freevars a @ freevars b @ freevars c
  (*| _ -> failwith "complete this function"*)
  

(* Part 4. Evaluation *)

let rec lookup (v: string) (env: value_environment): value = match env with
		|[] -> raise (Failure "incompatible")
		|(v',v1)::_ when v' = v  -> v1
		|_::rest -> lookup v rest

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
       | _ -> raise (Failure "incompatible types, Eq")
     )
  | And (e1,e2) ->
     ( match eval env e1, eval env e2 with
       | Bool v1, Bool v2 -> Bool (v1 && v2)
       | _ -> raise (Failure "incompatible types, And")
     )
  | Not e1 ->
     ( match eval env e1 with
       | Bool true -> Bool false
       | Bool false -> Bool true
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
       | Bool true -> eval env e2
       | Bool false -> eval env e3
       | _ -> raise (Failure "incompatible types, If")
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

