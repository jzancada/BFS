with Ada.Containers.Doubly_Linked_Lists;
with Graph_Pkg;

package BFS_Pkg is

   subtype Node_Id is Graph_Pkg.Node_Id;

   type BFS_Search is tagged private;

   procedure Bfs
     (Algo  : in out BFS_Search;
      G     : Graph_Pkg.Graph;
      Start : Node_Id);

   function Get_Visit_Order
     (Algo : BFS_Search) return Graph_Pkg.Id_Vectors.Vector;

private

   package Id_Queues is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type => Node_Id);

   type BFS_Search is tagged record
      My_Queue    : Id_Queues.List;
      Visit_Order : Graph_Pkg.Id_Vectors.Vector;
   end record;

end BFS_Pkg;
