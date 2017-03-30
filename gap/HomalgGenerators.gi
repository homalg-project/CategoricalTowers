####################################
#
# methods for operations:
#
####################################

##
InstallMethod( UpdateHomalgGenerators,
        "for an object and a set of generators of homalg/CAP modules",
        [ IsObject,
          IsHomalgGenerators and IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( o, gens )
    
    if HasProcedureToReadjustGenerators( o ) then
        SetProcedureToReadjustGenerators( gens, ProcedureToReadjustGenerators( o ) );
    fi;
    
    if HasProcedureToNormalizeGenerators( o ) then
        SetProcedureToNormalizeGenerators( gens, ProcedureToNormalizeGenerators( o ) );
    fi;
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],

  function( gens )
    local mat;
    
    mat := UnderlyingMatrix( gens );
    
    if IsLeftPresentationMorphism( gens ) then
        return HasNrRows( mat );
    else
        return HasNrColumns( mat );
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
        return NrRows( mat );
    else
        return NrColumns( mat );
    fi;
    
end );

##
InstallMethod( MatrixOfGenerators,
        "for a set of generators of a homalg/CAP module",
        [ IsHomalgGenerators and IsLeftOrRightPresentationMorphism ],
        
  function( M )
    
    return UnderlyingMatrix( M );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( HomalgGeneratorsForModule,
        "for a CAP left presentation morphism",
        [ IsLeftPresentationMorphism ],
        
  function( gens )
    
    SetFilterObj( gens,
            IsHomalgGeneratorsOfLeftModule and
            IsGeneratorsOfFinitelyGeneratedModuleRep );
    
    return gens;
    
end );

##
InstallMethod( HomalgGeneratorsForModule,
        "for a CAP right presentation morphism",
        [ IsRightPresentationMorphism ],
        
  function( gens )
    
    SetFilterObj( gens,
            IsHomalgGeneratorsOfRightModule and
            IsGeneratorsOfFinitelyGeneratedModuleRep );
    
    return gens;
    
end );
