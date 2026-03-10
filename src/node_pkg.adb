package body Node_Pkg is

   function Create (Id : Node_Id; Element : Element_Type) return Node is
   begin
      return (Id => Id, Element => Element);
   end Create;

   function Get_Id (N : Node) return Node_Id is
   begin
      return N.Id;
   end Get_Id;

   function Get_Element (N : Node) return Element_Type is
   begin
      return N.Element;
   end Get_Element;

   procedure Set_Element (N : in out Node; Element : Element_Type) is
   begin
      N.Element := Element;
   end Set_Element;

end Node_Pkg;
