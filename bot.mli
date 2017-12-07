open Board
open State

(* [get_easy_ai_move st] returns the easy bots next move *)
val get_easy_ai_move : state -> move

(* [get_move st] returns the medium bots next move *)
val get_move : state -> move

(* [get_alpha_beta_move] returns the hard bots next move *)
val get_alpha_beta_move : state -> move
