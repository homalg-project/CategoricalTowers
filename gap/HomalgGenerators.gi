####################################
#
# methods for operations:
#
####################################

##
InstallMethod( HasNrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],

  function( gen )
    local mat;
    
    mat := UnderlyingMatrix( gen );
    
    if IsLeftPresentationMorphism( gen ) then
        return HasNrColumns( mat );
    else
        return HasNrRows( mat );
    fi;
    
end );

##
InstallMethod( NrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],

  function( gen )
    local mat;
    
    mat := UnderlyingMatrix( gen );
    
    if IsLeftPresentationMorphism( gen ) then
        return NrColumns( mat );
    else
        return NrRows( mat );
    fi;
    
end );

##
InstallMethod( MatrixOfGenerators,
        "for a set of generators of a homalg/CAP module",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],
        
  function( M )
    
    return UnderlyingMatrix( M );
    
end );
