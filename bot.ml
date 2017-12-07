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

let alpha_beta_heuristic st =
  let (pl,op) = st.score in
  pl-op

let rec alpha_beta st d a b is_max = 
  let moves = possible_moves st.game_board st.current_player in
  if d = 0 then alpha_beta_heuristic st 
  else try 
 	  for x=0 to (List.length moves)-1 do 
  		if is_max then 
  		let v = min_int in
  		let new_state = update st {verb="place"; coordinate = List.nth x} in
  		let z = alpha_beta new_state (d-1) a b false in 
  		let l = max v z in
  		let a' = max a l in 
  		if b <= a' then raise (Alpha l) else ()
      else n,bv
      let v = max_int in 
      let new_state = update st {verb="place"; coordinate = List.nth x} in
      let z = alpha_beta new_state (d-1) a b false in 
      let l = min v z
      let b' = min b l 
      if b' <= a then raise (Beta l) else ()
    done 
    with
      | Alpha l -> l
      | Beta l -> l


let rec alpha_beta_values moves lst st = 
  match moves with
  | [] -> lst
  | h::t -> 
    alpha_beta_values t ((alpha_beta st 5 min_int max_int true) :: lst) st

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