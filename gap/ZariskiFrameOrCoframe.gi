#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

SetInfoLevel( InfoZariskiFrames, 1 );

##
InstallGlobalFunction( ITERATED_INTERSECTION_OF_IDEALS_USING_CategoryOfRows,
  function( L )
    local biased_weak_fiber_product;
    
    if Length( L ) = 1 then
        return L[1];
    fi;
    
    biased_weak_fiber_product := function( I, J )
        return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
    end;
    
    return Iterated( L, biased_weak_fiber_product );
    
end );

##
InstallGlobalFunction( INTERSECTION_OF_IDEALS_USING_CategoryOfRows,
  function( L )
    local id;
    
    if Length( L ) = 1 then
        return L[1];
    fi;
    
    id := IdentityMorphism( Range( L[1] ) );
    
    id := ListWithIdenticalEntries( Length( L ), id );
    
    id := UniversalMorphismIntoDirectSum( id );
    
    L := DirectSumFunctorial( L );
    
    return ProjectionOfBiasedWeakFiberProduct( id, L );
    
end );

##
InstallMethod( ListOfMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasPreMorphismOfUnderlyingCategory ],

  function( A )
    local g, R, C, D;
    
    A := PreMorphismOfUnderlyingCategory( A );
    
    g := RankOfObject( Range( A ) );
    
    R := CategoryOfRowsObject( 1, CapCategory( A ) );
    
    if g = 0 then
        return [ IdentityMorphism( R ) ];
    elif g = 1 then
        return [ A ];
    fi;
    
    D := ListWithIdenticalEntries( g, R );
    
    A := List( [ 1 .. g ], i -> PreCompose( A, ProjectionInFactorOfDirectSum( D, i ) ) );
    
    A := DuplicateFreeList( A );
    
    return A;
    
end );

##
InstallMethod( MorphismOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  function( A )
    
    A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    return ITERATED_INTERSECTION_OF_IDEALS_USING_CategoryOfRows( A );
    
end );

##
InstallMethod( MorphismOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasReducedMorphismOfUnderlyingCategory ],

  ReducedMorphismOfUnderlyingCategory );

##
InstallMethod( MorphismOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasStandardMorphismOfUnderlyingCategory ],

  StandardMorphismOfUnderlyingCategory );

##
InstallMethod( ListOfMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasReducedMorphismOfUnderlyingCategory ],

  function( A )
    
    return [ ReducedMorphismOfUnderlyingCategory( A ) ];
    
end );

##
InstallMethod( ListOfMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasStandardMorphismOfUnderlyingCategory ],

  function( A )
    
    return [ StandardMorphismOfUnderlyingCategory( A ) ];
    
end );

##
InstallMethod( ListOfMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasListOfReducedMorphismsOfUnderlyingCategory ],

  ListOfReducedMorphismsOfUnderlyingCategory );

##
InstallMethod( ListOfMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasListOfStandardMorphismsOfUnderlyingCategory ],

  ListOfStandardMorphismsOfUnderlyingCategory );

##
InstallMethod( ListOfStandardMorphismsOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    local L;
    
    L := ListOfReducedMorphismsOfUnderlyingCategory( A );
    
    L := List( L, UnderlyingMatrix );
    
    L := List( L, BasisOfRows );
    
    L := List( L, AsCategoryOfRowsMorphism );
    
    if HasListOfMorphismsOfRank1RangeOfUnderlyingCategory( A ) then
        A!.ListOfMorphismsOfRank1RangeOfUnderlyingCategory := L;
    else
        SetListOfMorphismsOfRank1RangeOfUnderlyingCategory( A, L );
    fi;
    
    A!.ListOfMorphismsOfRank1RangeOfUnderlyingCategory := L;
    
    return L;
    
end );

##
InstallMethod( ReducedMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  function( A )
    local L;
    
    L := ListOfReducedMorphismsOfUnderlyingCategory( A );
    
    L := ITERATED_INTERSECTION_OF_IDEALS_USING_CategoryOfRows( L );
    
    if HasMorphismOfRank1RangeOfUnderlyingCategory( A ) then
        A!.MorphismOfRank1RangeOfUnderlyingCategory := L;
    else
        SetMorphismOfRank1RangeOfUnderlyingCategory( A, L );
    fi;
    
    return L;
    
end );

##
InstallMethod( ReducedMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasStandardMorphismOfUnderlyingCategory ],

  StandardMorphismOfUnderlyingCategory );

##
InstallMethod( MorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  ReducedMorphismOfUnderlyingCategory );

##
InstallMethod( StandardMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  function( A )
    local mor;
    
    mor := ReducedMorphismOfUnderlyingCategory( A );
    
    mor := UnderlyingMatrix( mor );
    
    mor := BasisOfRows( mor );
    
    mor := AsCategoryOfRowsMorphism( mor );
    
    if HasMorphismOfRank1RangeOfUnderlyingCategory( A ) then
        A!.MorphismOfRank1RangeOfUnderlyingCategory := mor;
    else
        SetMorphismOfRank1RangeOfUnderlyingCategory( A, mor );
    fi;
    
    A!.ReducedMorphismOfUnderlyingCategory := mor;
    
    return mor;
    
end );

