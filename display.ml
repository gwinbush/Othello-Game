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

and  make_tile container coord playe (board:Board.board) sub_boxes vbox=
  let box = GPack.vbox ~packing:container#add ~width:100 ~height:100 () in
  let button = GButton.button ~packing:box#add () in
  button#connect#clicked ~callback: (fun () ->
      let m = {player = playe;
              coordinate = coord} in
      let new_board = update board m in
      draw sub_boxes vbox new_board (opp playe)
    );
  (button,box)

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

  let r1c1 = fst (make_tile sub_box1 "1A" pl game_board sboxs vbox) in
  let r1c2 = fst (make_tile sub_box1 "2A" pl game_board sboxs vbox) in
  let r1c3 = fst (make_tile sub_box1 "3A" pl game_board sboxs vbox) in
  let r1c4 = fst (make_tile sub_box1 "4A" pl game_board sboxs vbox) in
  let r1c5 = fst (make_tile sub_box1 "5A" pl game_board sboxs vbox) in
  let r1c6 = fst (make_tile sub_box1 "6A" pl game_board sboxs vbox) in
  let r1c7 = fst (make_tile sub_box1 "7A" pl game_board sboxs vbox) in
  let r1c8 = fst (make_tile sub_box1 "8A" pl game_board sboxs vbox) in

  let r2c1 = fst (make_tile sub_box2 "1B" pl game_board sboxs vbox) in
  let r2c2 = fst (make_tile sub_box2 "2B" pl game_board sboxs vbox) in
  let r2c3 = fst (make_tile sub_box2 "3B" pl game_board sboxs vbox) in
  let r2c4 = fst (make_tile sub_box2 "4B" pl game_board sboxs vbox) in
  let r2c5 = fst (make_tile sub_box2 "5B" pl game_board sboxs vbox) in
  let r2c6 = fst (make_tile sub_box2 "6B" pl game_board sboxs vbox) in
  let r2c7 = fst (make_tile sub_box2 "7B" pl game_board sboxs vbox) in
  let r2c8 = fst (make_tile sub_box2 "8B" pl game_board sboxs vbox) in

  let r3c1 = fst (make_tile sub_box3 "1C" pl game_board sboxs vbox) in
  let r3c2 = fst (make_tile sub_box3 "2C" pl game_board sboxs vbox) in
  let r3c3 = fst (make_tile sub_box3 "3C" pl game_board sboxs vbox) in
  let r3c4 = fst (make_tile sub_box3 "4C" pl game_board sboxs vbox) in
  let r3c5 = fst (make_tile sub_box3 "5C" pl game_board sboxs vbox) in
  let r3c6 = fst (make_tile sub_box3 "6C" pl game_board sboxs vbox) in
  let r3c7 = fst (make_tile sub_box3 "7C" pl game_board sboxs vbox) in
  let r3c8 = fst (make_tile sub_box3 "8C" pl game_board sboxs vbox) in

  let r4c1 = fst (make_tile sub_box4 "1D" pl game_board sboxs vbox) in
  let r4c2 = fst (make_tile sub_box4 "2D" pl game_board sboxs vbox) in
  let r4c3 = fst (make_tile sub_box4 "3D" pl game_board sboxs vbox) in
  let r4c4 = fst (make_tile sub_box4 "4D" pl game_board sboxs vbox) in
  let r4c5 = fst (make_tile sub_box4 "5D" pl game_board sboxs vbox) in
  let r4c6 = fst (make_tile sub_box4 "6D" pl game_board sboxs vbox) in
  let r4c7 = fst (make_tile sub_box4 "7D" pl game_board sboxs vbox) in
  let r4c8 = fst (make_tile sub_box4 "8D" pl game_board sboxs vbox) in

  let r5c1 = fst (make_tile sub_box5 "1E" pl game_board sboxs vbox) in
  let r5c2 = fst (make_tile sub_box5 "2E" pl game_board sboxs vbox) in
  let r5c3 = fst (make_tile sub_box5 "3E" pl game_board sboxs vbox) in
  let r5c4 = fst (make_tile sub_box5 "4E" pl game_board sboxs vbox) in
  let r5c5 = fst (make_tile sub_box5 "5E" pl game_board sboxs vbox) in
  let r5c6 = fst (make_tile sub_box5 "6E" pl game_board sboxs vbox) in
  let r5c7 = fst (make_tile sub_box5 "7E" pl game_board sboxs vbox) in
  let r5c8 = fst (make_tile sub_box5 "8E" pl game_board sboxs vbox) in

  let r6c1 = fst (make_tile sub_box6 "1F" pl game_board sboxs vbox) in
  let r6c2 = fst (make_tile sub_box6 "2F" pl game_board sboxs vbox) in
  let r6c3 = fst (make_tile sub_box6 "3F" pl game_board sboxs vbox) in
  let r6c4 = fst (make_tile sub_box6 "4F" pl game_board sboxs vbox) in
  let r6c5 = fst (make_tile sub_box6 "5F" pl game_board sboxs vbox) in
  let r6c6 = fst (make_tile sub_box6 "6F" pl game_board sboxs vbox) in
  let r6c7 = fst (make_tile sub_box6 "7F" pl game_board sboxs vbox) in
  let r6c8 = fst (make_tile sub_box6 "8F" pl game_board sboxs vbox) in

  let r7c1 = fst (make_tile sub_box7 "1G" pl game_board sboxs vbox) in
  let r7c2 = fst (make_tile sub_box7 "2G" pl game_board sboxs vbox) in
  let r7c3 = fst (make_tile sub_box7 "3G" pl game_board sboxs vbox) in
  let r7c4 = fst (make_tile sub_box7 "4G" pl game_board sboxs vbox) in
  let r7c5 = fst (make_tile sub_box7 "5G" pl game_board sboxs vbox) in
  let r7c6 = fst (make_tile sub_box7 "6G" pl game_board sboxs vbox) in
  let r7c7 = fst (make_tile sub_box7 "7G" pl game_board sboxs vbox) in
  let r7c8 = fst (make_tile sub_box7 "8G" pl game_board sboxs vbox) in

  let r8c1 = fst (make_tile sub_box8 "1H" pl game_board sboxs vbox) in
  let r8c2 = fst (make_tile sub_box8 "2H" pl game_board sboxs vbox) in
  let r8c3 = fst (make_tile sub_box8 "3H" pl game_board sboxs vbox) in
  let r8c4 = fst (make_tile sub_box8 "4H" pl game_board sboxs vbox) in
  let r8c5 = fst (make_tile sub_box8 "5H" pl game_board sboxs vbox) in
  let r8c6 = fst (make_tile sub_box8 "6H" pl game_board sboxs vbox) in
  let r8c7 = fst (make_tile sub_box8 "7H" pl game_board sboxs vbox) in
  let r8c8 = fst (make_tile sub_box8 "8H" pl game_board sboxs vbox) in

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
