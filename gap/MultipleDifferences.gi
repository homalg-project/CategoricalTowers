#
# Locales: Multiple differences
#
# Implementations
#

##
InstallMethod( MeetSemilatticeOfMultipleDifferences,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( P )
    local name, D;
    
    name := "The meet-semilattice of multiple differences of ";
    
    name := Concatenation( name, Name( P ) );
    
    D := CreateCapCategory( name );
    
    D!.UnderlyingCategory := P;
    D!.MeetSemilatticeOfDifferences := MeetSemilatticeOfDifferences( P );
    
    AddObjectRepresentation( D, IsObjectInMeetSemilatticeOfMultipleDifferences );
    
    AddMorphismRepresentation( D, IsMorphismInMeetSemilatticeOfMultipleDifferences );
    
    SetIsStrictCartesianCategory( D, true );
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( D );
    
    ##
    AddIsWellDefinedForObjects( D,
      function( A )
        
        return ForAll( A, IsObjectInMeetSemilatticeOfSingleDifferences ) and ForAll( A, IsWellDefinedForObjects );
        
    end );
    
    ##
    AddIsHomSetInhabited( D,
      function( A, B )
        
        return IsHomSetInhabited( AsDifference( A ), AsDifference( B ) );
        
    end );
    
    ##
    AddTerminalObject( D,
      function( arg )
        local T;
        
        T := TerminalObject( D!.MeetSemilatticeOfDifferences );
        
        return AsFormalMultipleDifference( T );
        
    end );
    
    ##
    AddInitialObject( D,
      function( arg )
        local I;
        
        I := InitialObject( D!.MeetSemilatticeOfDifferences );
        
        return AsFormalMultipleDifference( I );
        
    end );
    
    ##
    AddIsInitial( D,
      function( A )
        
        return IsInitial( AsDifference( A ) );
        
    end );
    
    ##
    AddDirectProduct( D,
      function( L )
        
        L := List( L, List );
        
        ## an advantage of this this specific data structure for formal multiple differences
        return CallFuncList( AsFormalMultipleDifference, Concatenation( L ) );
        
    end );
    
    Finalize( D );
    
    return D;
    
end );

