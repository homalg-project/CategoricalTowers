####################################
#
# methods for operations:
#
####################################

##
InstallMethod( HasNrGenerators,
        "for a set of relations of homalg/CAP modules",
        [ IsHomalgRelations ],

  function( rels )
    local mat;
    
    mat := UnderlyingMatrix( rels );
    
    if IsLeftPresentation( rels ) then
        return HasNrColumns( mat );
    else
        return HasNrRows( mat );
    fi;
    
end );

##
InstallMethod( NrGenerators,
        "for a set of relations of homalg/CAP modules",
        [ IsHomalgRelations ],

  function( rels )
    local mat;
    
    mat := UnderlyingMatrix( rels );
    
    if IsLeftPresentation( rels ) then
        return NrColumns( mat );
    else
        return NrRows( mat );
    fi;
    
end );

##
InstallMethod( HasNrRelations,
        "for a set of relations of homalg/CAP modules",
        [ IsHomalgRelations and IsLeftOrRightPresentation ],

  function( rels )
    local mat;
    
    mat := UnderlyingMatrix( rels );
    
    if IsLeftPresentation( rels ) then
        return HasNrRows( mat );
    else
        return HasNrColumns( mat );
    fi;
    
end );

##
InstallMethod( NrRelations,
        "for a set of relations of a homalg/CAP module",
        [ IsHomalgRelations ],

  function( rels )
    local mat;
    
    mat := UnderlyingMatrix( rels );
    
    if IsLeftPresentation( rels ) then
        return NrRows( mat );
    else
        return NrColumns( mat );
    fi;
    
end );

##
InstallMethod( MatrixOfRelations,
        "for a set of relations of a homalg/CAP module",
        [ IsHomalgRelations and IsLeftOrRightPresentation ],
        
  function( rels )
    
    return UnderlyingMatrix( rels );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( HomalgRelationsForModule,
        "for a CAP left presentation",
        [ IsLeftPresentation ],
        
  function( rels )
    
    SetFilterObj( rels,
            IsHomalgRelationsOfLeftModule and
            IsRelationsOfFinitelyPresentedModuleRep );
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForModule,
        "for a CAP right presentation",
        [ IsRightPresentation ],
        
  function( rels )
    
    SetFilterObj( rels,
            IsHomalgRelationsOfRightModule and
            IsRelationsOfFinitelyPresentedModuleRep );
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForLeftModule,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    
    return HomalgRelationsForModule( AsLeftPresentation( mat ) );
    
end );

##
InstallMethod( HomalgRelationsForRightModule,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    
    return HomalgRelationsForModule( AsRightPresentation( mat ) );
    
end );
