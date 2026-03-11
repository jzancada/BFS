with Ada.Text_IO; use Ada.Text_IO;

with Node_Pkg;
with Graph_Pkg;
with BFS_Pkg;

procedure main_2 is

   package Int_Nodes is new Node_Pkg (Element_Type => Integer);
   use Int_Nodes;

   G : Graph_Pkg.Graph;
   B : BFS_Pkg.BFS_Search;

   N1 : Node := Create (1, 1);
   N2 : Node := Create (2, 2);
   N3 : Node := Create (3, 3);
   N4 : Node := Create (4, 4);
   N5 : Node := Create (5, 5);
   N6 : Node := Create (6, 6);
   N7 : Node := Create (7, 7);
   N8 : Node := Create (8, 8);
   N9 : Node := Create (9, 9);

   Order : Graph_Pkg.Id_Vectors.Vector;

begin
   Graph_Pkg.Add_Node (G, Get_Id (N1));
   Graph_Pkg.Add_Node (G, Get_Id (N2));
   Graph_Pkg.Add_Node (G, Get_Id (N3));
   Graph_Pkg.Add_Node (G, Get_Id (N4));
   Graph_Pkg.Add_Node (G, Get_Id (N5));
   Graph_Pkg.Add_Node (G, Get_Id (N6));
   Graph_Pkg.Add_Node (G, Get_Id (N7));
   Graph_Pkg.Add_Node (G, Get_Id (N8));
   Graph_Pkg.Add_Node (G, Get_Id (N9));

   Graph_Pkg.Add_Edge (G, Get_Id (N1), Get_Id (N2));
   Graph_Pkg.Add_Edge (G, Get_Id (N1), Get_Id (N4));
   
   Graph_Pkg.Add_Edge (G, Get_Id (N2), Get_Id (N3));
   Graph_Pkg.Add_Edge (G, Get_Id (N2), Get_Id (N5));
   
   Graph_Pkg.Add_Edge (G, Get_Id (N3), Get_Id (N6));
   Graph_Pkg.Add_Edge (G, Get_Id (N3), Get_Id (N2));

   Graph_Pkg.Add_Edge (G, Get_Id (N4), Get_Id (N5));
   Graph_Pkg.Add_Edge (G, Get_Id (N4), Get_Id (N7));

   Graph_Pkg.Add_Edge (G, Get_Id (N5), Get_Id (N6));
   Graph_Pkg.Add_Edge (G, Get_Id (N5), Get_Id (N6));
   Graph_Pkg.Add_Edge (G, Get_Id (N5), Get_Id (N8));

   Graph_Pkg.Add_Edge (G, Get_Id (N6), Get_Id (N9));

   BFS_Pkg.Bfs (B, G, Get_Id (N1));
   Order := BFS_Pkg.Get_Visit_Order (B);

   Put_Line ("Orden BFS:");
   if not Order.Is_Empty then
      for I in Order.First_Index .. Order.Last_Index loop
         Put (Integer'Image (Integer (Order.Element (I))));
      end loop;
      New_Line;
   end if;

end Main_2;
