with Graph_Pkg;

package body BFS_Pkg is

   function Contains
     (Ids : Graph_Pkg.Id_Vectors.Vector;
      Id  : Node_Id) return Boolean is
   begin
      if Ids.Is_Empty then
         return False;
      end if;

      for I in Ids.First_Index .. Ids.Last_Index loop
         if Ids.Element (I) = Id then
            return True;
         end if;
      end loop;

      return False;
   end Contains;

   procedure Bfs
     (Algo  : in out BFS_Search;
      G     : Graph_Pkg.Graph;
      Start : Node_Id) is
      Visited    : Graph_Pkg.Id_Vectors.Vector;
      Current    : Node_Id;
      Neighbours : Graph_Pkg.Id_Vectors.Vector;
   begin
      Algo.My_Queue.Clear;
      Algo.Visit_Order.Clear;

      if not Contains (Graph_Pkg.Get_All_Node_Ids (G), Start) then
         return;
      end if;

      Visited.Append (Start);
      Algo.My_Queue.Append (Start);

      while not Algo.My_Queue.Is_Empty loop
         Current := Algo.My_Queue.First_Element;
         Algo.My_Queue.Delete_First;

         Algo.Visit_Order.Append (Current);
         Neighbours := Graph_Pkg.Get_Neighbours (G, Current);

         if not Neighbours.Is_Empty then
            for I in Neighbours.First_Index .. Neighbours.Last_Index loop
               declare
                  Next_Id : constant Node_Id := Neighbours.Element (I);
               begin
                  if not Contains (Visited, Next_Id) then
                     Visited.Append (Next_Id);
                     Algo.My_Queue.Append (Next_Id);
                  end if;
               end;
            end loop;
         end if;
      end loop;
   end Bfs;

   function Get_Visit_Order
     (Algo : BFS_Search) return Graph_Pkg.Id_Vectors.Vector is
   begin
      return Algo.Visit_Order;
   end Get_Visit_Order;

end BFS_Pkg;
