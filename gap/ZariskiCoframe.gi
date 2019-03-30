#
# ZariskiFrames: Coframes of Zariski closed subsets
#
# Implementations
#

##
InstallMethod( IsSubset,
        "for two objects in a Zariski coframe",
        [ IsObjectInZariskiCoframe, IsObjectInZariskiCoframe ],

  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
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
    
    components := List( components, ZC!.ConstructorReducedMorphism );
    
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
        Print( " ⋃ " );
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
        str := Concatenation( str, " ⋃ ", DisplayString( C ) );
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
