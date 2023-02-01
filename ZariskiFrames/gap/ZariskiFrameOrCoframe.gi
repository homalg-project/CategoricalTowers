# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

SetInfoLevel( InfoZariskiFrames, 1 );

##
InstallMethod( UnderlyingRing,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    return UnderlyingRing( CapCategory( A ) );
    
end );

##
InstallMethod( BaseOfFibration,
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    return BaseOfFibration( CapCategory( A ) );
    
end );

##
InstallMethodForCompilerForCAP( ObjectInZariskiFrameOrCoframe,
        "for a Zariksi frame or coframe and a homalg matrix",
        [ IsZariskiFrameOrCoframe, IsHomalgMatrix ],
        
  function( Z, I )
    
    return CreateCapCategoryObjectWithAttributes( Z,
                   PreUnderlyingMatrix, I );
    
end );

##
InstallMethodForCompilerForCAP( ObjectInZariskiFrameOrCoframeByRadicalColumn,
        "for a Zariksi frame or coframe and a homalg matrix",
        [ IsZariskiFrameOrCoframe, IsHomalgMatrix ],
        
  function( Z, I )
    
    return CreateCapCategoryObjectWithAttributes( Z,
                   UnderlyingRadicalColumn, I );
    
end );

##
InstallMethodForCompilerForCAP( ObjectInZariskiFrameOrCoframeByStandardColumn,
        "for a Zariksi frame or coframe and a homalg matrix",
        [ IsZariskiFrameOrCoframe, IsHomalgMatrix ],
        
  function( Z, I )
    
    return CreateCapCategoryObjectWithAttributes( Z,
                   UnderlyingStandardColumn, I );
    
end );

##
InstallMethodForCompilerForCAP( ObjectInZariskiFrameOrCoframeByListOfColumns,
        "for a Zariski frame or coframe and a list",
        [ IsZariskiFrameOrCoframe, IsList ],
        
  function( Z, L )
    local l;
    
    List( L, IsZero );
    
    l := L[1];
    
    L := Filtered( L, l -> not IsOne( l ) );
    
    if L = [ ] then
        L := [ l ];
    fi;
    
    L := DuplicateFreeList( L );
    
    return CreateCapCategoryObjectWithAttributes( Z,
                   UnderlyingListOfColumns, L );
    
end );

##
InstallMethodForCompilerForCAP( ObjectInZariskiFrameOrCoframeByListOfRadicalColumns,
        "for a Zariski frame or coframe and a list",
        [ IsZariskiFrameOrCoframe, IsList ],
        
  function( Z, L )
    local l;
    
    List( L, IsZero );
    
    l := L[1];
    
    L := Filtered( L, l -> not IsOne( l ) );
    
    if L = [ ] then
        L := [ l ];
    fi;
    
    L := DuplicateFreeList( L );
    
    return CreateCapCategoryObjectWithAttributes( Z,
                   UnderlyingListOfRadicalColumns, L );
    
end );

##
InstallOtherMethod( Subobject,
        "for an object in a Zariski (co)frame and a string",
        [ IsObjectInZariskiFrameOrCoframe, IsString ],
        
  function( V, str )
    local Z, U;
    
    Z := CapCategory( V );
    
    U := DirectProduct( V, Z!.Constructor( str, UnderlyingRing( Z ) ) );
    
    return UniqueMorphism( U, V );
    
end );

##
InstallGlobalFunction( ITERATED_INTERSECTION_OF_IDEALS,
  function( L )
    local biased_weak_fiber_product;
    
    if Length( L ) = 1 then
        return L[1];
    fi;
    
    biased_weak_fiber_product := function( I, J )
        return ReducedSyzygiesOfRows( I, J ) * I;
    end;
    
    return Iterated( L, biased_weak_fiber_product );
    
end );