##
InstallMethod( MorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasStandardMorphismOfUnderlyingCategory ],

  StandardMorphismOfUnderlyingCategory );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows,
  function( zariski_frame_or_coframe )
    
    ##
    AddIsWellDefinedForObjects( zariski_frame_or_coframe,
      function( A )
        
        A := MorphismOfUnderlyingCategory( A );
        
        return IsWellDefined( A );
        
    end );
    
    ##
    AddIsTerminal( zariski_frame_or_coframe,
      function( A )
        
        ## IsEqualForObjectsIfIsHomSetInhabited would trigger
        ## IsEqualForObjectsIfIsHomSetInhabitedForFrames/CoframesUsingCategoryOfRows
        ## which is for this context unnecessary and expensive
        return IsHomSetInhabited( TerminalObject( A ), A );
        
    end );
    
    ##
    AddIsInitial( zariski_frame_or_coframe,
      function( A )
        
        ## IsEqualForObjectsIfIsHomSetInhabited would trigger
        ## IsEqualForObjectsIfIsHomSetInhabitedForFrames/CoframesUsingCategoryOfRows
        ## which is for this context unnecessary and expensive
        return IsHomSetInhabited( A, InitialObject( A ) );
        
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

##
InstallMethod( NormalizeObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    ListOfReducedMorphismsOfUnderlyingCategory( A );
    
    IsInitial( A );
    IsTerminal( A );
    
    return A;
    
end );

##
InstallMethod( StandardizeObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    StandardMorphismOfUnderlyingCategory( A );
    
    IsInitial( A );
    IsTerminal( A );
    
    return A;
    
end );

##
InstallMethod( DistinguishedLocallyClosedApproximation,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return DistinguishedLocallyClosedApproximation( LocallyClosedApproximation( A ) );
    
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
    
    A := DistinguishedLocallyClosedApproximation( A );
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        A := AsDifference( A );
    fi;
    
    Ap := A.J;
    
    R := UnderlyingRing( Ap );
    
    Ap := UnderlyingMatrix( MorphismOfUnderlyingCategory( Ap ) );
    
    Ap := MatElm( Ap, 1, 1 );
    
    indets := Indeterminates( R );
    
    indets := List( indets, String );
    
    t := UnusedVariableName( R, "inv" );
    
    R_f := R * [ t ];
    
    t := t / R_f;
    Ap := Ap / R_f;
    
    A := A.I;
    
    C := CapCategory( A );
    
    A := UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) );
    
    A := R_f * A;
    
    A := UnionOfRows( A, HomalgMatrix( [ Ap * t - 1 ], 1, 1, R_f ) );
    
    A := ClosedSubsetOfSpecByReducedMorphism( A );
    
    A!.auxiliary_indeterminate := t;
    
    return A;
    
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
    
    A := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( A ) );
    
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
            C := ZariskiCoframeOfProjUsingCategoryOfRows( T );
        elif HasZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( Source( phi ) ) then
            C := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( T );
        else
            C := CapCategory( A );
        fi;
    else
        if IsObjectInZariskiFrameOfAProjectiveVariety( A ) and IsHomalgGradedRing( T ) then
            C := ZariskiFrameOfProjUsingCategoryOfRows( T );
        elif HasZariskiFrameOfAffineSpectrumUsingCategoryOfRows( Source( phi ) ) then
            C := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( T );
        else
            C := CapCategory( A );
        fi;
    fi;
    
    B := Pullback( phi, UnderlyingMatrix( MorphismOfRank1RangeOfUnderlyingCategory( A ) ) );
    
    if HasIsIsomorphism( phi ) and IsIsomorphism( phi ) then
        if HasStandardMorphismOfUnderlyingCategory( A ) then
            return C!.ConstructorByStandardMorphism( B );
        elif HasReducedMorphismOfUnderlyingCategory( A ) then
            return C!.ConstructorByReducedMorphism( B );
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
    
    B := List( PairInUnderlyingLattice( A ), a -> Pullback( phi, a ) );
    
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
        [ IsHomalgRingMap, IsConstructibleObjectAsUnionOfDifferences ],
        
  function( phi, A )
    local B;
    
    A := List( A, a -> Pullback( phi, a ) );
    
    B := CallFuncList( UnionOfDifferences, A );
    
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
    
    B := CallFuncList( UnionOfMultipleDifferences, A );
    
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
    
    p := ImageClosureOfProjection( p );
    
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
    
    A := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( A ) );
    
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
        
  LocallyClosedApproximation );

##
InstallMethod( StandardPairInUnderlyingHeytingOrCoHeytingAlgebra,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    
    A := NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( A );
    
    List( A, StandardizeObject );
    
    return A;
    
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
InstallMethod( DisplayString,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and IsInitial ],

  function( A )
    
    return "∅";
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  function( A )
    
    Display( DisplayString( A ) );
    
end );
