open GMain
open GdkKeysyms


let locale = GtkMain.Main.init ()

let callback () =
  prerr_endline "test"
let xpm_label_box ~file ~packing () =
  if not (Sys.file_exists file) then failwith (file ^ " does not exist");

  (* Create box for image and label and pack *)
  let box = GPack.hbox ~border_width:2 ~packing () in

  (* Now on to the image stuff and pack into box *)
  let pixmap = GDraw.pixmap_from_xpm ~file () in
  GMisc.pixmap pixmap ~packing:(box#pack ~padding:3) ();

  (* Create a label for the button and pack into box *)
  GMisc.label ~packing:(box#pack ~padding:3) ()
let main () =
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

  let box_r1c1 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c1 = GButton.button ~packing:box_r1c1#add () in
  r1c1#connect#clicked ~callback: (callback);

  let box_r1c2 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c2 = GButton.button ~packing:box_r1c2#add () in
  r1c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r1c3 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c3 = GButton.button ~packing:box_r1c3#add () in
  r1c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r1c4 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c4 = GButton.button ~packing:box_r1c4#add () in
  r1c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r1c5 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c5 = GButton.button ~packing:box_r1c5#add () in
  r1c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r1c6 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c6 = GButton.button ~packing:box_r1c6#add () in
  r1c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r1c7 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c7 = GButton.button ~packing:box_r1c7#add () in
  r1c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r1c8 = GPack.vbox ~packing:sub_box1#add ~width:100 ~height:100 () in
  let r1c8 = GButton.button ~packing:box_r1c8#add () in
  r1c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c1 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c1 = GButton.button ~packing:box_r2c1#add () in
  r1c1#connect#clicked ~callback: (callback);


  let box_r2c2 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c2 = GButton.button ~packing:box_r2c2#add () in
  r1c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c3 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c3 = GButton.button ~packing:box_r2c3#add () in
  r1c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c4 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c4 = GButton.button ~packing:box_r2c4#add () in
  r1c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c5 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c5 = GButton.button ~packing:box_r2c5#add () in
  r1c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c6 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c6 = GButton.button ~packing:box_r2c6#add () in
  r1c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c7 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c7 = GButton.button ~packing:box_r2c7#add () in
  r1c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r2c8 = GPack.vbox ~packing:sub_box2#add ~width:100 ~height:100 () in
  let r2c8 = GButton.button ~packing:box_r2c8#add () in
  r1c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c1 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c1 = GButton.button ~packing:box_r3c1#add () in
  r3c1#connect#clicked ~callback: (callback);

  let box_r3c2 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c2 = GButton.button ~packing:box_r3c2#add () in
  r3c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c3 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c3 = GButton.button ~packing:box_r3c3#add () in
  r3c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c4 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c4 = GButton.button ~packing:box_r3c4#add () in
  r3c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c5 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c5 = GButton.button ~packing:box_r3c5#add () in
  r3c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c6 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c6 = GButton.button ~packing:box_r3c6#add () in
  r3c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c7 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c7 = GButton.button ~packing:box_r3c7#add () in
  r3c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r3c8 = GPack.vbox ~packing:sub_box3#add ~width:100 ~height:100 () in
  let r3c8 = GButton.button ~packing:box_r3c8#add () in
  r3c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c1 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c1 = GButton.button ~packing:box_r4c1#add () in
  r4c1#connect#clicked ~callback: (callback);

  let box_r4c2 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c2 = GButton.button ~packing:box_r4c2#add () in
  r4c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c3 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c3 = GButton.button ~packing:box_r4c3#add () in
  r4c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c4 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c4 = GButton.button ~packing:box_r4c4#add () in
  r4c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c5 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c5 = GButton.button ~packing:box_r4c5#add () in
  r4c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c6 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c6 = GButton.button ~packing:box_r4c6#add () in
  r4c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c7 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c7 = GButton.button ~packing:box_r4c7#add () in
  r4c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r4c8 = GPack.vbox ~packing:sub_box4#add ~width:100 ~height:100 () in
  let r4c8 = GButton.button ~packing:box_r4c8#add () in
  r4c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c1 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c1 = GButton.button ~packing:box_r5c1#add () in
  r5c1#connect#clicked ~callback: (callback);

  let box_r5c2 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c2 = GButton.button ~packing:box_r5c2#add () in
  r5c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c3 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c3 = GButton.button ~packing:box_r5c3#add () in
  r5c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c4 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c4 = GButton.button ~packing:box_r5c4#add () in
  r5c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c5 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c5 = GButton.button ~packing:box_r5c5#add () in
  r5c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c6 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c6 = GButton.button ~packing:box_r5c6#add () in
  r5c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c7 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c7 = GButton.button ~packing:box_r5c7#add () in
  r5c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r5c8 = GPack.vbox ~packing:sub_box5#add ~width:100 ~height:100 () in
  let r5c8 = GButton.button ~packing:box_r5c8#add () in
  r5c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c1 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c1 = GButton.button ~packing:box_r6c1#add () in
  r6c1#connect#clicked ~callback: (callback);

  let box_r6c2 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c2 = GButton.button ~packing:box_r6c2#add () in
  r6c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c3 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c3 = GButton.button ~packing:box_r6c3#add () in
  r6c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c4 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c4 = GButton.button ~packing:box_r6c4#add () in
  r6c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c5 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c5 = GButton.button ~packing:box_r6c5#add () in
  r6c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c6 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c6 = GButton.button ~packing:box_r6c6#add () in
  r6c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c7 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c7 = GButton.button ~packing:box_r6c7#add () in
  r6c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r6c8 = GPack.vbox ~packing:sub_box6#add ~width:100 ~height:100 () in
  let r6c8 = GButton.button ~packing:box_r6c8#add () in
  r6c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c1 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c1 = GButton.button ~packing:box_r7c1#add () in
  r7c1#connect#clicked ~callback: (callback);

  let box_r7c2 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c2 = GButton.button ~packing:box_r7c2#add () in
  r7c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c3 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c3 = GButton.button ~packing:box_r7c3#add () in
  r7c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c4 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c4 = GButton.button ~packing:box_r7c4#add () in
  r7c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c5 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c5 = GButton.button ~packing:box_r7c5#add () in
  r7c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c6 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c6 = GButton.button ~packing:box_r7c6#add () in
  r7c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c7 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c7 = GButton.button ~packing:box_r7c7#add () in
  r7c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r7c8 = GPack.vbox ~packing:sub_box7#add ~width:100 ~height:100 () in
  let r7c8 = GButton.button ~packing:box_r7c8#add () in
  r7c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c1 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c1 = GButton.button ~packing:box_r8c1#add () in
  r8c1#connect#clicked ~callback: (callback);

  let box_r8c2 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c2 = GButton.button ~packing:box_r8c2#add () in
  r8c2#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c3 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c3 = GButton.button ~packing:box_r8c3#add () in
  r8c3#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c4 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c4 = GButton.button ~packing:box_r8c4#add () in
  r8c4#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c5 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c5 = GButton.button ~packing:box_r8c5#add () in
  r8c5#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c6 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c6 = GButton.button ~packing:box_r8c6#add () in
  r8c6#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c7 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c7 = GButton.button ~packing:box_r8c7#add () in
  r8c7#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  let box_r8c8 = GPack.vbox ~packing:sub_box8#add ~width:100 ~height:100 () in
  let r8c8 = GButton.button ~packing:box_r8c8#add () in
  r8c8#connect#clicked ~callback: (fun () -> prerr_endline "Ouch!");

  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c3#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c4#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r1c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c3#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c4#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r2c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c3#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c4#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r3c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r4c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r4c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r4c3#add ();
  xpm_label_box ~file:"p2.xpm" ~packing:r4c4#add ();
  xpm_label_box ~file:"p1.xpm" ~packing:r4c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r4c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r4c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r4c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r5c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r5c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r5c3#add ();
  xpm_label_box ~file:"p1.xpm" ~packing:r5c4#add ();
  xpm_label_box ~file:"p2.xpm" ~packing:r5c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r5c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r5c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r5c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c3#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c4#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r6c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c3#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c4#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r7c8#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c1#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c2#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c3#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c4#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c5#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c6#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c7#add ();
  xpm_label_box ~file:"empty_tile.xpm" ~packing:r8c8#add ();


  window#show ();
  Main.main ()

let () = main ()
