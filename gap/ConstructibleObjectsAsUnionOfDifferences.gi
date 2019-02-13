#
# Locales: ConstructibleObjectsAsUnionOfDifferences
#
# Implementations
#

##
InstallMethod( IsHomSetInhabitedWithTypeCast,
        "for an object in a meet-semilattice of formal differences and a constructible object as a union of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences, IsConstructibleObjectAsUnionOfDifferences ],

  function( A, B )
    local Ap, P, Bp, b;
    
    A := PairInUnderlyingLattice( A );
    
    Ap := A[2];
    A := A[1];
    
    P := CapCategory( A );
    
    B := ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( B );
    
    B := List( B, PairInUnderlyingLattice );
    
    Bp := List( B, a -> a[2] );
    B := List( B, a -> a[1] );
    
    b := Length( B );
    
    ## TODO: remove List( iterator ) once GAP supports List with an iterator as 1st argument
    return ForAll( [ 0 .. b ],
                   i -> ForAll( List( IteratorOfCombinations( [ 1 .. b ], i ) ),
                           I -> IsHomSetInhabited(
                                   DirectProduct( Concatenation( [ A ], Bp{I} ) ),
                                   Coproduct( Concatenation( [ Ap ], B{Difference( [ 1 .. b ], I )} ) ) ) ) );
    
end );

##
InstallMethod( BooleanAlgebraOfConstructibleObjectsAsUnionOfDifferences,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( P )
    local name, C;
    
    name := "The Boolean algebra of constructible objects of ";
    
    name := Concatenation( name, Name( P ) );
    
    C := CreateCapCategory( name );
    
    C!.UnderlyingCategory := P;
    C!.MeetSemilatticeOfDifferences := MeetSemilatticeOfDifferences( P );
    
    AddObjectRepresentation( C, IsConstructibleObjectAsUnionOfDifferences );
    
    AddMorphismRepresentation( C, IsMorphismBetweenConstructibleObjectsAsUnionOfDifferences );
    
    ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS( C );
    
    ##
    AddIsWellDefinedForObjects( C,
      function( A )
        local U;
        
        U := ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A );
        
        return ForAll( U, IsWellDefinedForObjects );
        
    end );
    
    ##
    AddIsHomSetInhabited( C,
      function( A, B )
        local P;
        
        P := CapCategory( A )!.UnderlyingCategory;
        
        A := ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A );
        
        return ForAll( A, M -> IsHomSetInhabitedWithTypeCast( M, B ) );
        
    end );
    
    ##
    AddTerminalObject( C,
      function( arg )
        local T;
        
        T := TerminalObject( C!.MeetSemilatticeOfDifferences );
        
        return UnionOfDifferences( T );
        
    end );
    
    ##
    AddInitialObject( C,
      function( arg )
        local I;
        
        I := InitialObject( C!.MeetSemilatticeOfDifferences );
        
        return UnionOfDifferences( I );
        
    end );
    
    ##
    AddDirectProduct( C,
      function( L )
        local l, I, U;
        
        L := List( L, ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences );
        
        l := [ 1 .. Length( L ) ];
        
        ## TODO: replace Cartesian -> IteratorOfCartesianProduct once GAP supports List with an iterator as 1st argument
        I := Cartesian( List( L, a -> [ 1 .. Length( a ) ] ) );
        
        ## the distributive law
        U := List( I, i -> DirectProduct( List( l, j -> L[j][i[j]] ) ) );
        
        return CallFuncList( UnionOfDifferences, U );
        
    end );
    
    ##
    AddCoproduct( C,
      function( L )
        
        L := List( L, ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences );
        
        ## an advantage of this this specific data structure for constructible objects
        return CallFuncList( UnionOfDifferences, Concatenation( L ) );
        
    end );
    
    Finalize( C );
    
    return C;
    
end );

