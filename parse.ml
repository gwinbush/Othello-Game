type command = {
	verb: string;
	coordinate: string;
}

(* [helper] is the command when the user places a tile*)
let helper str =
  let space = try String.index str ' '
    with Not_found -> -1 in
  let str_verb = try String.sub str 0 space
    with Invalid_argument "String.sub / Bytes.sub" -> str in
  let str_coordinate = try String.sub str space (String.length str - space)
    with Invalid_argument "String.sub / Bytes.sub" -> "" in
  {
    verb = str_verb;
    coordinate = String.trim str_coordinate;
  }


let parse str =
	let str' = String.lowercase_ascii str in
	match str' with
	| "quit" -> {verb = "quit";coordinate = ""}
	| _ -> helper str
