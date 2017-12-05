open GMain
open GdkKeysyms
open Board


let opp i =
  match i with
  | 1 -> 2
  | 2 -> 1

let locale = GtkMain.Main.init ()

let get_tile i =
  match i with
  | 0 -> "empty_tile.xpm"
  | 1 -> "p1.xpm"
  | 2 -> "p2.xpm"

let xpm_label_box ~file ~packing () =
  if not (Sys.file_exists file) then failwith (file ^ " does not exist");

  (* Create box for image and labprerr_endline "Ouch!");el and pack *)
  let box = GPack.hbox ~border_width:2 ~packing () in

  (* Now on to the image stuff and pack into box *)
  let pixmap = GDraw.pixmap_from_xpm ~file () in
  GMisc.pixmap pixmap ~packing:(box#pack ~padding:3) ();

  (* Create a label for the button and pack into box *)
  GMisc.label ~packing:(box#pack ~padding:3) ()

let rec main () =
  let window = GWindow.window ~width:960 ~height:960
    ~title: "Tile" ~resizable:false () in

  let vbox = GPack.vbox ~packing:window#add ~border_width:10 () in
  ignore (window#connect#destroy ~callback:Main.quit);

  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "Menu" in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  ignore (factory#add_item "Quit" ~key:_Q ~callback: Main.quit);

  let factory = new GMenu.factory file_menu ~accel_group in
  ignore (factory#add_item "Restart" ~key:_R ~callback: Main.quit);



  let sub_box1 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box2 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box3 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box4 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box5 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box6 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box7 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box8 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sboxs = [sub_box1; sub_box2; sub_box3; sub_box4; sub_box5; sub_box6; sub_box7; sub_box8] in

  let empty =
                [ ("1A", 0); ("2A", 0); ("3A", 0); ("4A", 0); ("5A", 0); ("6A", 0); ("7A", 0); ("8A", 0);
                  ("1B", 0); ("2B", 0); ("3B", 0); ("4B", 0); ("5B", 0); ("6B", 0); ("7B", 0); ("8B", 0);
                  ("1C", 0); ("2C", 0); ("3C", 0); ("4C", 0); ("5C", 0); ("6C", 0); ("7C", 0); ("8C", 0);
                  ("1D", 0); ("2D", 0); ("3D", 0); ("4D", 2); ("5D", 1); ("6D", 0); ("7D", 0); ("8D", 0);
                  ("1E", 0); ("2E", 0); ("3E", 0); ("4E", 1); ("5E", 2); ("6E", 0); ("7E", 0); ("8E", 0);
                  ("1F", 0); ("2F", 0); ("3F", 0); ("4F", 0); ("5F", 0); ("6F", 0); ("7F", 0); ("8F", 0);
                  ("1G", 0); ("2G", 0); ("3G", 0); ("4G", 0); ("5G", 0); ("6G", 0); ("7G", 0); ("8G", 0);
                  ("1H", 0); ("2H", 0); ("3H", 0); ("4H", 0); ("5H", 0); ("6H", 0); ("7H", 0); ("8H", 0);
                ] in


  draw sboxs vbox empty 1;
  window#show ();

  Main.main ()

and draw sboxs vbox board pl =
  List.map (fun x -> x#destroy ()) sboxs;

  let sub_box1 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box2 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box3 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box4 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box5 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box6 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box7 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sub_box8 = GPack.hbox ~packing:vbox#add ~width:800 ~height:100 () in
  let sboxs = [sub_box1; sub_box2; sub_box3; sub_box4; sub_box5; sub_box6; sub_box7; sub_box8] in

  let game_board = board in

  let box_r1c1 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c1 = GButton.button ~packing:box_r1c1#add () in
  r1c1#connect#clicked ~callback: (fun () ->
      let m = {player = pl;
              coordinate = "1A"} in
      let new_board = update game_board m in
      draw sboxs vbox new_board (opp pl)
    );


  let box_r1c2 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c2 = GButton.button ~packing:box_r1c2#add () in
  r1c2#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "2A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r1c3 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c3 = GButton.button ~packing:box_r1c3#add () in
  r1c3#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "3A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r1c4 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c4 = GButton.button ~packing:box_r1c4#add () in
  r1c4#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "4A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r1c5 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c5 = GButton.button ~packing:box_r1c5#add () in
  r1c5#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "5A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r1c6 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c6 = GButton.button ~packing:box_r1c6#add () in
  r1c6#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "6A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r1c7 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c7 = GButton.button ~packing:box_r1c7#add () in
  r1c7#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "7A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r1c8 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c8 = GButton.button ~packing:box_r1c8#add () in
  r1c8#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "8A"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c1 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c1 = GButton.button ~packing:box_r2c1#add () in
  r2c1#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "1B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c2 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c2 = GButton.button ~packing:box_r2c2#add () in
  r2c2#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "2B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c3 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c3 = GButton.button ~packing:box_r2c3#add () in
  r1c3#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "3B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c4 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c4 = GButton.button ~packing:box_r2c4#add () in
  r2c4#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "4B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c5 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c5 = GButton.button ~packing:box_r2c5#add () in
  r1c5#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "5B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c6 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c6 = GButton.button ~packing:box_r2c6#add () in
  r2c6#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "6B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c7 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c7 = GButton.button ~packing:box_r2c7#add () in
  r2c7#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "7B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r2c8 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c8 = GButton.button ~packing:box_r2c8#add () in
  r2c8#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "8B"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c1 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c1 = GButton.button ~packing:box_r3c1#add () in
  r3c1#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "1C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c2 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c2 = GButton.button ~packing:box_r3c2#add () in
  r3c2#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "2C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c3 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c3 = GButton.button ~packing:box_r3c3#add () in
  r3c3#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "3C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c4 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c4 = GButton.button ~packing:box_r3c4#add () in
  r3c4#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "4C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c5 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c5 = GButton.button ~packing:box_r3c5#add () in
  r3c5#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "5C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c6 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c6 = GButton.button ~packing:box_r3c6#add () in
  r3c6#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "6C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c7 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c7 = GButton.button ~packing:box_r3c7#add () in
  r3c7#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "7C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r3c8 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c8 = GButton.button ~packing:box_r3c8#add () in
  r3c8#connect#clicked ~callback: (fun () ->
  let m = {player = pl;
          coordinate = "8C"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  let box_r4c1 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c1 = GButton.button ~packing:box_r4c1#add () in
  r4c1#connect#clicked ~callback: (fun () -> let m = {player = pl;
        coordinate = "1D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c2 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c2 = GButton.button ~packing:box_r4c2#add () in
  r4c2#connect#clicked ~callback: (fun () ->

      let m = {player = pl;
        coordinate = "2D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c3 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c3 = GButton.button ~packing:box_r4c3#add () in
  r4c3#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "3D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c4 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c4 = GButton.button ~packing:box_r4c4#add () in
  r4c4#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "4D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c5 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c5 = GButton.button ~packing:box_r4c5#add () in
  r4c5#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "5D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c6 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c6 = GButton.button ~packing:box_r4c6#add () in
  r4c6#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "6D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c7 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c7 = GButton.button ~packing:box_r4c7#add () in
  r4c7#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "7D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r4c8 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c8 = GButton.button ~packing:box_r4c8#add () in
  r4c8#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "8D"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c1 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c1 = GButton.button ~packing:box_r5c1#add () in
  r5c1#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "1E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c2 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c2 = GButton.button ~packing:box_r5c2#add () in
  r5c2#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "2E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c3 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c3 = GButton.button ~packing:box_r5c3#add () in
  r5c3#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "3E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c4 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c4 = GButton.button ~packing:box_r5c4#add () in
  r5c4#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "4E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c5 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c5 = GButton.button ~packing:box_r5c5#add () in
  r5c5#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "5E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c6 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c6 = GButton.button ~packing:box_r5c6#add () in
  r5c6#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "6E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c7 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c7 = GButton.button ~packing:box_r5c7#add () in
  r5c7#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "7E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r5c8 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c8 = GButton.button ~packing:box_r5c8#add () in
  r5c8#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "8E"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c1 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c1 = GButton.button ~packing:box_r6c1#add () in
  r6c1#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "1F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );


  let box_r6c2 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c2 = GButton.button ~packing:box_r6c2#add () in
  r6c2#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "2F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c3 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c3 = GButton.button ~packing:box_r6c3#add () in
  r6c3#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "3F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c4 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c4 = GButton.button ~packing:box_r6c4#add () in
  r6c4#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "4F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c5 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c5 = GButton.button ~packing:box_r6c5#add () in
  r6c5#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "5F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c6 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c6 = GButton.button ~packing:box_r6c6#add () in
  r6c6#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "6F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c7 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c7 = GButton.button ~packing:box_r6c7#add () in
  r6c7#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "7F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r6c8 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c8 = GButton.button ~packing:box_r6c8#add () in
  r6c8#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "8F"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c1 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c1 = GButton.button ~packing:box_r7c1#add () in
  r7c1#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "1G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c2 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c2 = GButton.button ~packing:box_r7c2#add () in
  r7c2#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "2G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c3 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c3 = GButton.button ~packing:box_r7c3#add () in
  r7c3#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "3G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c4 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c4 = GButton.button ~packing:box_r7c4#add () in
  r7c4#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "4G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c5 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c5 = GButton.button ~packing:box_r7c5#add () in
  r7c5#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "5G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c6 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c6 = GButton.button ~packing:box_r7c6#add () in
  r7c6#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "6G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c7 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c7 = GButton.button ~packing:box_r7c7#add () in
  r7c7#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "7G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r7c8 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c8 = GButton.button ~packing:box_r7c8#add () in
  r7c8#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "8G"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c1 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c1 = GButton.button ~packing:box_r8c1#add () in
  r8c1#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "1H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c2 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c2 = GButton.button ~packing:box_r8c2#add () in
  r8c2#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "2H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c3 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c3 = GButton.button ~packing:box_r8c3#add () in
  r8c3#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "3H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c4 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c4 = GButton.button ~packing:box_r8c4#add () in
  r8c4#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "4H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c5 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c5 = GButton.button ~packing:box_r8c5#add () in
  r8c5#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "5H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c6 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c6 = GButton.button ~packing:box_r8c6#add () in
  r8c6#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "6H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c7 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c7 = GButton.button ~packing:box_r8c7#add () in
  r8c7#connect#clicked ~callback: (fun () -> let m = {player = pl;
coordinate = "7H"} in
let new_board = update game_board m in
draw sboxs vbox new_board (opp pl)
  );

  let box_r8c8 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c8 = GButton.button ~packing:box_r8c8#add () in
  r8c8#connect#clicked ~callback: (fun () ->
        let m = {player = pl;
          coordinate = "8H"} in
  let new_board = update game_board m in
  draw sboxs vbox new_board (opp pl)
    );

  xpm_label_box ~file:(get_tile (List.assoc "1A" game_board)) ~packing:r1c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2A" game_board)) ~packing:r1c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3A" game_board)) ~packing:r1c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4A" game_board)) ~packing:r1c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5A" game_board)) ~packing:r1c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6A" game_board)) ~packing:r1c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7A" game_board)) ~packing:r1c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8A" game_board)) ~packing:r1c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1B" game_board)) ~packing:r2c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2B" game_board)) ~packing:r2c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3B" game_board)) ~packing:r2c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4B" game_board)) ~packing:r2c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5B" game_board)) ~packing:r2c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6B" game_board)) ~packing:r2c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7B" game_board)) ~packing:r2c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8B" game_board)) ~packing:r2c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1C" game_board)) ~packing:r3c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2C" game_board)) ~packing:r3c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3C" game_board)) ~packing:r3c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4C" game_board)) ~packing:r3c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5C" game_board)) ~packing:r3c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6C" game_board)) ~packing:r3c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7C" game_board)) ~packing:r3c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8C" game_board)) ~packing:r3c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1D" game_board)) ~packing:r4c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2D" game_board)) ~packing:r4c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3D" game_board)) ~packing:r4c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4D" game_board)) ~packing:r4c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5D" game_board)) ~packing:r4c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6D" game_board)) ~packing:r4c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7D" game_board)) ~packing:r4c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8D" game_board)) ~packing:r4c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1E" game_board)) ~packing:r5c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2E" game_board)) ~packing:r5c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3E" game_board)) ~packing:r5c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4E" game_board)) ~packing:r5c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5E" game_board)) ~packing:r5c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6E" game_board)) ~packing:r5c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7E" game_board)) ~packing:r5c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8E" game_board)) ~packing:r5c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1F" game_board)) ~packing:r6c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2F" game_board)) ~packing:r6c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3F" game_board)) ~packing:r6c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4F" game_board)) ~packing:r6c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5F" game_board)) ~packing:r6c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6F" game_board)) ~packing:r6c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7F" game_board)) ~packing:r6c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8F" game_board)) ~packing:r6c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1G" game_board)) ~packing:r7c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2G" game_board)) ~packing:r7c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3G" game_board)) ~packing:r7c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4G" game_board)) ~packing:r7c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5G" game_board)) ~packing:r7c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6G" game_board)) ~packing:r7c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7G" game_board)) ~packing:r7c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8G" game_board)) ~packing:r7c8#add ();
  xpm_label_box ~file:(get_tile (List.assoc "1H" game_board)) ~packing:r8c1#add ();
  xpm_label_box ~file:(get_tile (List.assoc "2H" game_board)) ~packing:r8c2#add ();
  xpm_label_box ~file:(get_tile (List.assoc "3H" game_board)) ~packing:r8c3#add ();
  xpm_label_box ~file:(get_tile (List.assoc "4H" game_board)) ~packing:r8c4#add ();
  xpm_label_box ~file:(get_tile (List.assoc "5H" game_board)) ~packing:r8c5#add ();
  xpm_label_box ~file:(get_tile (List.assoc "6H" game_board)) ~packing:r8c6#add ();
  xpm_label_box ~file:(get_tile (List.assoc "7H" game_board)) ~packing:r8c7#add ();
  xpm_label_box ~file:(get_tile (List.assoc "8H" game_board)) ~packing:r8c8#add ();
  ()


let () = main ()
