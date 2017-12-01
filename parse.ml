type command = {
	verb: string
	coordinate: string
}

let parse str = 
	let str' = String.lowercase_ascii str in 
	match str' with 
	| "help" -> {"help"; ""}
	| "quit" -> {"quit"; ""}
	| "restart" -> {"restart"; ""}
	| "score" -> {"score"; ""}
	| "place (" ^ x ^ "," ^ y ^")" -> {"place"; x^y}
	| _ -> failwith "Invalid command"