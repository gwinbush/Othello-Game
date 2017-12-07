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


