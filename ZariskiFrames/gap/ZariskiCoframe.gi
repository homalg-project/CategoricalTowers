# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallGlobalFunction( IsHomSetInhabitedForCoframes,
  function( cat, S, T )
    local irrS, irrT;
    
    if Dimension( S ) > Dimension( T ) then
        return false;
    fi;
    
    if HasIrreducibleComponents( S ) then
        irrS := IrreducibleComponents( S );
        if Length( irrS ) > 1 then
            return ForAll( irrS, C -> IsHomSetInhabited( cat, C, T ) );
        fi;
    fi;
    
    if HasIrreducibleComponents( T ) and
       HasIsIrreducibleObjectInZariskiCoframe( S ) and IsIrreducibleObjectInZariskiCoframe( S ) then
        irrT := IrreducibleComponents( T );
        if Length( irrT ) > 1 then
            return ForAny( irrT, C -> IsHomSetInhabited( cat, S, C ) );
        fi;
    fi;
    
    S := BestUnderlyingColumn( S );
    T := UnderlyingColumn( T );
    
    ## since S is now guaranteed to be radical:
    return IsZero( DecideZeroRows( T, S ) );
    
end );

##
InstallGlobalFunction( IsEqualForObjectsIfIsHomSetInhabitedForCoframes,
  function( cat, S, T )
    
    if Dimension( S ) < Dimension( T ) then
        return false;
    fi;
    
    S := BestUnderlyingColumn( S );
    T := BestUnderlyingColumn( T );
    
    ## needs S, T to be radical
    return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
    
end );

##
InstallMethod( NormalizedDistinguishedSubtrahend,
        "for a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences and HasPreDistinguishedSubtrahend ],
        
  function( A )
    local T, C, S;
    
    T := A.I;
    
    if not IsObjectInZariskiCoframe( T ) then
        TryNextMethod( );
    fi;
    
    C := CapCategory( T );
    
    T := BestUnderlyingColumn( T );
    
    S := PreDistinguishedSubtrahend( A );
    
    S := BestUnderlyingColumn( S );
    
    S := DecideZeroRows( S, T );
    
    return C!.Constructor( S );
    
end );

##
InstallMethod( Degree,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  DegreeAttr );

##
InstallOtherMethod( Closure,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  IdFunc );

##
InstallOtherMethod( LocallyClosedPart,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  StandardizeObject );

##
InstallOtherMethod( DistinguishedLocallyClosedPart,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  LocallyClosedPart );

##
InstallMethod( DistinguishedLocallyClosedPart,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function ( A )
    local param, Ap, C, a, nonzero_rows;
    
    if not IsObjectInZariskiCoframe( A.I ) then
        TryNextMethod( );
    fi;
    
    if HasParametrizedObject( A ) then
        param := ParametrizedObject( A );
    fi;
    
    NormalizeObject( A );
    
    Ap := A.J;
    
    if IsInitial( Ap ) then
        Ap := InitialObject( CapCategory( Ap ) );
    elif HasPreDistinguishedSubtrahend( A ) or HasNormalizedDistinguishedSubtrahend( A ) then
        Ap := DistinguishedSubtrahend( A );
    fi;
    
    A := A.I;
    
    C := CapCategory( A );
    
    a := UnderlyingStandardColumn( A );
    Ap := BestUnderlyingColumn( Ap );
    
    Ap := DecideZeroRows( Ap, a );
    
    nonzero_rows := NonZeroRows( Ap );
    
    if nonzero_rows = [ ] then
        Error( "no nonzero rows after reducing Ap with A\n" );
    fi;
    
    nonzero_rows := nonzero_rows{[1]};
    
    Ap := CertainRows( Ap, nonzero_rows );
    
    A := A - C!.ConstructorByRadicalColumn( Ap );
    
    if IsBound( param ) then
        SetParametrizedObject( A, param );
    fi;
    
    return A;
    
end );

##
InstallMethod( DistinguishedLocallyClosedPart,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function ( A )
    local param, Ac, C, d, D, nonzero_rows;
    
    if not IsObjectInZariskiCoframe( A[1].I ) then
        TryNextMethod( );
    fi;
    
    StandardizeObject( A );
    
    if IsInitial( A ) then
        return A;
    fi;
    
    if HasParametrizedObject( A ) then
        param := ParametrizedObject( A );
    fi;
    
    Ac := Closure( A );
    
    C := CapCategory( Ac );
    
    Ac := UnderlyingStandardColumn( Ac );
    
    d := [ ];
    
    for D in A do
        
        if IsInitial( D.J ) then
            D := InitialObject( CapCategory( D.J ) );
        elif HasPreDistinguishedSubtrahend( D ) or HasNormalizedDistinguishedSubtrahend( D ) then
            D := DistinguishedSubtrahend( D );
        else
            D := D.J;
        fi;
        
        D := BestUnderlyingColumn( D );
        
        D := DecideZeroRows( D, Ac );
        
        nonzero_rows := NonZeroRows( D );
        
        if nonzero_rows = [ ] then
            Error( "no nonzero rows after reducing D with Ac\n" );
        fi;
        
        D := D[ nonzero_rows[1], 1 ];
        
        if IsUnit( D ) then
            continue;
        fi;
        
        D := IrreducibleFactors( D );
        
        Append( d, D );
        
    od;
    
    d := Set( d );
    
    d := List( d, C!.ConstructorByRadicalColumn );
    
    d := DuplicateFreeList( d );
    
    A := Closure( A );
    
    if d = [ ] then
        d := [ InitialObject( CapCategory( A ) ) ];
    fi;
    
    A := List( d, s -> A - s );
    A := CallFuncList( AsMultipleDifference, A );
    
    if IsBound( param ) then
        SetParametrizedObject( A, param );
    fi;
    
    return A;
    
end );

