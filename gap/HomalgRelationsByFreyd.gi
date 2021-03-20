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
InstallOtherMethod( UnderlyingMatrix,
        "for a set of relations of a homalg/CAP module",
        [ IsFreydCategoryObject ],
        
  function( rels )
    
    return UnderlyingMatrix( RelationMorphism( rels ) );
    
end );

##
InstallOtherMethod( UnderlyingMatrix,
        "for a category of rows object",
        [ IsCategoryOfRowsObject ],
        
  function( rels )
    
    return HomalgZeroMatrix( 0, RankOfObject( rels ), UnderlyingHomalgRing( rels ) );
    
end );

##
InstallOtherMethod( UnderlyingMatrix,
        "for a category of columns object",
        [ IsCategoryOfColumnsObject ],
        
  function( rels )
    
    return HomalgZeroMatrix( RankOfObject( rels ), 0, UnderlyingHomalgRing( rels ) );
    
end );

##
InstallImmediateMethod( EvaluatedMatrixOfRelations,
        _IsHomalgRelations and IsFreydCategoryObject and HasUnderlyingMatrix, 0,

  UnderlyingMatrix );

##
InstallImmediateMethod( EvaluatedMatrixOfRelations,
        _IsHomalgRelations and IsCategoryOfRowsObject, 0,

  UnderlyingMatrix );

##
InstallImmediateMethod( EvaluatedMatrixOfRelations,
        _IsHomalgRelations and IsCategoryOfColumnsObject, 0,

  UnderlyingMatrix );

##
InstallOtherMethod( UnderlyingHomalgRing,
        "for a set of relations of a homalg/CAP module",
        [ IsFreydCategoryObject ],
        
  function( rels )
    
    return UnderlyingRing( UnderlyingCategory( CapCategory( rels ) ) );
    
end );

##
InstallMethod( HomalgRing,
        "for a set of relations of a homalg/CAP module",
        [ IsHomalgRelations and IsFreydCategoryObject ],
        
  UnderlyingHomalgRing );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsFreydCategoryObject ],
        
  function( rels )
    
    rels := UnderlyingMatrix( rels );
    
    if not HasEvalSyzygiesOfColumns( rels ) then
        TryNextMethod( );
    fi;
    
    return HasNrColumns( EvalSyzygiesOfColumns( rels )[1] );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsFreydCategoryObject and HasUnderlyingMatrix ],
        
  function( rels )
    
    return HasNrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsFreydCategoryObject ],
        
  function( rels )
    
    rels := UnderlyingMatrix( rels );
    
    if not HasEvalSyzygiesOfRows( rels ) then
        TryNextMethod( );
    fi;
    
    return HasNrRows( EvalSyzygiesOfRows( rels )[1] );
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsFreydCategoryObject and HasUnderlyingMatrix ],
        
  function( rels )
    
    return HasNrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallOtherMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsFreydCategoryObject ],
        
  function( rels )
    
    return RankOfObject( Range( RelationMorphism( rels ) ) );
    
end );

##
InstallMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsFreydCategoryObject ],
        
  function( rels )
    
    rels := UnderlyingMatrix( rels );
    
    if not HasEvalSyzygiesOfColumns( rels ) then
        TryNextMethod( );
    fi;
    
    return NrColumns( EvalSyzygiesOfColumns( rels )[1] );
    
end );

##
InstallMethod( NrGeneratorsForRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsFreydCategoryObject ],
        
  function( rels )
    
    rels := UnderlyingMatrix( rels );
    
    if not HasEvalSyzygiesOfRows( rels ) then
        TryNextMethod( );
    fi;
    
    return NrRows( EvalSyzygiesOfRows( rels )[1] );
    
end );

##
InstallOtherMethod( NrGenerators,
        "for a set of relations of a homalg/CAP right module",
        [ IsFreydCategoryObject ],
        
  NrGeneratorsForRelations );

##
InstallMethod( HasNrRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsFreydCategoryObject ],
        
  function( rels )
    
    return HasUnderlyingMatrix( rels ) and HasNrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( HasNrRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsFreydCategoryObject ],
        
  function( rels )
    
    return HasUnderlyingMatrix( rels ) and HasNrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrRelations,
        "for a set of relations of a homalg/CAP right module",
        [ IsHomalgRelationsOfRightModule and IsFreydCategoryObject ],
        
  function( rels )
    
    return NrColumns( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( NrRelations,
        "for a set of relations of a homalg/CAP left module",
        [ IsHomalgRelationsOfLeftModule and IsFreydCategoryObject ],
        
  function( rels )
    
    return NrRows( UnderlyingMatrix( rels ) );
    
end );

##
InstallMethod( MatrixOfRelations,
        "for a set of relations of a homalg/CAP module",
        [ IsHomalgRelations and IsFreydCategoryObject ],
        
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
        "for a Freyd category object",
        [ IsFreydCategoryObject ],
        
  function( rels )
    
    if IsCategoryOfRowsMorphism( RelationMorphism( rels ) ) and
       not IsHomalgRelationsOfLeftModule( rels ) then
        
        SetFilterObj( rels,
                IsHomalgRelationsOfLeftModule and
                IsRelationsOfFinitelyPresentedModuleRep );
        
    elif IsCategoryOfColumnsMorphism( RelationMorphism( rels ) ) and
      not IsHomalgRelationsOfRightModule( rels ) then
        
        SetFilterObj( rels,
                IsHomalgRelationsOfRightModule and
                IsRelationsOfFinitelyPresentedModuleRep );
        
    fi;
    
    Set_IsHomalgRelations( rels, true );
    
    NrRelationsForRelations( rels );
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForModule,
        "for a category of rows object",
        [ IsCategoryOfRowsObject ],
        
  function( rels )
    
    SetUnderlyingHomalgRing( rels, UnderlyingRing( CapCategory( rels ) ) );
    
    SetNrRelationsForRelations( rels, RankOfObject( rels ) );
    
    SetFilterObj( rels,
            IsHomalgRelationsOfLeftModule and
            IsRelationsOfFinitelyPresentedModuleRep );
    
    Set_IsHomalgRelations( rels, true );
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForModule,
        "for a category of columns object",
        [ IsCategoryOfColumnsObject ],
        
  function( rels )
    
    SetUnderlyingHomalgRing( rels, UnderlyingRing( CapCategory( rels ) ) );
    
    SetNrRelationsForRelations( rels, RankOfObject( rels ) );
    
    SetFilterObj( rels,
            IsHomalgRelationsOfRightModule and
            IsRelationsOfFinitelyPresentedModuleRep );
    
    Set_IsHomalgRelations( rels, true );
    
    return rels;
    
end );
