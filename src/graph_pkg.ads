with Ada.Containers.Vectors;

package Graph_Pkg is

   subtype Node_Id is Positive;

   package Id_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Node_Id);

   type Graph is tagged private;

   procedure Add_Node (G : in out Graph; Id : Node_Id);
   procedure Add_Edge (G : in out Graph; From_Id, To_Id : Node_Id);

   function Get_All_Node_Ids (G : Graph) return Id_Vectors.Vector;
   function Get_Neighbours (G : Graph; Id : Node_Id) return Id_Vectors.Vector;

private

   type Adjacency_Entry is record
      Id         : Node_Id;
      Neighbours : Id_Vectors.Vector;
   end record;

   package Adjacency_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Adjacency_Entry);

   type Graph is tagged record
      All_Node_Ids : Id_Vectors.Vector;
      Adjacency    : Adjacency_Vectors.Vector;
   end record;

end Graph_Pkg;
