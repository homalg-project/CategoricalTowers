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

##
DeclareOperation( "IsShowable",
        [ IsString, IsElementInInternalAlgebraOrModule ] );

##
InstallMethod( IsShowable,
        "for a string and a an element in an internal algebra or module",
        [ IsString, IsElementInInternalAlgebraOrModule ],
        
  function ( mime, e )
    
    if not mime in [ "text/plain", "text/latex", "application/x-latex" ] then
        TryNextMethod();
    fi;
    
    return true;
    
end );
