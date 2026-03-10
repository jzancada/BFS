package body Graph_Pkg is

   function Find_Entry_Index (G : Graph; Id : Node_Id) return Natural is
   begin
      if G.Adjacency.Is_Empty then
         return 0;
      end if;

      for I in G.Adjacency.First_Index .. G.Adjacency.Last_Index loop
         if G.Adjacency.Element (I).Id = Id then
            return I;
         end if;
      end loop;

      return 0;
   end Find_Entry_Index;

   function Contains_Node (G : Graph; Id : Node_Id) return Boolean is
   begin
      if G.All_Node_Ids.Is_Empty then
         return False;
      end if;

      for I in G.All_Node_Ids.First_Index .. G.All_Node_Ids.Last_Index loop
         if G.All_Node_Ids.Element (I) = Id then
            return True;
         end if;
      end loop;

      return False;
   end Contains_Node;

   procedure Add_Node (G : in out Graph; Id : Node_Id) is
      Adj_Entry : Adjacency_Entry;
   begin
      if not Contains_Node (G, Id) then
         G.All_Node_Ids.Append (Id);
         Adj_Entry.Id := Id;
         G.Adjacency.Append (Adj_Entry);
      end if;
   end Add_Node;

   procedure Add_Edge (G : in out Graph; From_Id, To_Id : Node_Id) is
      Index     : Natural;
      Adj_Entry : Adjacency_Entry;
   begin
      Add_Node (G, From_Id);
      Add_Node (G, To_Id);

      Index := Find_Entry_Index (G, From_Id);

      if Index /= 0 then
         Adj_Entry := G.Adjacency.Element (Index);
         Adj_Entry.Neighbours.Append (To_Id);
         G.Adjacency.Replace_Element (Index, Adj_Entry);
      end if;
   end Add_Edge;

   function Get_All_Node_Ids (G : Graph) return Id_Vectors.Vector is
   begin
      return G.All_Node_Ids;
   end Get_All_Node_Ids;

   function Get_Neighbours (G : Graph; Id : Node_Id) return Id_Vectors.Vector is
      Index : constant Natural := Find_Entry_Index (G, Id);
   begin
      if Index = 0 then
         return Id_Vectors.Empty_Vector;
      else
         return G.Adjacency.Element (Index).Neighbours;
      end if;
   end Get_Neighbours;

end Graph_Pkg;
