# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallImmediateMethod( EvaluatedMatrixOfRelations,
        _IsHomalgRelations and IsLeftOrRightPresentation and HasUnderlyingMatrix, 0,

  UnderlyingMatrix );

##
InstallMethod( UnderlyingHomalgRing,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    rels := rels!.LazyUnderlyingMatrix;
    
    return HomalgRing( EvalSyzygiesOfColumns( rels )[1] );
    
end );

##
InstallMethod( UnderlyingHomalgRing,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation and HasUnderlyingMatrix ],
        
  function( rels )
    
    return HomalgRing( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( UnderlyingHomalgRing,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    rels := rels!.LazyUnderlyingMatrix;
    
    return HomalgRing( EvalSyzygiesOfRows( rels )[1] );
    
end );

##
InstallMethod( UnderlyingHomalgRing,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation and HasUnderlyingMatrix ],
        
  function( rels )
    
    return HomalgRing( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HomalgRing,
        "for a set of relations of a homalg/CAP module",
        [ IsHomalgRelations and IsLeftOrRightPresentation ],
        
  UnderlyingHomalgRing );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    rels := rels!.LazyUnderlyingMatrix;
    
    return HasNrColumns( EvalSyzygiesOfColumns( rels )[1] );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation and HasUnderlyingMatrix ],
        
  function( rels )
    
    return HasNrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    rels := rels!.LazyUnderlyingMatrix;
    
    return HasNrRows( EvalSyzygiesOfRows( rels )[1] );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation and HasUnderlyingMatrix ],
        
  function( rels )
    
    return HasNrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    rels := rels!.LazyUnderlyingMatrix;
    
    return NrColumns( EvalSyzygiesOfColumns( rels )[1] );
    
end );

##
InstallMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation and HasUnderlyingMatrix ],
        
  function( rels )
    
    return NrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    rels := rels!.LazyUnderlyingMatrix;
    
    return NrRows( EvalSyzygiesOfRows( rels )[1] );
    
end );

##
InstallMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation and HasUnderlyingMatrix ],
        
  function( rels )
    
    return NrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    
    return HasUnderlyingMatrix( rels ) and HasNrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    
    return HasUnderlyingMatrix( rels ) and HasNrRows( UnderlyingMatrix( rels ) );
    
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
    
    if not IsHomalgRelationsOfRightModule( rels ) then
        
        SetFilterObj( rels,
                IsHomalgRelationsOfRightModule and
                IsRelationsOfFinitelyPresentedModuleRep );
        
        Set_IsHomalgRelations( rels, true );
        
    fi;
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForModule,
        "for a CAP left presentation",
        [ IsLeftPresentation ],
        
  function( rels )
    
    if not IsHomalgRelationsOfLeftModule( rels ) then
        
        SetFilterObj( rels,
                IsHomalgRelationsOfLeftModule and
                IsRelationsOfFinitelyPresentedModuleRep );
        
        Set_IsHomalgRelations( rels, true );
        
    fi;
    
    return rels;
    
end );
