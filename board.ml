
type board = (string*int) list

type move = {
	player: int;
	coordinate: string;
}

type direction = TL|TR|BL|BR|T|B|L|R

let empty =
	[ ("1A", 0); ("2A", 0); ("3A", 0); ("4A", 0); ("5A", 0); ("6A", 0); ("7A", 0); ("8A", 0);
		("1B", 0); ("2B", 0); ("3B", 0); ("4B", 0); ("5B", 0); ("6B", 0); ("7B", 0); ("8B", 0);
		("1C", 0); ("2C", 0); ("3C", 0); ("4C", 0); ("5C", 0); ("6C", 0); ("7C", 0); ("8C", 0);
		("1D", 0); ("2D", 0); ("3D", 0); ("4D", 2); ("5D", 1); ("6D", 0); ("7D", 0); ("8D", 0);
		("1E", 0); ("2E", 0); ("3E", 0); ("4E", 1); ("5E", 2); ("6E", 0); ("7E", 0); ("8E", 0);
		("1F", 0); ("2F", 0); ("3F", 0); ("4F", 0); ("5F", 0); ("6F", 0); ("7F", 0); ("8F", 0);
		("1G", 0); ("2G", 0); ("3G", 0); ("4G", 0); ("5G", 0); ("6G", 0); ("7G", 0); ("8G", 0);
		("1H", 0); ("2H", 0); ("3H", 0); ("4H", 0); ("5H", 0); ("6H", 0); ("7H", 0); ("8H", 0);
 ]

let board = ["1A"; "2A"; "3A"; "4A"; "5A"; "6A"; "7A"; "8A";
             "1B"; "2B"; "3B"; "4B"; "5B"; "6B"; "6B"; "8B";
             "1C"; "2C"; "3C"; "4C"; "5C"; "6C"; "6C"; "8C";
             "1D"; "2D"; "3D"; "4D"; "5D"; "6D"; "6D"; "8D";
             "1E"; "2E"; "3E"; "4E"; "5E"; "6E"; "6E"; "8E";
             "1F"; "2F"; "3F"; "4F"; "5F"; "6F"; "6F"; "8F";
             "1G"; "2G"; "3G"; "4G"; "5G"; "6G"; "6G"; "8G";
             "1H"; "2H"; "3H"; "4H"; "5H"; "6H"; "6H"; "8H";]

let rec print_board board b =
  match b with
  | [] -> ()
  | h::t ->
    let piece = List.assoc h board in
    if (h.[0] = '8')
      then
        let () = ignore(Printf.printf "(%s,%d) \n" h piece) in
        print_board board t
      else
        let a = ignore(Printf.printf "(%s, %d)  " h piece) in
        print_board board t



(* [prev_letter] is the letter before [s]. *)
let prev_letter s =
	match s with
	| "A" -> failwith "off board"
	| "B" -> "A"
	| "C" -> "B"
	| "D" -> "C"
	| "E" -> "D"
	| "F" -> "E"
	| "G" -> "F"
	| "H" -> "G"
	| _ -> failwith "invalid letter"

(* [next_letter] is the letter after [s]. *)
let next_letter s =
	match s with
	| "A" -> "B"
	| "B" -> "C"
	| "C" -> "D"
	| "D" -> "E"
	| "E" -> "F"
	| "F" -> "G"
	| "G" -> "H"
	| "H" -> failwith "off board"
	| _ -> failwith "invalid letter"

(* [top_left] is the game tile in the top left diection of [str] *)
let top_left str =
    let new_num = (String.get str 0) |> Char.escaped |> Pervasives.int_of_string |> fun x -> x-1 in
    let new_letter = (String.get str 1) |> Char.escaped |> prev_letter in
    if new_num < 1 then failwith "off board"
    else (Pervasives.string_of_int new_num) ^ new_letter

(* [top_right] is the game tile in the top right diection of [str] *)
let top_right str =
  let new_num = (String.get str 0) |> Char.escaped |> Pervasives.int_of_string |> fun x -> x+1 in
  let new_letter = (String.get str 1) |> Char.escaped |> prev_letter in
  if new_num > 8 then failwith "off board"
  else (Pervasives.string_of_int new_num) ^ new_letter

(* [bot_left] is the game tile in the bottom left diection of [str] *)
let bot_left str =
  let new_num = (String.get str 0) |> Char.escaped |> Pervasives.int_of_string |> fun x -> x-1 in
  let new_letter = (String.get str 1) |> Char.escaped |> next_letter in
  if new_num < 1 then failwith "off board"
  else (Pervasives.string_of_int new_num) ^ new_letter

(* [bot_right] is the game tile in the top right diection of [str] *)
let bot_right str =
  let new_num = (String.get str 0) |> Char.escaped |> Pervasives.int_of_string |> fun x -> x+1 in
  let new_letter = (String.get str 1) |> Char.escaped |> next_letter in
  if new_num > 8 then failwith "off board"
  else (Pervasives.string_of_int new_num) ^ new_letter

(* [top] is the game tile above [str] *)
let top str =
  let new_num = (String.get str 0) |> Char.escaped in
  let new_letter = (String.get str 1) |> Char.escaped |> prev_letter in
  new_num ^ new_letter