##
InstallGlobalFunction( INTERSECTION_OF_IDEALS,
  function( L )
    local id;
    
    if Length( L ) = 1 then
        return L[1];
    fi;
    
    id := HomalgIdentityMatrix( 1, HomalgRing( L[1] ) );
    
    id := ListWithIdenticalEntries( Length( L ), id );
    
    id := UnionOfColumns( id );
    
    L := DiagMat( L );
    
    return ReducedSyzygiesOfRows( id, L );
    
end );

##
InstallMethod( UnderlyingColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    return ITERATED_INTERSECTION_OF_IDEALS( UnderlyingListOfColumns( A ) );
    
end );

##
InstallMethod( UnderlyingColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingRadicalColumn ],
        
  UnderlyingRadicalColumn );

##
InstallMethod( UnderlyingColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingStandardColumn ],
        
  UnderlyingStandardColumn );

##
InstallMethod( UnderlyingListOfColumns,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasPreUnderlyingMatrix ],
        
  function( A )
    local g;
    
    A := PreUnderlyingMatrix( A );
    
    g := NrColumns( A );
    
    if g = 0 then
        return [ HomalgIdentityMatrix( 1, HomalgRing( A ) ) ];
    elif g = 1 then
        return [ A ];
    fi;
    
    return DuplicateFreeList( List( [ 1 .. g ], i -> CertainColumns( A, [ i ] ) ) );
    
end );

##
InstallMethod( UnderlyingListOfColumns,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingRadicalColumn ],
        
  function( A )
    
    return [ UnderlyingRadicalColumn( A ) ];
    
end );

##
InstallMethod( UnderlyingListOfColumns,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingStandardColumn ],
        
  function( A )
    
    return [ UnderlyingStandardColumn( A ) ];
    
end );

##
InstallMethod( UnderlyingListOfColumns,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingListOfRadicalColumns ],
        
  UnderlyingListOfRadicalColumns );

##
InstallMethod( UnderlyingListOfColumns,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingListOfStandardColumns ],
        
  UnderlyingListOfStandardColumns );

##
InstallMethod( UnderlyingListOfStandardColumns,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    local L;
    
    L := UnderlyingListOfRadicalColumns( A );
    
    L := List( L, BasisOfRows );
    
    if HasUnderlyingListOfColumns( A ) then
        A!.UnderlyingListOfColumns := L;
    else
        SetUnderlyingListOfColumns( A, L );
    fi;
    
    A!.UnderlyingListOfColumns := L;
    
    return L;
    
end );

##
InstallMethod( UnderlyingRadicalColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    local L;
    
    L := UnderlyingListOfRadicalColumns( A );
    
    L := ITERATED_INTERSECTION_OF_IDEALS( L );
    
    if HasUnderlyingColumn( A ) then
        A!.UnderlyingColumn := L;
    else
        SetUnderlyingColumn( A, L );
    fi;
    
    return L;
    
end );

##
InstallMethod( UnderlyingRadicalColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingStandardColumn ],
        
  UnderlyingStandardColumn );

##
InstallMethod( BestUnderlyingColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  UnderlyingRadicalColumn );

##
InstallMethod( UnderlyingStandardColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    local mor;
    
    mor := UnderlyingRadicalColumn( A );
    
    mor := BasisOfRows( mor );
    
    if HasUnderlyingColumn( A ) then
        A!.UnderlyingColumn := mor;
    else
        SetUnderlyingColumn( A, mor );
    fi;
    
    A!.UnderlyingRadicalColumn := mor;
    
    return mor;
    
end );

