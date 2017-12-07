1) Install gtk+ and lablgtk

TO RUN THE GUI
i) Compile with the following commands from the project directory
    ocamlc parse.mli
    ocamlc parse.ml -o parse
    ocamlc board.mli
    ocamlc board.ml -o board
    ocamlc state.mli
    ocamlc board.cmo state.ml -o state
    ocamlc bot.mli
    ocamlc board.cmo state.cmo bot.ml -o bot
    ocamlfind ocamlc board.cmo state.cmo bot.cmo -g -package lablgtk2
      -linkpkg display.ml -o display

ii) Run with ./display


TO RUN THE COMMAND LINE INTERFACE
i) If you run the CLUI after compiling the GUI, you first need to remove some .cmo files.
    Do this using the following commands:
    rm -f board.cmi
    rm -f board.cmo
    rm -f bot.cmi
    rm -f bot.cmo
    rm -f display.cmi
    rm -f display.cmo
    rm -f parse.cmi
    rm -f parse.cmo
    rm -f state.cmi
    rm -f state.cmo

ii) Next, run the following commands to compile and run main.ml:
    ocamlbuild -use-ocamlfind main.byte
    ./main.byte
    
iii) Use the commands described in the design document to play the game
