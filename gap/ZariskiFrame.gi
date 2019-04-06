#
# ZariskiFrames: Frames of Zariski open subsets
#
# Implementations
#

##
InstallGlobalFunction( IsHomSetInhabitedForFramesUsingCategoryOfRows,
  function( S, T )
    
    if HasDimensionOfComplement( S ) and HasDimensionOfComplement( T ) and
       DimensionOfComplement( S ) < DimensionOfComplement( T ) then
        return false;
    fi;
    
    S := MorphismOfUnderlyingCategory( S );
    T := MorphismOfUnderlyingCategory( T );
    
    return IsLiftable( S, T );
    
end );

##
InstallGlobalFunction( IsEqualForObjectsIfIsHomSetInhabitedForFramesUsingCategoryOfRows,
  function( S, T )
    
    S := UnderlyingMatrix( MorphismOfUnderlyingCategory( S ) );
    T := UnderlyingMatrix( MorphismOfUnderlyingCategory( T ) );
    
    return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
    
end );

##
InstallMethod( IsSubset,
        "for two objects in a Zariski frame",
        [ IsObjectInZariskiFrame, IsObjectInZariskiFrame ],

  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
end );

##
InstallMethod( ComplementAsClosedSubset,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    local C;
    
    C := CapCategory( A )!.ZariskiCoframe;
    
    if HasStandardMorphismOfUnderlyingCategory( A ) then
        A := StandardMorphismOfUnderlyingCategory( A );
        return C!.ConstructorByStandardMorphism( A );
    elif HasReducedMorphismOfUnderlyingCategory( A ) then
        A := ReducedMorphismOfUnderlyingCategory( A );
        return C!.ConstructorByReducedMorphism( A );
    fi;
    
    A := PreMorphismOfUnderlyingCategory( A );
    return C!.Constructor( A );
    
end );

##
InstallMethod( Closure,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCartesianClosedCategory( H ) and IsCartesianClosedCategory( H ) then
        return ComplementAsClosedSubset( NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( A )[2] );
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( AsDifferenceOfClosed,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    
    return -ComplementAsClosedSubset( A );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    local I, n, j;
    
    I := ValueOption( "Locales_name" );
    
    if I = fail then
        I := "<...>";
    fi;
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    j := ValueOption( "Locales_counter" );
    
    if j = fail then
        j := "";
    else
        j := Concatenation( "_", String( j ) );
    fi;
    
    Print( "D_{", RingName( UnderlyingRing( A ) ), "}( ", I, n, j, " )" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    
    return Concatenation(
                   "D( <",
                   JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) ), String ) ),
                   "> )" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame and IsInitial ],

  function( A )
    
    return "∅";
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    
    Display( DisplayString( A ) );
    
end );