##
InstallMethod( BestUnderlyingColumn,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasUnderlyingStandardColumn ],
        
  UnderlyingStandardColumn );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES,
  function( zariski_frame_or_coframe )
    
    ##
    ADD_UNIQUE_MORPHISM( zariski_frame_or_coframe );
    
    ##
    AddIsWellDefinedForObjects( zariski_frame_or_coframe,
      function( cat, A )
        
        return true;
        
    end );
    
    ##
    AddIsTerminal( zariski_frame_or_coframe,
      function( cat, A )
        
        ## IsEqualForObjectsIfIsHomSetInhabited would trigger
        ## IsEqualForObjectsIfIsHomSetInhabitedForFrames/Coframes
        ## which is for this context unnecessary and expensive
        return IsHomSetInhabited( TerminalObject( CapCategory( A ) ), A );
        
    end );
    
    ##
    AddIsInitial( zariski_frame_or_coframe,
      function( cat, A )
        
        ## IsEqualForObjectsIfIsHomSetInhabited would trigger
        ## IsEqualForObjectsIfIsHomSetInhabitedForFrames/Coframes
        ## which is for this context unnecessary and expensive
        return IsHomSetInhabited( A, InitialObject( CapCategory( A ) ) );
        
    end );
    
end );

##
InstallMethod( IsSubset,
        "for an object in a Zariski frame and an object in a Zariski coframe",
        [ IsObjectInZariskiFrame, IsObjectInZariskiCoframe ],
        
  function( A, B )
    
    return IsHomSetInhabited( B, AsDifferenceOfClosed( A ) );
    
end );

##
InstallMethod( IsSubset,
        "for an object in a Zariski coframe and an object in a Zariski frame",
        [ IsObjectInZariskiCoframe, IsObjectInZariskiFrame ],
        
  function( A, B )
    
    return IsHomSetInhabited( AsDifferenceOfClosed( B ), A );
    
end );

##
InstallMethod( IsSubset,
        "for two objects in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe, IsObjectInZariskiFrameOrCoframe ],
        
  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
end );

##
InstallMethod( \=,
        "for an object in a Zariski frame and an object in a Zariski coframe",
        [ IsObjectInZariskiFrame, IsObjectInZariskiCoframe ],
        
  function( A, B )
    
    return AsDifferenceOfClosed( A ) = B;
    
end );

##
InstallMethod( \=,
        "for an object in a Zariski coframe and an object in a Zariski frame",
        [ IsObjectInZariskiCoframe, IsObjectInZariskiFrame ],
        
  function( A, B )
    
    return A = AsDifferenceOfClosed( B );
    
end );

##
InstallMethod( IsClosed,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  IsClosedSubobject );

## InstallTrueMethod produces a `matches more than one declaration'-warning
## ReturnTrue produces an `InstallTrueMethod'-warning
InstallOtherMethod( IsLocallyClosed,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    return true;
    
end );

##
InstallMethod( NormalizeObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    UnderlyingListOfRadicalColumns( A );
    
    IsInitial( A );
    IsTerminal( A );
    
    return A;
    
end );

##
InstallMethod( StandardizeObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    UnderlyingListOfStandardColumns( A );
    
    IsInitial( A );
    IsTerminal( A );
    
    return A;
    
end );

##
InstallMethod( DistinguishedLocallyClosedPart,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return DistinguishedLocallyClosedPart( LocallyClosedPart( A ) );
    
end );

##
InstallMethod( AffineApproximation,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local Ap, R, indets, t, R_f, C;
    
    if IsInitial( A ) then
        Error( "the input A is empty\n" );
    elif IsClosed( A ) then
        A := Closure( A );
        if IsObjectInZariskiFrameOrCoframeOfAnAffineVariety( A ) then
            return A;
        fi;
        TryNextMethod( );
    fi;
    
    A := DistinguishedLocallyClosedPart( A );
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        A := AsSingleDifference( A );
    fi;
    
    Ap := A.J;
    
    R := UnderlyingRing( Ap );
    
    Ap := BestUnderlyingColumn( Ap );
    
    Ap := Ap[ 1, 1 ];
    
    indets := Indeterminates( R );
    
    indets := List( indets, String );
    
    t := UnusedVariableName( R, "inv" );
    
    R_f := R * [ t ];
    
    t := t / R_f;
    Ap := Ap / R_f;
    
    A := A.I;
    
    C := CapCategory( A );
    
    A := BestUnderlyingColumn( A );
    
    A := R_f * A;
    
    A := UnionOfRows( A, HomalgMatrix( [ Ap * t - 1 ], 1, 1, R_f ) );
    
    A := ClosedSubsetOfSpecByRadicalColumn( A );
    
    A!.auxiliary_indeterminate := t;
    
    return A;
    
end );

