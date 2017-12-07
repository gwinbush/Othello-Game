open Board
open Parse

type state = {
  current_player: int;
  game_board: Board.board;
  score: (int*int);
}

(* [update_player curr_player] is the player whose turn is next.
 *)
let update_player curr_player =
  match curr_player with
  | 1 -> 2
  | 2 -> 1
  | _ -> failwith "shouldn't be here"


(* [get_board state] is the board in [state].
 *)
let get_board state =
  match state with
  | {game_board=b; current_player= _; score = _} -> b

(* [get_coord cmnd] is the coordinate of [cmnd]
 *)
let get_coord cmnd =
  match cmnd with
  | {verb=_; coordinate = coor} -> coor

(* [do_move coor plyr board] is (updated board, true) if the [coor] is
 * valid with [plyr] and is ([board], false) if the move is not valid.
 *)
let do_move coor plyr board =
  let move = {player = plyr; coordinate = coor} in
    if (Board.valid_move board move)
    then ((Board.update board move), true)
    else (board, false)

(* [update old_state cmnd] is the new state after [cmnd] is executed with
 * [state]. If the move is invalid, the state is left unchanged.
 *)
let update old_state cmnd =
  match old_state with
  | {current_player=cp;game_board=board; score = scr} ->
      begin
        let (updated_board, check) =
          do_move (get_coord cmnd) cp board in
            if check
            then {current_player=update_player cp;
                  game_board = updated_board;
                  score = (Board.get_score updated_board)}
            else {current_player=cp;game_board=board; score = scr}
      end
