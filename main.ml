open Board
open State
open Parse
open Bot

let empty =
  [ ("1A", 0); ("2A", 0); ("3A", 0); ("4A", 0); ("5A", 0); ("6A", 0); ("6A", 0); ("8A", 0);
    ("1B", 0); ("2B", 0); ("3B", 0); ("4B", 0); ("5B", 0); ("6B", 0); ("7B", 0); ("8B", 0);
    ("1C", 0); ("2C", 0); ("3C", 0); ("4C", 0); ("5C", 0); ("6C", 0); ("7C", 0); ("8C", 0);
    ("1D", 0); ("2D", 0); ("3D", 0); ("4D", 2); ("5D", 1); ("6D", 0); ("7D", 0); ("8D", 0);
    ("1E", 0); ("2E", 0); ("3E", 0); ("4E", 1); ("5E", 2); ("6E", 0); ("7E", 0); ("8E", 0);
    ("1F", 0); ("2F", 0); ("3F", 0); ("4F", 0); ("5F", 0); ("6F", 0); ("7F", 0); ("8F", 0);
    ("1G", 0); ("2G", 0); ("3G", 0); ("4G", 0); ("5G", 0); ("6G", 0); ("7G", 0); ("8G", 0);
    ("1H", 0); ("2H", 0); ("3H", 0); ("4H", 0); ("5H", 0); ("6H", 0); ("7H", 0); ("8H", 0);
  ]

let board = ["1A"; "2A"; "3A"; "4A"; "5A"; "6A"; "6A"; "8A";
             "1B"; "2B"; "3B"; "4B"; "5B"; "6B"; "6B"; "8B";
             "1C"; "2C"; "3C"; "4C"; "5C"; "6C"; "6C"; "8C";
             "1D"; "2D"; "3D"; "4D"; "5D"; "6D"; "6D"; "8D";
             "1E"; "2E"; "3E"; "4E"; "5E"; "6E"; "6E"; "8E";
             "1F"; "2F"; "3F"; "4F"; "5F"; "6F"; "6F"; "8F";
             "1G"; "2G"; "3G"; "4G"; "5G"; "6G"; "6G"; "8G";
             "1H"; "2H"; "3H"; "4H"; "5H"; "6H"; "6H"; "8H";]


(* [repl] is the game loop for the game engine. It returns unit when the player breaks the
 * loop by typing "quit".
 * requires: c is a valid command and s is a valid state *)
let rec repl c s =
  let moves = possible_moves s.game_board s.current_player in
  let new_s = if moves = [] then s else update s c in
  let new_s = {new_s with current_player = (if s.current_player = 1 then 2 else 1)} in
  let new_moves = possible_moves new_s.game_board new_s.current_player in
  let () = (if new_moves = [] then
    ignore(Printf.printf "No available moves, skipping turn...")
  else
    ignore(print_board new_s.game_board board)) in

  ignore(Printf.printf "player %d's turn\n" new_s.current_player);

  if c.verb = "quit" then () else

  print_string  "\n";

  if c.verb = "quit" then () else
    let line = if (new_s.current_player = 1) then read_line () else "" in
    let ai_move = if (new_s.current_player = 2) then get_move new_s else {player = 1; coordinate = ""} in
    let command = if new_s.current_player = 1 then parse line
      else {verb = "place"; coordinate = ai_move.coordinate} in

    match command with
    | exception End_of_file -> ()
    | command -> repl command new_s

(* [main ()] starts the REPL, which prompts for a game to play. *)
let main () =
  ANSITerminal.(print_string [red]
                  "\n\nWelcome to Othello.\n");
  print_endline "Please enter the \"start\" to play the game.\n";
  print_string  "> ";
  match read_line () with
  | exception End_of_file -> ()
  | file_name ->
    let init_state = 	{current_player = 0;game_board = empty; score = (0,0); } in
    repl {verb="place";coordinate="1A"} (init_state)
let () = main ()