##
InstallMethod( IrreducibleComponents,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function ( A )
    local components, ZC;
    
    components := UnderlyingListOfColumns( A );
    
    components := List( components, RadicalDecompositionOp );
    
    components := Concatenation( components );
    
    components := DuplicateFreeList( components );
    
    ZC := CapCategory( A );
    
    components := List( components, ZC!.ConstructorByRadicalColumn );
    
    components := MaximalObjects( components, IsHomSetInhabited );
    
    SetIsIrreducibleObjectInZariskiCoframe( A, Length( components ) <= 1 );
    
    Perform( components, function( C ) SetIsIrreducibleObjectInZariskiCoframe( C, true ); end );
    
    if Length( components ) = 1 then
        if not HasUnderlyingRadicalColumn( A ) then
            SetUnderlyingRadicalColumn( A, UnderlyingRadicalColumn( components[1] ) );
        fi;
        return [ A ];
    fi;
    
    if HasParametrizedObject( A ) then
        Perform( components, function( component ) SetParametrizedObject( component, ParametrizedObject( A ) ); end );
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
InstallOtherMethod( FactorizeObject,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    IrreducibleComponents( A );
    
    return A;
    
end );

##
InstallOtherMethod( Dimension,
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
InstallMethod( KnownFactors,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function ( A )
    local components, ZC;
    
    components := UnderlyingListOfColumns( A );
    
    ## FIXME: this is a hack which has to be replaced by the proper inclusion
    components := MaximalObjects( components, {a,b} -> IsZero( DecideZeroRows( b, a ) ) );
    A!.UnderlyingListOfColumns := components;
    ## FIXME
    
    ZC := CapCategory( A );
    
    if HasUnderlyingListOfStandardColumns( A ) then
        components := List( components, ZC!.ConstructorByStandardColumn );
    elif HasUnderlyingListOfRadicalColumns( A ) then
        components := List( components, ZC!.ConstructorByRadicalColumn );
    else
        components := List( components, ZC!.Constructor );
    fi;
    
    if HasIsInitial( A ) and Length( components ) = 1 then
        SetIsInitial( components[1], IsInitial( A ) );
    fi;
    
    return components;
    
end );

##
InstallMethod( ViewString,
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
    
    return Concatenation( "V_{", RingName( UnderlyingRing( A ) ), "}( ", I, String( n ), j, i, " )" );
    
end );

##
InstallMethod( ViewString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and HasIrreducibleComponents ],
        
  function( A )
    local irr, i, str;
    
    irr := IrreducibleComponents( A );
    
    if Length( irr ) <= 1 then
        TryNextMethod( );
    fi;
    
    str := "{ ";
    
    Append( str, ViewString( irr[1] : component_counter := 1 ) );
    
    for i in [ 2 .. Length( irr ) ] do
        Append( str, " ∪ " );
        Append( str, ViewString( irr[i] : component_counter := i ) );
    od;
    
    Append( str, " }" );
    
    return str;
    
end );

##
InstallMethod( String,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  ViewString );

##
InstallMethod( DisplayString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    local L, str, l, C;
    
    L := UnderlyingListOfColumns( A );
    
    str := "";
    
    l := Length( L );
    
    if l > 1 then
        Append( str, "{ " );
    fi;
    
    Append( str, "V( <" );
    Append( str, JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( L[1] ), String ) ) );
    Append( str, "> )" );
    
    for C in L{[ 2 .. l ]} do
        Append( str, " ∪ " );
        Append( str, "V( <" );
        Append( str, JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( C ), String ) ) );
        Append( str, "> )" );
    od;
    
    if l > 1 then
        Append( str, " }" );
    fi;
    
    return str;
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and HasIrreducibleComponents ],
        
  function( A )
    local irr, l, C, str;
    
    irr := IrreducibleComponents( A );
    
    l := Length( irr );
    
    if l <= 1 then
        TryNextMethod( );
    fi;
    
    str := "{ ";
    
    Append( str, DisplayString( irr[1] ) );
    
    for C in irr{[ 2 .. l ]} do
        Append( str, " ∪ " );
        Append( str, DisplayString( C ) );
    od;
    
    Append( str, " }" );
    
    return str;
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe and IsInitial ],
        
  function( A )
    
    return "∅";
    
end );
