#
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallOtherMethod( RepresentationCategoryObject,
        "for a character, a CAP category, and a Julia object",
        [ IsCharacter, IsCapCategory, IsJuliaObject ],
        
  function ( irr_char, category, str )
    
    return RepresentationCategoryObject( irr_char, category, JuliaToGAP( IsString, str ) );
    
end );
