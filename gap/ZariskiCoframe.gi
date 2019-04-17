#
# ZariskiFrames: Coframes of Zariski closed subsets
#
# Implementations
#

##
InstallGlobalFunction( IsHomSetInhabitedForCoframesUsingCategoryOfRows,
  function( S, T )
    local irrS, irrT;
    
    if HasDimension( S ) and HasDimension( T ) and
       Dimension( S ) > Dimension( T ) then
        return false;
    fi;
    
    if HasIrreducibleComponents( S ) then
        irrS := IrreducibleComponents( S );
        if Length( irrS ) > 1 then
            return ForAll( irrS, C -> IsHomSetInhabited( C, T ) );
        fi;
    fi;
    
    if HasIrreducibleComponents( T ) and
       HasIsIrreducibleObjectInZariskiCoframe( S ) and IsIrreducibleObjectInZariskiCoframe( S ) then
        irrT := IrreducibleComponents( T );
        if Length( irrT ) > 1 then
            return ForAny( irrT, C -> IsHomSetInhabited( S, C ) );
        fi;
    fi;
    
    S := MorphismOfUnderlyingCategory( S );
    T := MorphismOfUnderlyingCategory( T );
    
    return IsLiftable( T, S );
    
end );

##
InstallGlobalFunction( IsEqualForObjectsIfIsHomSetInhabitedForCoframesUsingCategoryOfRows,
  function( S, T )
    
    S := UnderlyingMatrix( MorphismOfUnderlyingCategory( S ) );
    T := UnderlyingMatrix( MorphismOfUnderlyingCategory( T ) );
    
    return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
    
end );

##
InstallMethod( Degree,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  DegreeAttr );

##
InstallMethod( Closure,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  IdFunc );

##
InstallMethod( LocallyClosedApproximation,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  StandardizeObject );

##
InstallMethod( DistinguishedLocallyClosedApproximation,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  LocallyClosedApproximation );

##
InstallMethod( DistinguishedLocallyClosedApproximation,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function ( A )
    local Ap, C, a, nonzero_rows;
    
    if not IsObjectInZariskiCoframe( A.I ) then
        TryNextMethod( );
    fi;
    
    NormalizeObject( A );
    
    Ap := A.J;
    A := A.I;
    
    C := CapCategory( A );
    
    a := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( A ) );
    Ap := UnderlyingMatrix( MorphismOfUnderlyingCategory( Ap ) );
    
    Ap := DecideZeroRows( Ap, a );
    
    nonzero_rows := NonZeroRows( Ap );
    
    if nonzero_rows = [ ] then
        Error( "no nonzero rows after reducing Ap with A\n" );
    fi;
    
    nonzero_rows := nonzero_rows{[1]};
    
    Ap := CertainRows( Ap, nonzero_rows );
    
    return A - C!.ConstructorByReducedMorphism( Ap );
    
end );

##
InstallMethod( DistinguishedLocallyClosedApproximation,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function ( A )
    local Ap, C, a, nonzero_rows;
    
    if not IsObjectInZariskiCoframe( A[1].I ) then
        TryNextMethod( );
    fi;
    
    StandardizeObject( A );
    
    Ap := List( A, a -> a.J );
    
    A := A.I;
    
    C := CapCategory( A );
    
    a := UnderlyingMatrix( StandardMorphismOfUnderlyingCategory( A ) );
    
    Ap := List( Ap, ap -> UnderlyingMatrix( MorphismOfUnderlyingCategory( ap ) ) );
    
    Ap := List( Ap, ap -> DecideZeroRows( ap, a ) );
    
    nonzero_rows := List( Ap, NonZeroRows );
    
    if [ ] in nonzero_rows then
        Error( "no nonzero rows after reducing Ap with A\n" );
    fi;
    
    nonzero_rows := List( nonzero_rows, a -> a{[1]} );
    
    Ap := ListN( Ap, nonzero_rows, function( ap, nz ) return MatElm( ap, nz[1], 1 ); end );
    
    Ap := Filtered( Ap, a -> not IsUnit( a ) );
    
    Ap := Concatenation( List( Ap, Factors ) );
    
    Ap := Set( Ap );
    
    Ap := List( Ap, C!.ConstructorByReducedMorphism );
    
    Ap := DuplicateFreeList( Ap );
    
    if not Ap = [ ] then
        A := List( Ap, ap -> A - ap );
        A := CallFuncList( AsFormalMultipleDifference, A );
    fi;
    
    return A;
    
end );