##
InstallGlobalFunction( UnionOfDifferences,
  function( arg )
    local A, C;
    
    A := rec( );
    
    arg := List( arg,
                 function( A )
                   if IsConstructibleObjectAsUnionOfDifferences( A ) then
                       return ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A );
                   elif IsObjectInMeetSemilatticeOfDifferences( A ) then
                       return A;
                   elif IsObjectInThinCategory( A ) then
                       return A - 0;
                   else
                       Error( "this entry is neither a constructible set as a union of formal differences, nor a formal difference, nor a formal difference, not even an object in a thin category: ", A, "\n" );
                   fi;
               end );
    
    arg := Flat( arg );
    
    C := BooleanAlgebraOfConstructibleObjectsAsUnionOfDifferences(
                 CapCategory( PairInUnderlyingLattice( arg[1] )[1] ) );
    
    ObjectifyObjectForCAPWithAttributes( A, C,
            ListOfPreObjectsInMeetSemilatticeOfDifferences, arg
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( \+,
        "for an object in a meet-semilattice of formal differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfDifferences, IsObjectInThinCategory ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a thin category and an object in a meet-semilattice of formal differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfDifferences ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a meet-semilattice of formal differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfDifferences, IsObjectInThinCategory ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a thin category and an object in a meet-semilattice of formal differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfDifferences ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for a constructible object as a union of formal differences and an object in a thin category",
        [ IsConstructibleObjectAsUnionOfDifferences, IsObjectInThinCategory ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a meet-semilattice of formal differences and the zero integer",
        [ IsObjectInMeetSemilatticeOfDifferences, IsInt and IsZero ],
        
  function( A, B )
    
    return A + InitialObject( CapCategory( A ) );
    
end );

##
InstallMethod( \+,
        "for the zero integer and an object in a meet-semilattice of formal differences",
        [ IsInt and IsZero, IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A, B )
    
    return B + InitialObject( CapCategory( B ) );
    
end );

##
InstallMethod( \+,
        "for an object in a thin category and the zero integer",
        [ IsObjectInThinCategory, IsInt and IsZero ],
        
  function( A, B )
    
    return ( A - 0 ) + 0;
    
end );

##
InstallMethod( \+,
        "for the zero integer and an object in a thin category",
        [ IsInt and IsZero, IsObjectInThinCategory ],
        
  function( A, B )
    
    return ( B - 0 ) + 0;
    
end );

##
InstallGlobalFunction( UnionOfDifferencesOfNormalizedObjects,
  function( arg )
    local A, C;
    
    A := rec( );

    C := BooleanAlgebraOfConstructibleObjectsAsUnionOfDifferences(
                 CapCategory( PairInUnderlyingLattice( ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( arg[1] )[1] )[1] ) );
    
    ObjectifyObjectForCAPWithAttributes( A, C,
            ListOfNormalizedObjectsInMeetSemilatticeOfDifferences, arg
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal differences",
        [ IsConstructibleObjectAsUnionOfDifferences ],
        
  ListOfPreObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal differences",
        [ IsConstructibleObjectAsUnionOfDifferences and HasListOfNormalizedObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfNormalizedObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal differences",
        [ IsConstructibleObjectAsUnionOfDifferences and HasListOfStandardObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfStandardObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( \=,
        "for an object in a thin category and a constructible object as a union of formal differences",
        [ IsObjectInThinCategory, IsConstructibleObjectAsUnionOfDifferences ],
        
  function( A, B )
    
    if IsConstructibleObjectAsUnionOfDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return ( A + 0 ) = B;
    
end );

##
InstallMethod( \=,
        "for a constructible object as a union of formal differences and an object in a thin category",
        [ IsConstructibleObjectAsUnionOfDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    if IsConstructibleObjectAsUnionOfDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A = ( B + 0 );
    
end );

##
InstallMethod( \.,
        "for a constructible object as a union of formal differences and a positive integer",
        [ IsConstructibleObjectAsUnionOfDifferences, IsPosInt ],
        
  function( A, string_as_int )
    local name, n;
    
    A := ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A );
    
    name := NameRNam( string_as_int );
    
    n := EvalString( name{[ 2 .. Length( name ) ]} );
    
    if name[1] = 'I' then
        return A[n].I;
    elif name[1] = 'J' then
        return A[n].J;
    fi;
    
    Error( "no component with this name available\n" );
    
end );

##
InstallMethod( \[\],
        "for a constructible object as a union of formal differences and a positive integer",
        [ IsConstructibleObjectAsUnionOfDifferences, IsPosInt ],
        
  function( A, pos )
    
    return ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A )[pos];
    
end );

##
InstallMethod( ViewObj,
        "for a constructible object as a union of formal differences",
        [ IsConstructibleObjectAsUnionOfDifferences ],

  function( A )
    local n, i;
    
    A := ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A );
    
    n := Length( A );
    
    Print( "( " );
    ViewObj( A[1] : Locales_number := "1" );
    
    for i in [ 2 .. n ] do
        Print( " ) + ( " );
        ViewObj( A[i] : Locales_number := String( i ) );
    od;
    
    Print( " )" );
    
end );

##
InstallMethod( DisplayString,
        "for a constructible object as a union of formal differences",
        [ IsConstructibleObjectAsUnionOfDifferences ],

  function( A )
    local n, display, i;
    
    A := ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences( A );
    
    n := Length( A );
    
    display := DisplayString( A[1] );
    
    for i in [ 2 .. n ] do
        Append( display, "\n\n+\n\n" );
        Append( display, DisplayString( A[i] ) );
    od;
    
    return display;
    
end );

##
InstallMethod( Display,
        "for a constructible object as a union of formal differences",
        [ IsConstructibleObjectAsUnionOfDifferences ],

  function( A )
    
    Display( DisplayString( A ) );
    
end );
