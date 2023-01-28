# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
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
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],

  CapCategory );

##
InstallMethod( UnderlyingModule,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],

  IdFunc );

##
InstallMethod( ListOfPositionsOfKnownSetsOfRelations,
        "for a homalg/CAP module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return [ 1 .. PositionOfLastStoredCell( M ) ];
    
end );

##
InstallMethod( PositionOfTheDefaultPresentation,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  PositionOfActiveCell );

##
InstallMethod( SetPositionOfTheDefaultPresentation,
        "for a homalg/CAP graded module and an integer",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject, IsPosInt ],

  SetPositionOfActiveCell );

##
InstallMethod( OnLastStoredPresentation,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    SetPositionOfTheDefaultPresentation( M, PositionOfLastStoredCell( M ) );
    
    return M;
    
end );

##
InstallMethod( RelationsOfModule,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return UnderlyingCell( ActiveCell( M ) );
    
end );

##
InstallMethod( RelationsOfModule,
        "for a homalg/CAP graded module and an integer",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    
    return UnderlyingCell( CertainCell( M, pos ) );
    
end );

##
InstallMethod( GeneratorsOfModule,
        "for a homalg/CAP graded module and an integer",
        [ IsGradedModuleOrGradedSubmoduleRep and IsCapCategoryIntrinsicObject, IsPosInt ],
        
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
        "for a homalg/CAP graded module",
        [ IsGradedModuleOrGradedSubmoduleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return GeneratorsOfModule( M, PositionOfActiveCell( M ) );
    
end );

##
InstallOtherMethod( NrGenerators,
        "for a fp graded left or right module",
        [ IsFpGradedLeftOrRightModulesObject ],
        
  function( M )
    
    return RankOfObject( Range( RelationMorphism( M ) ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return NrGenerators( RelationsOfModule( M ) );
    
end );

##
InstallMethod( HasNrRelations,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return true;
    
end );

##
InstallMethod( NrRelations,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return RankOfObject( Source( RelationMorphism( RelationsOfModule( M ) ) ) );
    
end );

##
InstallOtherMethod( UnderlyingMatrix,
        "for a fp graded left or right module",
        [ IsFpGradedLeftOrRightModulesObject ],
        
  function( M )
    
    return UnderlyingHomalgMatrix( RelationMorphism( M ) );
    
end );

##
InstallOtherMethod( MatrixOfRelations,
        "for a fp graded left or right module",
        [ IsFpGradedLeftOrRightModulesObject ],
        
  UnderlyingMatrix );

##
InstallMethod( MatrixOfRelations,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return UnderlyingMatrix( RelationsOfModule( M ) );
    
end );

##
InstallMethod( HomalgRing,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    if not IsBound( M!.ring ) then
        M!.ring := HomalgRing( MatrixOfRelations( M ) );
    fi;
    
    return M!.ring;
    
end );

##
InstallOtherMethod( DegreesOfGenerators,
        "for a fp graded left module",
        [ IsFpGradedLeftModulesObject ],

  function( M )
    
    return -UnzipDegreeList( Range( RelationMorphism( M ) ) );
    
end );

##
InstallMethod( DegreesOfGenerators,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return DegreesOfGenerators( RelationsOfModule( M ) );
    
end );

##
InstallOtherMethod( IsZero,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return IsZero( ActiveCell( M ) );
    
end );

##
InstallMethod( AffineDimension,
        "for a homalg/CAP graded module and two lists",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject, IsList, IsList ],
        
  function( M, weights, degrees )
    
    return AffineDimension( MatrixOfRelations( M ), weights, degrees );
    
end );

##
InstallOtherMethod( BasisOfModule,
        "for a fp graded left module",
        [ IsFpGradedLeftModulesObject ],
        
  function( M )
    
    return BasisOfRows( MatrixOfRelations( M ) );
    
end );

##
InstallOtherMethod( BasisOfModule,
        "for a fp graded right module",
        [ IsFpGradedRightModulesObject ],
        
  function( M )
    
    return BasisOfColumns( MatrixOfRelations( M ) );
    
end );

##
InstallMethod( BasisOfModule,
        "for a homalg/CAP graded module",
        [ IsGradedModuleOrGradedSubmoduleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return BasisOfModule( RelationsOfModule( M ) );
    
end );

##
InstallMethod( DecideZero,
        "for a homalg matrix and homalg/CAP graded module",
        [ IsHomalgMatrix, IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( mat, M )
    local decide_zero;
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        decide_zero := DecideZeroRows;
    else
        decide_zero := DecideZeroColumns;
    fi;
    
    return decide_zero( mat, MatrixOfRelations( M ) );
    
end );

##
InstallMethod( DecideZero,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local gens;
    
    gens := GeneratorsOfModule( M );
    
    SetIsZero( M, IsZero( gens ) );
    
    return gens;
    
end );

##
InstallMethod( BasisOfModule,
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
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
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
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
        "for a homalg/CAP graded module",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
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
InstallMethod( ByASmallerPresentation,
        "for homalg/CAP graded modules",
        [ IsGradedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local g, r, p, rel;
    
    while true do
        g := NrGenerators( M );
        r := NrRelations( M );
        p := PositionOfTheDefaultSetOfGenerators( M );
        OnLessGenerators( M );
        if NrGenerators( M ) = g then ## try to compute a basis first
            rel := RelationsOfModule( M, p );
            if not ( HasCanBeUsedToDecideZeroEffectively( rel ) and
                     CanBeUsedToDecideZeroEffectively( rel ) ) then
                SetPositionOfTheDefaultSetOfGenerators( M, p ); ## just in case
                if not ValueOption( "BasisOfModule" ) = false then
                    BasisOfModule( M );
                fi;
                OnLessGenerators( M );
            fi;
        fi;
        if NrGenerators( M ) = g then ## there is nothing we can do more!
            break;
        fi;
    od;
    
    if not ( IsBound( HOMALG_MODULES.ByASmallerPresentationDoesNotDecideZero ) and
             HOMALG_MODULES.ByASmallerPresentationDoesNotDecideZero = true )
       and NrRelations( M ) > 0 then
        ## Fixme: also generators of free modules can be reduced;
        ## this should become lazy with the introduction of intrinsic categories
        DecideZero( M );
    fi;
    
    return M;
    
end );

##
InstallMethod( POW,
        "for a homalg graded module and an integer",
        [ IsGradedModuleRep, IsInt ],
        
  function( M, twist )
    local S, G, t;
    
    S := HomalgRing( M );
    
    G := DegreeGroup( S );
    
    t := HomalgModuleElement( ListWithIdenticalEntries( NrGenerators( G ), twist ), G );
    
    if IsIdenticalObj( M, 1 * S ) then
        
        if not IsBound( S!.left_twists ) then
            S!.left_twists := rec( );
        fi;
        
        if IsBound( S!.left_twists.(String( t )) ) and
           not IsCapCategoryIntrinsicObject( S!.left_twists.(String( t )) ) then
            Unbind( S!.left_twists.(String( t )) );
        fi;
        
    elif IsIdenticalObj( M, S * 1 ) then
        
        if not IsBound( S!.right_twists ) then
            S!.right_twists := rec( );
        fi;
        
        if IsBound( S!.right_twists.(String( t )) ) and
           not IsCapCategoryIntrinsicObject( S!.right_twists.(String( t )) ) then
            Unbind( S!.right_twists.(String( t )) );
        fi;
        
    fi;
    
    TryNextMethod(  );
    
end );

##
InstallMethod( AsLeftObject,
        "for a homalg graded ring",
        [ IsHomalgGradedRingRep ],
        
  function( S )
    
    if IsBound( S!.AsGradedLeftObject ) and
       not IsCapCategoryIntrinsicObject( S!.AsGradedLeftObject ) then
        Unbind( S!.AsGradedLeftObject );
    fi;
    
    TryNextMethod(  );
    
end );
    
##
InstallMethod( AsRightObject,
        "for a homalg graded ring",
        [ IsHomalgGradedRingRep ],
        
  function( S )
    
    if IsBound( S!.AsGradedRightObject ) and
       not IsCapCategoryIntrinsicObject( S!.AsGradedRightObject ) then
        Unbind( S!.AsGradedRightObject );
    fi;
    
    TryNextMethod(  );
    
end );
    
##
InstallMethod( PresentationMorphism,
        "for a homalg/CAP graded module and an integer",
        [ IsGradedModuleOrGradedSubmoduleRep and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local pres, range, rel, S, epi;
    
    if IsBound(M!.GradedPresentationMorphismByFreyds.( pos )) then
        return M!.GradedPresentationMorphismByFreyds.( pos );
    fi;
    
    pres := RelationMorphism( RelationsOfModule( M ) );
    
    range := Range( pres );
    
    rel := UnderlyingHomalgMatrix( pres );
    
    S := HomalgRing( rel );
    
    ## the following code corresponds to ReducedBasisOfModule in Modules/gap/Modules.gi:
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        if HasRingRelations( S ) then
            rel := GetRidOfObsoleteRows( rel );
        fi;
        rel := ReducedBasisOfRowModule( rel );
        pres := DeduceSomeMapFromMatrixAndRangeForGradedRows( rel, range );
    else
        if HasRingRelations( S ) then
            rel := GetRidOfObsoleteColumns( rel );
        fi;
        rel := ReducedBasisOfColumnModule( rel );
        pres := DeduceSomeMapFromMatrixAndRangeForGradedCols( rel, range );
    fi;
    
    pres := AsFreydCategoryMorphism( pres );
    
    pres := GradedMap( pres, HomalgGradedModule( Source( pres ) ), HomalgGradedModule( Range( pres ) ) );
    
    if not HasCokernelEpi( pres ) then
        ## the zero'th component of the quasi-isomorphism,
        ## which in this case is simply the natural epimorphism onto the module
        epi := HomalgIdentityMatrix( RankOfObject( range ), S );
        epi := GradedMap( epi, Range( pres ), M );
        
        SetIsEpimorphism( epi, true );
        SetCokernelEpi( pres, epi );
    fi;
    
    M!.GradedPresentationMorphismByFreyds.( pos ) := pres;
    
    return pres;
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( Intrinsify,
        "for a category of homalg/CAP graded modules and an object with ambient object",
        [ IsCategoryOfHomalgGradedModules, IsCapCategoryObjectWithAmbientObject ],

  function( A, cell )
    local left, rels, M, S;
    
    rels := UnderlyingCell( cell );
    
    #HomalgRelationsForModule( rels );
    
    M := IntrinsifyObject( A, cell );
    
    S := HomalgRing( M );
    
    if HasIsDivisionRingForHomalg( S ) and IsDivisionRingForHomalg( S ) then
        M!.string := "graded vector space";
        M!.string_plural := "graded vector spaces";
        SetIsFree( M, true );
    else
        M!.string := "graded module";
        M!.string_plural := "graded modules";
    fi;
    
    M!.GradedPresentationMorphismByFreyds := rec( );
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
InstallMethod( HomalgGradedModule,
        "for a fp graded left or right module",
        [ IsFpGradedLeftOrRightModulesObject ],
        
  function( M )
    local S, A, left, pi, iota;
    
    S := UnderlyingGradedRing( M );
    
    A := CapCategory( M );
    
    left := IsFpGradedLeftModulesObject( M );
    
    A := CategoryWithAmbientObjects( A );
    
    pi := AsGeneralizedMorphismByCospan( EpimorphismFromSomeProjectiveObject( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    if left then
        A := CategoryOfHomalgFinitelyPresentedGradedLeftModules( S );
    else
        A := CategoryOfHomalgFinitelyPresentedGradedRightModules( S );
    fi;
    
    M!.ring := S;
    
    M := Intrinsify( A, M );
    
    if NrGenerators( M ) = 0 then
        SetIsZero( M, true );
    elif HasNrRelations( M ) and NrRelations( M ) = 0 then
        SetIsFree( M, true );
    fi;
    
    return M;
    
end );

##
InstallMethod( LeftPresentationWithDegrees,
        "for a homalg matrix, a list and a homalg graded ring",
        [ IsHomalgMatrix, IsList, IsHomalgGradedRingRep ],
        
  function( mat, degrees_of_generators, S )
    local M;
    
    CategoryOfHomalgFinitelyPresentedGradedLeftModules( S );

    M := FpGradedLeftModuleByFreyd( mat, -degrees_of_generators, S );
    
    return HomalgGradedModule( M );
    
end );

##
InstallMethod( RightPresentationWithDegrees,
        "for a homalg matrix, a list and a homalg graded ring",
        [ IsHomalgMatrix, IsList, IsHomalgGradedRingRep ],
        
  function( mat, degrees_of_generators, S )
    local M;
    
    CategoryOfHomalgFinitelyPresentedGradedRightModules( S );
    
    M := FpGradedRightModuleByFreyd( mat, -degrees_of_generators, S );
    
    return HomalgGradedModule( M );
    
end );

##
InstallMethod( GradedModule,
        "for a homalg module, a list, and a homalg graded ring",
        [ IsFinitelyPresentedModuleRep, IsList, IsHomalgGradedRingRep ],
        
  function( module, degrees, S )
    local constructor;
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( module ) then
        constructor := LeftPresentationWithDegrees;
    else
        constructor := RightPresentationWithDegrees;
    fi;
    
    return constructor( MatrixOfRelations( module ), degrees, S );
    
end );

##
InstallMethod( FreeLeftModuleWithDegrees,
        "for a list and a homalg graded ring",
        [ IsList, IsHomalgGradedRingRep ],
        
  function( degrees, S )
    local r, F;
    
    r := Length( degrees );
    
    if r = 0 then
        F := ZeroObject( CategoryOfHomalgFinitelyPresentedGradedLeftModules( S ) );
        SetIsZero( F, true );
    else
        F := LeftPresentationWithDegrees( HomalgZeroMatrix( 0, r, S ), degrees, S );
    fi;
    
    SetRankOfObject( F, r );
    
    return F;
    
end );

##
InstallMethod( FreeLeftModuleWithDegrees,
        "for a homalg graded ring and a list",
        [ IsHomalgGradedRingRep, IsList ],
        
  function( S, degrees )
    
    return FreeLeftModuleWithDegrees( degrees, S );
    
end );

##
InstallMethod( FreeRightModuleWithDegrees,
        "for a list and a homalg graded ring",
        [ IsList, IsHomalgGradedRingRep ],
        
  function( degrees, S )
    local r, F;
    
    r := Length( degrees );
    
    if r = 0 then
        F := ZeroObject( CategoryOfHomalgFinitelyPresentedGradedRightModules( S ) );
        SetIsZero( F, true );
    else
        F := RightPresentationWithDegrees( HomalgZeroMatrix( r, 0, S ), degrees, S );
    fi;
    
    SetRankOfObject( F, r );
    
    return F;
    
end );

##
InstallMethod( FreeRightModuleWithDegrees,
        "for a homalg graded ring and a list",
        [ IsHomalgGradedRingRep, IsList ],
        
  function( S, degrees )
    
    return FreeRightModuleWithDegrees( degrees, S );
    
end );

##
InstallMethod( AsLeftObject,
        "for a homalg graded ring",
        [ IsHomalgGradedRingRep ],
        
  function( S )
    local F;
    
    if IsBound( S!.AsGradedLeftObject ) then
        return S!.AsGradedLeftObject;
    fi;    
    
    F := FreeLeftModuleWithDegrees( S, [ 0 ] );
    
    S!.AsGradedLeftObject := F;
    
    F!.distinguished := true;
    F!.not_twisted := true;
    
    return F;
    
end );

##
InstallMethod( AsRightObject,
        "for a homalg graded ring",
        [ IsHomalgGradedRingRep ],
        
  function( S )
    local F;
    
    if IsBound( S!.AsGradedRightObject ) then
        return S!.AsGradedRightObject;
    fi;    
    
    F := FreeRightModuleWithDegrees( S, [ 0 ] );
    
    S!.AsGradedRightObject := F;
    
    F!.distinguished := true;
    F!.not_twisted := true;
    
    return F;
    
end );

##
InstallMethod( ZeroLeftModule,
        "for a homalg graded ring",
        [ IsHomalgGradedRingRep ],
        
  function( S )
    
    return FreeLeftModuleWithDegrees( S, [ ] );
    
end );

##
InstallMethod( ZeroRightModule,
        "for a homalg graded ring",
        [ IsHomalgGradedRingRep ],
        
  function( S )
    
    return FreeRightModuleWithDegrees( S, [ ] );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for a homalg/CAP graded module",
        [ IsGradedModuleOrGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( o )
    
    if IsBound( o!.distinguished ) then
        Print( "<The graded" );
    else
        Print( "<A graded" );
    fi;
    
    Print( ViewString( o ) );
    
    Print( ">" );
    
end );

##
InstallMethod( Display,
        "for a homalg/CAP graded module",
        [ IsGradedModuleOrGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( o )
    local deg;
    
    deg := DegreesOfGenerators( o );
    
    if Length( deg ) > 1 then
        Display( o, "" );
        Print( "\n(graded, degrees of generators: ");
        ViewObj( deg );
        Print( ")\n" );
    elif Length( deg ) = 1 then
        Display( o, "" );
        Print( "\n(graded, degree of generator: ");
        ViewObj( deg[ 1 ] );
        Print( ")\n" );
    elif Length( deg ) = 0 then
        Display( 0 );
        Print( "\n(graded)\n" );
    else
        Display( o, "" );
        Print( "\n(graded)\n" );
    fi;
    
end );