##
InstallMethod( ConstructibleProjection,
        "for an object in a meet-semilattice of differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    return ConstructibleProjection( RabinowitschCover( A ) );
    
end );

##
InstallMethod( ConstructibleProjection,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return Sum( List( A, ConstructibleProjection ) );
    
end );

## the fallback method
InstallMethod( AClosedSuperset,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  Closure );

##
InstallMethod( AClosedSuperset,
        "for an object in a meet-semilattice of differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    ## faster than A.I:
    return A[1].I;
    
end );

##
InstallMethod( AClosedSuperset,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  Closure );

##
InstallMethod( AClosedSuperset,
        "for an object in a thin category",
        [ IsObjectInThinCategory and HasClosure ], 1001,
        
  Closure );

##
InstallMethod( RingEpimorphismOntoResidueClassRingOfClosedSuperset,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local R, T;
    
    A := AClosedSuperset( A );
    
    R := UnderlyingRing( A );
    
    A := UnderlyingStandardColumn( A );
    
    T := R / A;
    
    return RingMap( Indeterminates( T ), R, T );
    
end );

##
InstallMethod( RingEpimorphismOfClosedSuperset,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local pi;
    
    pi := RingEpimorphismOntoResidueClassRingOfClosedSuperset( A );
    
    return RingMapOntoSimplifiedResidueClassRing( Range( pi ) );
    
end );

