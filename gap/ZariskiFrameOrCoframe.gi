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
        "for two objects in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe, IsObjectInZariskiFrameOrCoframe ],
        
  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
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
InstallMethod( AClosedPoint,
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
    
    A := AClosedPoint( A );
    
    return ImageClosureOfProjection( A );
    
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