##
InstallMethod( IrreducibleComponents,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function ( A )
    local components, ZC;
    
    components := RadicalDecompositionOp( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
    SetIsIrreducibleObjectInZariskiCoframe( A, Length( components ) <= 1 );
    
    ZC := CapCategory( A );
    
    components := List( components, ZC!.ConstructorByReducedMorphism );
    
    Perform( components, function( C ) SetIsIrreducibleObjectInZariskiCoframe( C, true ); end );
    
    if Length( components ) = 1 then
        if not HasReducedMorphismOfUnderlyingCategory( A ) then
            SetReducedMorphismOfUnderlyingCategory( A, ReducedMorphismOfUnderlyingCategory( components[1] ) );
        fi;
        return [ A ];
    fi;
    
    return components;
    
end );

##
InstallMethod( IsIrreducibleObjectInZariskiCoframe,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    return Length( IrreducibleComponents( A ) ) <= 1;
    
end );

##
InstallMethod( IsIrreducible,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  IsIrreducibleObjectInZariskiCoframe );

##
InstallMethod( \[\],
        "for an object in a Zariski coframe and an integer",
        [ IsObjectInZariskiCoframe, IsInt ],

  function( A, i )
    
    return IrreducibleComponents( A )[i];
    
end );

##
InstallMethod( Factors,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  IrreducibleComponents );

##
InstallMethod( FactorizedObject,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    IrreducibleComponents( A );
    
    return A;
    
end );

##
InstallMethod( Dimension,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and HasIrreducibleComponents ],
        
  function( A )
    local irr;
    
    irr := IrreducibleComponents( A );
    
    if Length( irr ) <= 1 then
        TryNextMethod( );
    fi;
    
    return Maximum( List( irr, Dimension ) );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function( A )
    local I, n, j, i;
    
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
    
    i := ValueOption( "component_counter" );
    
    if i = fail then
        i := "";
    else
        if I = "<...>" then
            I := "K";
        fi;
        i := Concatenation( "_", String( i ) );
    fi;
    
    Print( "V_{", RingName( UnderlyingRing( A ) ), "}( ", I, n, j, i, " )" );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and HasIrreducibleComponents ],
        
  function( A )
    local irr, i;
    
    irr := IrreducibleComponents( A );
    
    if Length( irr ) <= 1 then
        TryNextMethod( );
    fi;
    
    Print( "[ " );
    
    ViewObj( irr[1] : component_counter := 1 );
    
    for i in [ 2 .. Length( irr ) ] do
        Print( " ∪ " );
        ViewObj( irr[i] : component_counter := i );
    od;
    
    Print( " ]" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    return Concatenation(
                   "V( <",
                   JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) ), String ) ),
                   "> )" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and HasIrreducibleComponents ],
        
  function( A )
    local irr, C, str;
    
    irr := IrreducibleComponents( A );
    
    if Length( irr ) <= 1 then
        TryNextMethod( );
    fi;
    
    str := Concatenation( "[ ", DisplayString( irr[1] ) );
    
    for C in irr{[ 2 .. Length( irr ) ]} do
        str := Concatenation( str, " ∪ ", DisplayString( C ) );
    od;
    
    return Concatenation( str, " ]" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and IsInitial ],

  function( A )
    
    return "∅";
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    Display( DisplayString( A ) );
    
end );
