####################################
#
# methods for operations:
#
####################################

##
InstallMethod( HasNrGenerators,
        "for a set of relations of homalg/CAP right modules",
        [ IsHomalgRelationsOfRightModule ],
        
  function( rels )
    
    return HasNrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of homalg/CAP left modules",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    return HasNrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a set of relations of homalg/CAP right modules",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    return NrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a set of relations of homalg/CAP left modules",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    return NrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrRelations,
        "for a set of relations of homalg/CAP right modules",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    return HasNrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrRelations,
        "for a set of relations of homalg/CAP left modules",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    return HasNrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    return NrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    return NrRows( UnderlyingMatrix( rels ) );
    
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
        "for a CAP right presentation",
        [ IsRightPresentation ],
        
  function( rels )
    
    SetFilterObj( rels,
            IsHomalgRelationsOfRightModule and
            IsRelationsOfFinitelyPresentedModuleRep );
    
    return rels;
    
end );

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
InstallMethod( HomalgRelationsForRightModule,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local rels;
    
    rels := HomalgRelationsForModule( AsRightPresentation( mat ) );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( mat, rels );
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForLeftModule,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local rels;
    
    rels := HomalgRelationsForModule( AsLeftPresentation( mat ) );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( mat, rels );
    
    return rels;
    
end );
