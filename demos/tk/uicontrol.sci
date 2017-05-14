function add_list_item()
  if e1<>0&l1<>0 then
  new = get(e1,'String')
  list_item = [list_item  new];
  set(l1,'String',strcat(list_item,'|'));
  list_item=resume(list_item)
  end
endfunction

function myuidialog()
  list_item = ["rouge"  "vert"  "tomate"  "chevre" "Truc"];
  e1=0;l1 =0
  initial=strcat(list_item,'|')

  f = figure("Position",[50 50 300 200],...
	     "BackgroundColor",[0.9 0.9 0.9],...
	     "Unit", "pixel");

  m=uimenu(f,'label', 'menu');
  // create an item on the menu bar
  m1=uimenu(m,'label', 'launch plot3d1', 'callback', "plot3d1()");
  m2=uimenu(m,'label', 'Exit figure', 'callback', "fin=%t;");
  m3=uimenu(m,'label', 'quit scilab', 'callback', "exit");

  fr1= uicontrol(f, "Position"  , [5 5 160 100],...
		 "Style"     , "frame",...
		 "BackgroundColor",[0.9 0.9 0.9]);


  t1 = uicontrol(f, "Position"  , [15 94 60 20],...
		 "Style"     , "text",...
		 "String"    , "an entry box",...
		 "fontsize"  , 10,...
		 "BackgroundColor",[0.9 0.9 0.9]);

  e1 = uicontrol(f, "Position"  , [10 50 150 25],...
		 "Style"     , "edit",...
		 "String"    , "hello",...
		 "BackgroundColor",[1 1 1]);

  b1 = uicontrol(f, "Position"  , [50 10 70 20],...
		 "Style"     , "pushbutton",...
		 "String"    , "add in list",...
		 "callback"  , "add_list_item()" );

  l1 = uicontrol(f, "Position"  , [180 10 100 150],...
		 "Style"     , "listbox",...
		 "String"    ,  initial);

  b2 = uicontrol(f, "Position"  , [200 170 70 20],...
		 "Style"     , "pushbutton",...
		 "String"    , "num item",...
		 "callback"  , "disp(get(l1,''value''))");

  b3 = uicontrol(f, "Position"  , [10 170 50 20],...
		 "Style"     , "pushbutton",...
		 "String"    , "Quit",...
		 "FontWeight", "bold",...
		 "BackgroundColor",[0 0.7 1],...
		 "callback"  , "fin=%t");

  fr2= uicontrol(f, "Position"  , [138 128 29 19],...
		 "Style"     , "frame",...
		 "BackgroundColor",[0.9 0.9 0.9]);

  t2 = uicontrol(f, "Position"  , [140 130 25 15],...
		 "Style"     , "text",...
		 "String"    , "50",...
		 "BackgroundColor",[1 1 1]);
  s1=0
  s1 = uicontrol(f, "Position"  , [10 130 120 15],..
		 "Style"     , "slider",...
		 "Min"       , 0,...
		 "Max"       , 100,...
		 "Value"     , 50,...
		 "SliderStep", [2 10],...
		 "callback"  , "set(t2,''String'',string(get(s1,''Value'')))");
  // Note pour un slider la position de ref est ulp

  p1 = uicontrol(f, "Position"  , [100 170 50 20],...
		 "Style"     , "popupmenu",...
		 "String"    , "popup|item1|item2|item3|toto|truc|bidule");

  fin=%f
  while ~fin
    sleep(1)
    if findobj('label', 'menu')==[] then
      return;
    end
  end
  close(f)

  return
endfunction
