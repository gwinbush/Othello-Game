open Parse

(* [board] is a type representing the Othello board. The string represents the 
 * tile coordinates and the int represents the game piece on the tile. A zero is
 * an empty tile, a one is player one's piece and a two is player two's piece. *)
type board = (string*int) list

(* [move] is a type the represents the place command. It has data for the player
 * who entered the command and the coordinate of the placement *)
type move = {
	player : int
	coordinate : (string*int)
}

(* [update] is the new board after a player has placed a piece. *)
val update : board -> move -> board

(* [valid_move b m] is true if [m] is a legal placement of the piece and false
 * otherwise *)
val valid_move : board -> move -> bool

(* [get_score] returns both players score*)
val get_score : board -> (int*int)

(* [possible_moves b i] is the list of possible moves for player [i] on the
 * board [b]. *)
val possible_moves : board -> int -> (string*int) list

