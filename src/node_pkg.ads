generic
   type Element_Type is private;
package Node_Pkg is

   subtype Node_Id is Positive;

   type Node is tagged private;

   function Create (Id : Node_Id; Element : Element_Type) return Node;

   function Get_Id (N : Node) return Node_Id;

   function Get_Element (N : Node) return Element_Type;
   procedure Set_Element (N : in out Node; Element : Element_Type);

private

   type Node is tagged record
      Id      : Node_Id;
      Element : Element_Type;
   end record;

end Node_Pkg;