##
InstallGlobalFunction( AsFormalMultipleDifference,
  function( arg )
    local A, D;
    
    A := rec( );
    
    D := MeetSemilatticeOfMultipleDifferences( CapCategory( PairInUnderlyingLattice( arg[1] )[1] ) );
    
    ObjectifyObjectForCAPWithAttributes( A, D,
            ListOfPreObjectsInMeetSemilatticeOfDifferences, arg,
            SetIsLocallyClosed, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallGlobalFunction( AsFormalMultipleDifferenceOfNormalizedObjects,
  function( arg )
    local A, D;
    
    A := rec( );

    D := MeetSemilatticeOfMultipleDifferences( CapCategory( PairInUnderlyingLattice( arg[1] )[1] ) );
    
    ObjectifyObjectForCAPWithAttributes( A, D,
            ListOfNormalizedObjectsInMeetSemilatticeOfDifferences, arg,
            SetIsLocallyClosed, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( \-,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    if IsObjectInMeetSemilatticeOfSingleDifferences( B ) or
       IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    A := List( A );
    
    A := ShallowCopy( A );
    
    Add( A, -B );
    
    return CallFuncList( AsFormalMultipleDifference, A );
    
end );

##
#InstallMethod( \-,
#        "for an object in a meet-semilattice of formal single differences and an object in a thin category",
#        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInThinCategory ],
#        
#  function( A, B )
#    local U;
#    
#    if IsObjectInMeetSemilatticeOfSingleDifferences( B ) or
#       IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
#        TryNextMethod( );
#    fi;
#    
#    return AsFormalMultipleDifference( A ) - B;
#    
#end );

##
#InstallMethod( AdditiveInverseMutable,
#        "for an object in a meet-semilattice of formal multiple differences",
#        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
#        
#  function( A )
#    
#    return AsFormalMultipleDifference( - AsDifference( A ) );
#    
#end );

##
InstallMethod( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local u, T_new, T;
    
    u := List( A, PairInUnderlyingLattice );
    
    T_new := DirectProduct( List( u, a -> a[1] ) );
    
    repeat
        
        T := T_new;
        
        A := List( List( u, a -> a[2] ), S -> T - S );
        
        List( A, NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra );
        
        u := List( A, PairInUnderlyingLattice );
        
        T_new := DirectProduct( List( u, a -> a[1] ) );
        
    until IsEqualForObjectsIfIsHomSetInhabited( T_new, T );
    
    u := MaximalObjects( List( u, a -> a[2] ), IsHomSetInhabited );
    
    return List( u, S -> T - S );
    
end );

##
InstallMethod( ListOfStandardObjectsInMeetSemilatticeOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    A := ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A );
    
    return List( A, StandardPairInUnderlyingHeytingOrCoHeytingAlgebra );
    
end );

##
InstallMethod( ListOfObjectsOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  ListOfPreObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences and HasListOfNormalizedObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfNormalizedObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences and HasListOfStandardObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfStandardObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( EquivalenceToMeetSemilatticeOfDifferences,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( P )
    local S, T, squash;
    
    S := MeetSemilatticeOfMultipleDifferences( P );
    T := MeetSemilatticeOfDifferences( P );
    
    squash := CapFunctor( "Equivalence from the meet-semilattice of formal multiple differences to the meet-semilattice of formal single differences", S, T );
    
    AddObjectFunction( squash,
      function( obj )
        local U, T, S;
        
        U := List( obj, PairInUnderlyingLattice );
        
        T := DirectProduct( List( U, a -> a[1] ) );
        S := Coproduct( List( U, a -> a[2] ) );
        
        return T - S;
        
    end );
    
    AddMorphismFunction( squash,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return squash;
    
end );

##
InstallMethod( AsDifference,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local P, F;
    
    P := CapCategory( A )!.UnderlyingCategory;
    
    F := EquivalenceToMeetSemilatticeOfDifferences( P );
    
    return ApplyFunctor( F, A );
    
end );

##
InstallMethod( NormalizeObject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    List( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A ), IsInitial );
    
    if IsInitial( A ) then
        return InitialObject( A );
    fi;
    
    return A;
    
end );

##
InstallMethod( StandardizeObject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    List( ListOfStandardObjectsInMeetSemilatticeOfDifferences( A ), IsInitial );
    
    if IsInitial( A ) then
        return InitialObject( A );
    fi;
    
    return A;
    
end );

##
InstallMethod( IsClosedSubobject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) then
        return ForAll( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A ), IsClosed );
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( IsClosed,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  IsClosedSubobject );

##
InstallMethod( IsOpen,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallMethod( Closure,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) then
        return ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A )[1].I;
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( LocallyClosedApproximation,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    if IsClosed( A ) then
        return Closure( A );
    fi;
    
    return StandardizeObject( A );
    
end );

##
InstallMethod( CanonicalObjectOp,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  LocallyClosedApproximation );

##
InstallMethod( CanonicalObject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  LocallyClosedApproximation );

##
InstallMethod( Dimension,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    return Dimension( Closure( A ) );
    
end );

##
InstallMethod( \*,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInMeetSemilatticeOfMultipleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return AsFormalMultipleDifference( A ) * B;
    
end );

##
InstallMethod( \*,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInMeetSemilatticeOfSingleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A * AsFormalMultipleDifference( B );
    
end );

##
InstallMethod( \=,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInMeetSemilatticeOfMultipleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return AsFormalMultipleDifference( A ) = B;
    
end );

##
InstallMethod( \=,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInMeetSemilatticeOfSingleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A = AsFormalMultipleDifference( B );
    
end );

##
InstallMethod( \*,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfMultipleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return ( A - 0 ) * B;
    
end );

##
InstallMethod( \*,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInThinCategory ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A * ( B - 0 );
    
end );

##
InstallMethod( \=,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfMultipleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return ( A - 0 ) = B;
    
end );

##
InstallMethod( \=,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInThinCategory ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A = ( B - 0 );
    
end );

##
InstallMethod( ListOp,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
   ListOfObjectsOfDifferences );

##
InstallMethod( ListOp,
        "for an object in a meet-semilattice of formal multiple differences and a function",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsFunction ],
        
  function( A, f )
    
    return List( List( A ), f );
    
end );

##
InstallMethod( Iterator,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  A -> Iterator( List( A ) ) );

##
InstallMethod( ForAllOp,
        "for an object in a meet-semilattice of formal multiple differences and a function",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsFunction ],
        
  function( A, f )
    
    return ForAll( List( A ), f );
    
end );

##
InstallMethod( ForAnyOp,
        "for an object in a meet-semilattice of formal multiple differences and a function",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsFunction ],
        
  function( A, f )
    
    return ForAny( List( A ), f );
    
end );

##
InstallMethod( \[\],
        "for an object in a meet-semilattice of formal multiple differences and a positive integer",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsPosInt ],
        
  function( A, pos )
    
    return List( A )[pos];
    
end );

##
InstallMethod( \.,
        "for an object in a meet-semilattice of formal multiple differences and a positive integer",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsPosInt ],

  function( A, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    if name[1] = 'I' then
        List( A );
        return A[1].I;
    elif name[1] = 'J' then
        return A[EvalString( name{[ 2 .. Length( name ) ]} )].J;
    fi;
    
    Error( "no component with this name available\n" );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a meet-semilattice of formal mutliple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local n, i;
    
    A := List( A );
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    ViewObj( A[1].I : Locales_name := "I", Locales_number := n );
    
    for i in [ 1 .. Length( A ) ] do
        Print( " \\\ " );
        ViewObj( A[i].J : Locales_name := "J", Locales_number := n, Locales_counter := i );
    od;
    
end );

##
InstallMethod( DisplayString,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local str, i;
    
    A := List( A );

    str := DisplayString( A[1].I );
    
    for i in [ 1 .. Length( A ) ] do
        Append( str, Concatenation( " \\ ", DisplayString( A[i].J ) ) );
    od;
    
    return str;
    
end );

##
InstallMethod( Display,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    Display( DisplayString( A ) );
    
end );
