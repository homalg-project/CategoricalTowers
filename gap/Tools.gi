#
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( RepresentationCategoryObject,
        "for a character, a CAP category, and a string",
        [ IsCharacter, IsCapCategory, IsString ],
        
  function ( irr_char, category, str )
    
    SetString( GIrreducibleObject( irr_char ), str );
    
    return RepresentationCategoryObject( irr_char, category );
    
end );
