(* [command] represents a command that the user inputs as text*)
type command = {
	verb: string
	coordinate: string
}

(* [parse str] is the command that represents the user input. 
 * requires: [str] is a valid user command as defined in our write-up *)
val parse : string -> command