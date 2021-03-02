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
InstallMethod( HomalgCategory,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],

  CapCategory );

##
InstallMethod( HomalgRing,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    if not IsBound( M!.ring ) then
        M!.ring := UnderlyingHomalgRing( RelationsOfModule( M ) );
    fi;
    
    return M!.ring;
    
end );

##
InstallMethod( ListOfPositionsOfKnownSetsOfRelations,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return [ 1 .. PositionOfLastStoredCell( M ) ];

end );

##
InstallMethod( PositionOfTheDefaultSetOfGenerators,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],

  PositionOfActiveCell );

##
InstallMethod( SetPositionOfTheDefaultPresentation,
        "for a homalg/CAP module and an integer",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],

  SetPositionOfActiveCell );

##
InstallMethod( HasNrGenerators,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleOrSubmoduleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return HasNrGenerators( RelationsOfModule( M ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( M )
    local g;
    
    g := NrGenerators( RelationsOfModule( M ) );
    
    ## TODO: cleanup legacy code
    if g = 0 then
        SetIsZero( M, true );
    elif IsFinitelyPresentedModuleOrSubmoduleRep( M ) and
      HasRankOfObject( M ) and RankOfObject( M ) = g then
        SetIsFree( M, true );
    fi;
    
    return g;
    
end );

##
InstallMethod( GeneratorsOfModule,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local gens;
    
    if pos > PositionOfLastStoredCell( M ) then
        return fail;
    fi;
    
    gens := LazyGeneralizedEmbeddingInAmbientObject( CertainCell( M, pos ) );
    
    return HomalgGeneratorsForModule( gens, M );
    
end );

##
InstallMethod( GeneratorsOfModule,
        "for a homalg submodule and a positive integer",
        [ IsFinitelyPresentedSubmoduleRep and HasEmbeddingInSuperObject, IsPosInt ],
        
  function( M, pos )
    
    return GeneratorsOfModule( UnderlyingObject( M ), pos );
    
end );

##
InstallMethod( RelationsOfModule,
        "for a homalg/CAP module and a positive integer",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local rels;
    
    if pos > PositionOfLastStoredCell( M ) then
        return fail;
    fi;
    
    rels := UnderlyingCell( CertainCell( M, pos ) );
    
    rels := HomalgRelationsForModule( rels );
    
    if not IsBound( M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES ) then
        M!.ring := UnderlyingHomalgRing( rels );
        M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES := [ ];
    fi;
    
    if not IsBound( M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES[pos] ) then
        INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES( rels, M );
        M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES[pos] := pos;
    fi;
    
    return rels;
    
end );

##
InstallMethod( MatrixOfRelations,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return MatrixOfRelations( RelationsOfModule( M ) );
    
end );

##
InstallMethod( DecideZero,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local gens;
    
    gens := GeneratorsOfModule( M );
    
    SetIsZero( M, IsZero( gens ) );
    
    return gens;
    
end );

##
InstallMethod( BasisOfModule,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local pos, rels;
    
    ## TODO: write a wrapper for the IdentityFunctors with side-effect to
    ## update generators and more
    pos := PositionOfActiveCell( M );
    
    ApplyFunctor( CapCategory( M )!.IdSM, M );
    
    UpdateHomalgGenerators( GeneratorsOfModule( M, pos ), GeneratorsOfModule( M ) );
    
    rels := RelationsOfModule( M );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( MatrixOfRelations( rels ), rels );
    
    return rels;
    
end );

##
InstallMethod( GetRidOfZeroGenerators,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local pos, rels;
    
    pos := PositionOfActiveCell( M );
    
    ApplyFunctor( CapCategory( M )!.IdZG, M );
    
    UpdateHomalgGenerators( GeneratorsOfModule( M, pos ), GeneratorsOfModule( M ) );
    
    rels := RelationsOfModule( M );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( MatrixOfRelations( rels ), rels );
    
    return M;
    
end );

##
InstallMethod( OnLessGenerators,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local pos, rels;
    
    pos := PositionOfActiveCell( M );
    
    ApplyFunctor( CapCategory( M )!.IdLG, M );
    
    UpdateHomalgGenerators( GeneratorsOfModule( M, pos ), GeneratorsOfModule( M ) );
    
    rels := RelationsOfModule( M );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( MatrixOfRelations( rels ), rels );
    
    return M;
    
end );

##
InstallMethod( EpiOnLeftFactor,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return ProjectionInFactorOfDirectSum( M!.DirectSum_Context[1][1], 1 );
    
end );

##
InstallMethod( EpiOnRightFactor,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return ProjectionInFactorOfDirectSum( M!.DirectSum_Context[1][1], 2 );
    
end );

##
InstallMethod( MonoOfLeftSummand,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return InjectionOfCofactorOfDirectSum( M!.DirectSum_Context[1][1], 1 );
    
end );

##
InstallMethod( MonoOfRightSummand,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return InjectionOfCofactorOfDirectSum( M!.DirectSum_Context[1][1], 2 );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( Intrinsify,
        "for a category of homalg modules and an object with ambient object",
        [ IsCategoryOfHomalgModules, IsCapCategoryObjectWithAmbientObject ],

  function( A, cell )
    local left, rels, M, R;
    
    rels := UnderlyingCell( cell );
    
    HomalgRelationsForModule( rels );
    
    M := IntrinsifyObject( A, cell );
    
    R := HomalgRing( M );
    
    if HasIsDivisionRingForHomalg( R ) and IsDivisionRingForHomalg( R ) then
        M!.string := "vector space";
        M!.string_plural := "vector spaces";
    else
        M!.string := "module";
        M!.string_plural := "modules";
    fi;
    
    M!.PresentationMorphisms := rec( );
    M!.Resolutions := rec( );
    
    if not IsBound( M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES ) then
        M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES := [ ];
    fi;
    
    if not IsBound( M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES[1] ) then
        INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES( rels, M );
        M!.INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES := [ 1 ];
    fi;
    
    return M;
    
end );

##
InstallMethod( HomalgModule,
        "for a left or right CAP presentation",
        [ IsLeftOrRightPresentation ],

  function( M )
    local R, A, left, pi, iota;
    
    R := UnderlyingHomalgRing( M );
    
    A := CapCategory( M );
    
    left := IsLeftPresentation( M );
    
    A := CategoryWithAmbientObject( A );
    
    pi := AsGeneralizedMorphismByCospan( EpimorphismFromSomeProjectiveObject( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    if left then
        A := CategoryOfHomalgFinitelyPresentedLeftModules( R );
    else
        A := CategoryOfHomalgFinitelyPresentedRightModules( R );
    fi;
    
    M := Intrinsify( A, M );
    
    return M;
    
end );

##
InstallMethod( LeftPresentation,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( M )
    
    CategoryOfHomalgFinitelyPresentedLeftModules( HomalgRing( M ) );
    
    M := AsLeftPresentation( M );
    
    return HomalgModule( M );
    
end );

##
InstallMethod( RightPresentation,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( M )
    
    CategoryOfHomalgFinitelyPresentedRightModules( HomalgRing( M ) );
    
    M := AsRightPresentation( M );
    
    return HomalgModule( M );
    
end );

##
InstallMethod( HomalgFreeLeftModule,
        "for an integer and a homalg ring",
        [ IsInt, IsHomalgRing ],

  function( r, R )
    
    CategoryOfHomalgFinitelyPresentedLeftModules( R );
    
    return HomalgModule( FreeLeftPresentation( r, R ) );
    
end );

##
InstallMethod( HomalgFreeRightModule,
        "for an integer and a homalg ring",
        [ IsInt, IsHomalgRing ],

  function( r, R )
    
    CategoryOfHomalgFinitelyPresentedRightModules( R );
    
    return HomalgModule( FreeRightPresentation( r, R ) );
    
end );

##
InstallMethod( HomalgZeroLeftModule,
        "for a homalg ring",
        [ IsHomalgRing ],

  function( R )
    local A;
    
    A := CategoryOfHomalgFinitelyPresentedLeftModules( R );
    
    return ZeroObject( A );
    
end );

##
InstallMethod( HomalgZeroRightModule,
        "for a homalg ring",
        [ IsHomalgRing ],

  function( R )
    local A;
    
    A := CategoryOfHomalgFinitelyPresentedRightModules( R );
    
    return ZeroObject( A );
    
end );
