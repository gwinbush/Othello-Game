open Board
open State

let opponent i =
  match i with
  | 1 -> 2
  | 2 -> 1

(* [hueristic m st] is the heuristic evaluation of the current state.
 * It is equal to the number of the player's pieces subtracted by the
 * number of the opponent's pieces.
*)
let hueristic m st =
  let new_state = update st {verb="place"; coordinate = m} in
  let (pl,op) = st.score in
  pl-op

(* [get_values moves lst st] is the list of the heuristic evaluations
 * of all the possible moves for the current player in the current state.
*)
let rec get_values moves lst st =
  match moves with
  | [] -> lst
  | h::t -> get_values t ((hueristic h) :: lst) st

(* [get_max_index lst index n] is the index of [lst] at which the highest
 * value in [lst] occurs.
*)
let rec get_max_index lst index n =
  try
    if (List.nth lst n) > (List.nth lst index) then get_max_index lst n (n+1)
    else get_max_index lst index (n+1)
with _ -> index

let get_move state =
  let moves = possible_moves state.game_board state.current_player in
  let move_values = get_values moves [] state in
  let max_index = get_max_index move_values 0 0 in
  let move = List.nth moves max_index in
  {player = state.current_player; coordinate = move}

(* [alpha_beta_heuristic st] is the heuristic evaluation of the current state.
 * It is equal to the number of the player's pieces subtracted by the
 * number of the opponent's pieces.
*)
let alpha_beta_heuristic st =
  let (pl,op) = st.score in
  pl-op

(* [alpha_beta st d a b is_max moves] is an integer that represents
 * the heuristic evaluation of a move. This is our implementation of the
 * minimax algorithm with alpha-beta pruning.
*)
let rec alpha_beta st d a b is_max moves =
  if d = 0 then alpha_beta_heuristic st
  else
  match moves with
    | [] -> alpha_beta_heuristic st
    | h::t ->
  		if is_max then
  		let v = min_int in
  		let new_state = update st {verb="place"; coordinate = h} in
    let z = alpha_beta new_state (d-1) a b false
        (possible_moves new_state.game_board new_state.current_player) in
  		let l = max v z in
  		let a' = max a l in
  		if b <= a' then l
      else alpha_beta st d a b is_max t
      else
      let v = max_int in
      let new_state = update st {verb="place"; coordinate = h} in
      let z = alpha_beta new_state (d-1) a b false
          (possible_moves new_state.game_board new_state.current_player) in
      let l = min v z in
      let b' = min b l in
      if b' <= a then l
      else alpha_beta st d a b is_max t

(* [alpha_beta st d a b is_max moves] is an integer that represents
 * the heuristic evaluation of a move. This is our implementation of the
 * minimax algorithm with alpha-beta pruning.
*)
let rec alpha_beta_values moves lst st =
  match moves with
  | [] -> lst
  | h::t ->
    alpha_beta_values t ((alpha_beta st 2 min_int max_int true moves) :: lst) st

(* [alpha_beta_values moves lst st] is the list of the heuristic evaluations
 * of all the possible moves for the current player in the current state using
 * alpha-beta pruning.
*)
let get_alpha_beta_move state =
  let moves = possible_moves state.game_board state.current_player in
  let move_values = alpha_beta_values moves [] state in
  let max_index = get_max_index move_values 0 0 in
  let move = List.nth moves max_index in
  {player = state.current_player; coordinate = move}

let get_easy_ai_move state =
  let moves = possible_moves state.game_board state.current_player in
  let rand_int = Random.int ((List.length moves)-1) in
  let move = List.nth moves rand_int in
                                {player = state.current_player; coordinate = move}
