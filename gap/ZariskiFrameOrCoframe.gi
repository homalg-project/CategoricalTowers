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
InstallMethod( AClosedSingleton,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    local Ac, C, R, indets, R_f, emb;
    
    if IsInitial( A ) then
        Error( "the input A is empty\n" );
    elif IsObjectInZariskiCoframe( A ) then
        TryNextMethod( );
    fi;
    
    Ac := Closure( A );
    
    C := CapCategory( Ac );
    
    R := UnderlyingRing( Ac );
    
    A := AffineApproximation( A );
    
    A := AClosedSingleton( A );
    
    return ImageClosureOfProjection( A );
    
end );

##
InstallMethod( IteratorOfClosedSingletons,
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
    local singleton, s, R, indets, matrix, point, zero_rows, new_indets,
          k, S, map, rel, char;
    
    singleton := AClosedSingleton( A );
    
    s := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( singleton ) );
    
    R := UnderlyingRing( singleton );
    
    indets := Indeterminates( R );
    
    matrix := HomalgMatrix( indets, Length( indets ), 1, R );
    
    point := DecideZero( matrix, s );
    
    zero_rows := ZeroRows( matrix - point );
    
    new_indets := indets{zero_rows};
    
    k := CoefficientsRing( R );
    
    S := k * List( new_indets, String );
    
    if not zero_rows = [ ] then
        map := RingMap( new_indets, S, R / s );
        rel := GeneratorsOfKernelOfRingMap( map );
        if HasIsIntegersForHomalg( k ) and IsIntegersForHomalg( k ) then
            char := Eliminate( rel );
            if not IsZero( char ) then
                char := EntriesOfHomalgMatrix( char );
                char := List( char, a -> EvalString( String( a ) ) );
                char := Gcd( char );
                if not IsPrime( char ) then
                    Error( "a closed point cannot be defined over a mixed characteristic, here ", char, "\n" );
                fi;
                k := HomalgRingOfIntegersInUnderlyingCAS( char, k );
                S := k * List( new_indets, String );
                rel := S * rel;
                rel := BasisOfRows( rel );
            fi;
        fi;
        S := S / rel;
    fi;
    
    point := S * point;
    
    A := Closure( A );
    
    A := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( A ) );
    
    map := RingMap( point, R / A, S );
    
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
