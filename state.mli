open Board
open Parse

(* [state] is the type representing the current state of the game. This includes
 * data for the current player, the representation of the board, and the score
 * of each player *)
type state {
	current_player: int
	game_board: board
	score: (int*int)
}

(* [update st cmd] is the new state after [cmd] has been applied *)
val update : state -> command -> state