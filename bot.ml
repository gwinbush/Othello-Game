open Board
open State

let opponent i =
  match i with
  | 1 -> 2
  | 2 -> 1

let hueristic m st =
  let new_state = update st {verb="place"; coordinate = m} in
  let (pl,op) = st.score in
  pl-op


let rec get_values moves lst st =
  match moves with
  | [] -> lst
  | h::t -> get_values t ((hueristic h) :: lst) st

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