##
InstallMethod( RingEpimorphismOfClosure,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local R;
    
    Closure( A );
    
    return RingEpimorphismOfClosedSuperset( A );
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and an object in a Zariski frame or coframe",
        [ IsHomalgRingMap, IsObjectInZariskiFrameOrCoframe ],
        
  function( phi, A )
    local T, C, B;
    
    T := Range( phi );
    
    if IsObjectInZariskiCoframe( A ) then
        if IsObjectInZariskiCoframeOfAProjectiveVariety( A ) and IsHomalgGradedRing( T ) then
            C := ZariskiCoframeOfProj( T );
        elif HasZariskiCoframeOfAffineSpectrum( Source( phi ) ) then
            C := ZariskiCoframeOfAffineSpectrum( T );
        else
            C := CapCategory( A );
        fi;
    else
        if IsObjectInZariskiFrameOfAProjectiveVariety( A ) and IsHomalgGradedRing( T ) then
            C := ZariskiFrameOfProj( T );
        elif HasZariskiFrameOfAffineSpectrum( Source( phi ) ) then
            C := ZariskiFrameOfAffineSpectrum( T );
        else
            C := CapCategory( A );
        fi;
    fi;
    
    B := Pullback( phi, UnderlyingColumn( A ) );
    
    if HasIsIsomorphism( phi ) and IsIsomorphism( phi ) then
        if HasUnderlyingStandardColumn( A ) then
            return C!.ConstructorByStandardColumn( B );
        elif HasUnderlyingRadicalColumn( A ) then
            return C!.ConstructorByRadicalColumn( B );
        fi;
    fi;
    
    B := C!.Constructor( B );
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( RingEpimorphismOntoResidueClassRingOfClosedSuperset( B ), Pullback( phi, ParametrizedObject( A ) ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and an object in a meet-semilattice of formal single differences",
        [ IsHomalgRingMap, IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( phi, A )
    local B;
    
    B := List( MinuendAndSubtrahendInUnderlyingLattice( A ), a -> Pullback( phi, a ) );
    
    B := B[1] - B[2];
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( RingEpimorphismOntoResidueClassRingOfClosedSuperset( B ), Pullback( phi, ParametrizedObject( A ) ) ) );
    fi;
    
    if HasNormalizedDistinguishedSubtrahend( A ) then
        SetPreDistinguishedSubtrahend( B, Pullback( phi, NormalizedDistinguishedSubtrahend( A ) ) );
    elif HasPreDistinguishedSubtrahend( A ) then
        SetPreDistinguishedSubtrahend( B, Pullback( phi, PreDistinguishedSubtrahend( A ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and an object in a meet-semilattice of formal multiple differences",
        [ IsHomalgRingMap, IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( phi, A )
    local B;
    
    B := List( A, a -> Pullback( phi, a ) );
    
    B := CallFuncList( AsMultipleDifference, B );
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( RingEpimorphismOntoResidueClassRingOfClosedSuperset( B ), Pullback( phi, ParametrizedObject( A ) ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and a constructible object as a union of formal single differences",
        [ IsHomalgRingMap, IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( phi, A )
    local B;
    
    B := List( A, a -> Pullback( phi, a ) );
    
    B := UnionOfDifferences( B );
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( RingEpimorphismOntoResidueClassRingOfClosedSuperset( B ), Pullback( phi, ParametrizedObject( A ) ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and a constructible object as a union of formal multiple differences",
        [ IsHomalgRingMap, IsConstructibleObjectAsUnionOfMultipleDifferences ],
        
  function( phi, A )
    local B;
    
    A := List( A, a -> Pullback( phi, a ) );
    
    B := UnionOfMultipleDifferences( A );
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( RingEpimorphismOntoResidueClassRingOfClosedSuperset( B ), Pullback( phi, ParametrizedObject( A ) ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( EmbedInSmallerAmbientSpaceByEmbeddingAClosedSuperset,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local phi, S, T;
    
    phi := RingEpimorphismOfClosedSuperset( A );
    
    S := Source( phi );
    
    if HasAmbientRing( S ) then
        S := AmbientRing( S );
    fi;
    
    T := Range( phi );
    
    if HasAmbientRing( T ) then
        T := AmbientRing( T );
        phi := RingMap( T * ImagesOfRingMapAsColumnMatrix( phi ), S, T );
    fi;
    
    return Pullback( phi, A );
    
end );

##
InstallMethod( EmbedInSmallerAmbientSpace,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local b;
    
    b := HasClosure( A );
    
    A := EmbedInSmallerAmbientSpaceByEmbeddingAClosedSuperset( A );
    
    if not b then
        # this should only be slightly more expensive than Closure( A ):
        StandardizeObject( A );
        A := EmbedInSmallerAmbientSpaceByEmbeddingAClosedSuperset( A );
    fi;
    
    StandardizeObject( A );
    
    return A;
    
end );

##
InstallMethod( AClosedSingleton,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local Aa, p;
    
    if IsInitial( A ) then
        Error( "the input A is empty\n" );
    elif IsObjectInZariskiCoframe( A ) then
        TryNextMethod( );
    fi;
    
    Aa := AffineApproximation( A );
    
    p := AClosedSingleton( Aa );
    
    if IsIdenticalObj( CapCategory( p ), CapCategory( Closure( A ) ) ) then
        return p;
    fi;
    
    p := ClosureOfProjection( p );
    
    Assert( 4, IsClosed( p ) );
    SetIsClosedSubobject( p, true );
    SetClosure( p, p );
    
    return p;
    
end );

##
InstallMethod( PseudoIteratorOfClosedSingletons,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local iter;
    
    iter := rec( variety := A );
    
    iter.NextIterator :=
      function( iter )
        local A, p;
        
        A := iter!.variety;
        
        p := AClosedSingleton( A );
        
        iter!.variety := A - p;
        
        return p;
        
    end;
    
    iter.IsDoneIterator :=
      iter -> IsInitial( iter!.variety );
    
    iter.ViewObj :=
      function( iter )
        Print( "<iterator of closed singletons of " );
        ViewObj( iter!.variety );
        Print( ">" );
    end;
    
    iter.ShallowCopy :=
      function( iter )
        local iter_copy;
        
        iter_copy := rec( );
        
        iter_copy!.variety := iter!.variety;
        iter_copy!.NextIterator := iter!.NextIterator;
        iter_copy!.IsDoneIterator := iter!.IsDoneIterator;
        iter_copy!.ViewObj := iter!.ViewObj;
        iter_copy!.ShallowCopy := iter!.ShallowCopy;
        
        return iter_copy;
        
    end;
    
    return IteratorByFunctions( iter );
    
end );

##
InstallMethod( RingEpimorphismOfAClosedPoint,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local singleton, map, R, S;
    
    singleton := AClosedSingleton( A );
    
    map := RingEpimorphismOfClosure( singleton );
    
    A := Closure( A );
    
    R := UnderlyingRing( A );
    
    A := UnderlyingStandardColumn( A );
    
    S := Range( map );
    
    map := ImagesOfRingMapAsColumnMatrix( map );
    
    map := RingMap( map, R / A, S );
    
    SetIsMorphism( map, true );
    
    map!.singleton := singleton;
    
    return map;
    
end );

##
InstallMethod( AClosedPoint,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    
    return ImagesOfRingMapAsColumnMatrix( RingEpimorphismOfAClosedPoint( A ) );
    
end );

##
InstallMethod( AClosedPoint,
        "for an object in a thin category",
        [ IsObjectInThinCategory and HasParametrizedObject ],
        
  function( A )
    
    return Pullback( RingEpimorphismOfAClosedPoint( A ), ParametrizedObject( A ) );
    
end );

##
InstallMethod( PseudoIteratorOfClosedPoints,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local iter;
    
    iter := rec( variety := A );
    
    iter.NextIterator :=
      function( iter )
        local A, phi, s, p, A_s;
        
        A := iter!.variety;
        
        phi := RingEpimorphismOfAClosedPoint( A );
        s := phi!.singleton;
        
        if HasParametrizedObject( A ) then
            p := Pullback( phi, ParametrizedObject( A ) );
        else
            p := ImagesOfRingMapAsColumnMatrix( phi );
        fi;
        
        A_s := A - s;
        
        if HasParametrizedObject( A ) then
            SetParametrizedObject( A_s, ParametrizedObject( A ) );
        fi;
        
        iter!.variety := A_s;
        
        return p;
        
    end;
    
    iter.IsDoneIterator :=
      iter -> IsInitial( iter!.variety );
    
    iter.ViewObj :=
      function( iter )
        Print( "<iterator of closed points of " );
        ViewObj( iter!.variety );
        Print( ">" );
    end;
    
    iter.ShallowCopy :=
      function( iter )
        local iter_copy;
        
        iter_copy := rec( );
        
        iter_copy!.variety := iter!.variety;
        iter_copy!.NextIterator := iter!.NextIterator;
        iter_copy!.IsDoneIterator := iter!.IsDoneIterator;
        iter_copy!.ViewObj := iter!.ViewObj;
        iter_copy!.ShallowCopy := iter!.ShallowCopy;
        
        return iter_copy;
        
    end;
    
    return IteratorByFunctions( iter );
    
end );

##
InstallMethod( CanonicalObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  LocallyClosedPart );

##
InstallMethod( StandardMinuendAndSubtrahendInUnderlyingHeytingOrCoHeytingAlgebra,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    
    A := NormalizedMinuendAndSubtrahendInUnderlyingHeytingOrCoHeytingAlgebra( A );
    
    List( A, StandardizeObject );
    
    return A;
    
end );

##
InstallMethod( RabinowitschCover,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    
    return RabinowitschCover( A, A.I );
    
end );

##
InstallMethod( RabinowitschCover,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    return RabinowitschCover( AsSingleDifference( A ) );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    Print( ViewString( A ) );
    
end );

##
InstallMethod( String,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  ViewString );

##
InstallMethod( Display,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    Display( DisplayString( A ) );
    
end );
