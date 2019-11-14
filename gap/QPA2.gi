##
InstallOtherMethod( CategoryOfVectorSpaces,
        [ IsFieldForHomalg ],
        
  function( F )
    
    return CategoryOfVectorSpaces( F!.ring );
    
end );

##
InstallOtherMethod( MatrixByRows,
        [ IsFieldForHomalg, IsList ],
        
  function( F, mat )
    
    return MatrixByRows( F!.ring, mat );
    
end );
