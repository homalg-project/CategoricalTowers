####################################
#
# methods for operations:
#
####################################

##
InstallMethod( HasNrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],

  function( gens )
    local mat;
    
    mat := UnderlyingMatrix( gens );
    
    if IsLeftPresentationMorphism( gens ) then
        return HasNrColumns( mat );
    else
        return HasNrRows( mat );
    fi;
    
end );

##
InstallMethod( NrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],

  function( gens )
    local mat;
    
    mat := UnderlyingMatrix( gens );
    
    if IsLeftPresentationMorphism( gens ) then
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