(* [bot] is the game tile below [str] *)
let bot str =
  let new_num = (String.get str 0) |> Char.escaped in
  let new_letter = (String.get str 1) |> Char.escaped |> next_letter in
  new_num ^ new_letter

(* [left] is the game tile to the left of [str] *)
let left str =
  let new_num = (String.get str 0) |> Char.escaped |> Pervasives.int_of_string |> fun x -> x-1 in
  let new_letter = (String.get str 1) |> Char.escaped in
  if new_num < 1 then failwith "off board"
  else (Pervasives.string_of_int new_num) ^ new_letter

(* [right] is the game tile to the right of [str] *)
let right str =
  let new_num = (String.get str 0) |> Char.escaped |> Pervasives.int_of_string |> fun x -> x+1 in
  let new_letter = (String.get str 1) |> Char.escaped in
  if new_num > 8 then failwith "off board"
  else (Pervasives.string_of_int new_num) ^ new_letter

(* [opponent_value] returns the opponent of [i] *)
let opponent_value i =
  match i with
  | 1 -> 2
  | 2 -> 1
  | _ -> failwith "invalid player"

(* [check_path] is true is there exists a valid flank in the [dir] direction *)
let rec check_path dir curr b player flank =
  match dir with
  | TL -> let next = top_left curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | TR -> let next = top_right curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | BL -> let next = bot_left curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | BR -> let next = bot_right curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | T -> let next = top curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | B -> let next = bot curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | L -> let next = left curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false
  | R -> let next = right curr in
    let value = List.assoc next b in
    if value = opponent_value player then check_path dir next b player true
    else if value = player && flank then true
    else false

let valid_move b m =
  (*check that the spot is empty*)
  let v = List.assoc m.coordinate b in
  if v <> 0 then false else

  let path1 = try check_path TL m.coordinate b m.player false with _ -> false in
  let path2 = try check_path TR m.coordinate b m.player false with _ -> false in
  let path3 = try check_path BL m.coordinate b m.player false with _ -> false in
  let path4 = try check_path BR m.coordinate b m.player false with _ -> false in
  let path5 = try check_path T m.coordinate b m.player false with _ -> false in
  let path6 = try check_path B m.coordinate b m.player false with _ -> false in
  let path7 = try check_path L m.coordinate b m.player false with _ -> false in
  let path8 = try check_path R m.coordinate b m.player false with _ -> false in
  if path1 || path2 || path3 || path4 || path5 || path6 || path7 || path8
  then true else false

let not_empty lst =
  match lst with
  | [] -> false
  | _ -> true

(* [build_path] is a list containing the tiles to flip after a turn *)
let rec build_path dir curr b player lst =
  match dir with
  | TL -> let next = top_left curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | TR -> let next = top_right curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | BL -> let next = bot_left curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | BR -> let next = bot_right curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | T -> let next = top curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | B -> let next = bot curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | L -> let next = left curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []
  | R -> let next = right curr in
    let value = List.assoc next b in
    if value = opponent_value player then build_path dir next b player ((player,next)::lst)
    else if value = player then lst
    else []

let flip b a =
  let (p,c) = a in
  let temp_b = List.remove_assoc c b in
  let new_b = (c,p)::temp_b in
  new_b

let update b m =
  let valid = valid_move b m in
  if valid then
    let temp_b = List.remove_assoc m.coordinate b in
    let new_b = (m.coordinate, m.player)::temp_b in

    let path1 = try build_path TL m.coordinate b m.player [] with _ -> [] in
    let path2 = try build_path TR m.coordinate b m.player [] with _ -> [] in
    let path3 = try build_path BL m.coordinate b m.player [] with _ -> [] in
    let path4 = try build_path BR m.coordinate b m.player [] with _ -> [] in
    let path5 = try build_path T m.coordinate b m.player [] with _ -> [] in
    let path6 = try build_path B m.coordinate b m.player [] with _ -> [] in
    let path7 = try build_path L m.coordinate b m.player [] with _ -> [] in
    let path8 = try build_path R m.coordinate b m.player [] with _ -> [] in
    let flips = List.flatten [path1; path2; path3; path4; path5; path6; path7; path8] in

    List.fold_left flip new_b flips

  else
    failwith "Invalid Move"

(* [score_helper] returns the score of each player*)
let rec score_helper b (s1,s2) =
  match b with
  | [] -> (s1,s2)
  | (c, p)::t ->
    if p = 1 then score_helper t (s1+1,s2)
    else if p=2 then score_helper t (s1,s2+1)
    else score_helper t (s1,s2)

let get_score b =
  score_helper b (0,0)

(* [move_helper] returns a list containing the possible moves for player [i]*)
let rec move_helper b i lst n =
  match n with
  | 64 -> lst
  | _ ->
    let (c,p) = (List.nth b n) in
    if valid_move b {player = i; coordinate = c} then
      move_helper b i (c::lst) (n+1)
    else move_helper b i lst (n+1)

let possible_moves b i =
  move_helper b i [] 0
