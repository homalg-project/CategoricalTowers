#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

SetInfoLevel( InfoZariskiFrames, 1 );

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
    local mat;
    
    mat := UnderlyingMatrix( ReducedMorphismOfUnderlyingCategory( A ) );
    
    return AsCategoryOfRowsMorphism( BasisOfRows( mat ) );
    
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
        
        if not RankOfObject( Range( A ) ) = 1 then
            return false;
        fi;
        
        return IsWellDefined( A );
        
    end );
    
end );

##
InstallGlobalFunction( INTERSECTION_OF_IDEALS_USING_CategoryOfRows,
  function( L )
    local biased_weak_fiber_product;
    
    biased_weak_fiber_product := function( I, J )
        return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
    end;
    
    return Iterated( L, biased_weak_fiber_product );
    
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
    
    ReducedMorphismOfUnderlyingCategory( A );
    
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
    
    t := "inv_";
    
    R_f := R * [ t ];
    
    t := t / R_f;
    Ap := Ap / R_f;
    
    A := A.I;
    
    C := CapCategory( A );
    
    A := UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) );
    
    A := R_f * A;
    
    A := UnionOfRows( A, HomalgMatrix( [ Ap * t - 1 ], 1, 1, R_f ) );
    
    A := ClosedSubsetOfFiberedSpecByReducedMorphism( A );
    
    A!.auxiliary_indeterminate := t;
    
    return A;
    
end );

##
InstallMethod( RingMorphismOfClosure,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local R;
    
    A := Closure( A );
    
    R := UnderlyingRing( A );
    
    A := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( A ) );
    
    return RingMapOntoSimplifiedResidueClassRing( R / A );
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and an object in a Zariski frame or coframe",
        [ IsHomalgRingMap, IsObjectInZariskiFrameOrCoframe ],
        
  function( phi, A )
    local C, B;
    
    C := CapCategory( A );
    
    B := Pullback( phi, UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
    if HasIsIsomorphism( phi ) and IsIsomorphism( phi ) then
        if HasStandardMorphismOfUnderlyingCategory( A ) then
            return C!.ConstructorByStandardMorphism( B );
        elif HasReducedMorphismOfUnderlyingCategory( A ) then
            return C!.ConstructorReducedMorphism( B );
        fi;
    fi;
    
    B := C!.Constructor( B );
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( phi, ParametrizedObject( A ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( Pullback,
        "for a homalg ring map and an object in a meet-semilattice of formal single differences",
        [ IsHomalgRingMap, IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( phi, A )
    local B;
    
    B := List( NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( A ), a -> Pullback( phi, a ) );
    
    return B[1] - B[2];
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( phi, ParametrizedObject( A ) ) );
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
    
    B := CallFuncList( AsFormalMultipleDifference, B );
    
    if HasParametrizedObject( A ) then
        SetParametrizedObject( B, Pullback( phi, ParametrizedObject( A ) ) );
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
        SetParametrizedObject( B, Pullback( phi, ParametrizedObject( A ) ) );
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
        SetParametrizedObject( B, Pullback( phi, ParametrizedObject( A ) ) );
    fi;
    
    return B;
    
end );

##
InstallMethod( EmbedInSmallerAmbientSpace,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local phi, S, T;
    
    StandardizeObject( A );
    
    phi := RingMorphismOfClosure( A );
    
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
InstallMethod( RingMorphismOfAClosedPoint,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local singleton, map, R, S;
    
    singleton := AClosedSingleton( A );
    
    map := RingMorphismOfClosure( singleton );
    
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
    
    return ImagesOfRingMapAsColumnMatrix( RingMorphismOfAClosedPoint( A ) );
    
end );

##
InstallMethod( AClosedPoint,
        "for an object in a thin category",
        [ IsObjectInThinCategory and HasParametrizedObject ],
        
  function( A )
    
    return Pullback( RingMorphismOfAClosedPoint( A ), ParametrizedObject( A ) );
    
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
        
        phi := RingMorphismOfAClosedPoint( A );
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
