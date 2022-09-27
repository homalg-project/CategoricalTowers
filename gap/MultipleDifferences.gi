# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
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
    
    D!.category_as_first_argument := true;
    
    D!.compiler_hints :=
      rec(
          category_attribute_names := [
                  "UnderlyingCategory",
                  "UnderlyingCategoryOfSingleDifferences",
                  ],
          category_filter := IsMeetSemilatticeOfMultipleDifferences,
          object_filter := IsObjectInMeetSemilatticeOfMultipleDifferences,
          morphism_filter := IsMorphismInMeetSemilatticeOfMultipleDifferences,
          );
    
    SetFilterObj( D, IsMeetSemilatticeOfMultipleDifferences );
    
    SetUnderlyingCategory( D, P );
    
    SetUnderlyingCategoryOfSingleDifferences( D, MeetSemilatticeOfDifferences( P ) );
    
    AddObjectRepresentation( D, IsObjectInMeetSemilatticeOfMultipleDifferences );
    
    AddMorphismRepresentation( D, IsMorphismInMeetSemilatticeOfMultipleDifferences );
    
    SetIsMeetSemiLattice( D, true );
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( D );
    
    ##
    AddIsWellDefinedForObjects( D,
      function( cat, A )
        local S;
        
        S := UnderlyingCategoryOfSingleDifferences( cat );
        
        return ForAll( ListOfSingleDifferences( A ), IsObjectInMeetSemilatticeOfSingleDifferences ) and
               ForAll( ListOfSingleDifferences( A ), d -> IsWellDefinedForObjects( S, d ) );
        
    end );
    
    ##
    AddInitialObject( D,
      function( cat )
        local I;
        
        I := InitialObject( UnderlyingCategoryOfSingleDifferences( D ) );
        
        return MultipleDifference( cat, [ I ] );
        
    end );
    
    ##
    AddIsInitial( D,
      function( cat, A )
        local L, AI, AJ, S;
        
        L := ListOfSingleDifferences( A );
        
        AI := PairInUnderlyingLattice( L[1] )[1];
        
        AJ := Coproduct( UnderlyingCategory( cat ), List( L, d -> PairInUnderlyingLattice( d )[2] ) );
        
        S := UnderlyingCategoryOfSingleDifferences( cat );
        
        return IsInitial( S, SingleDifference( S, Pair( AI, AJ ) ) );
        
    end );
    
    ##
    AddIsHomSetInhabited( D,
      function( cat, A, B )
        local B1, BI, S, H, mBI;
        
        B1 := ListOfSingleDifferences( B )[1];
        
        ## the minuend B.I of B
        BI := PairInUnderlyingLattice( B1 )[1];
        
        ## the meet semi-lattice of single differences
        S := UnderlyingCategoryOfSingleDifferences( cat );
        
        H := UnderlyingCategory( cat );
        
        ## the complement -B.I of the minuend B.I of B as a multiple difference
        mBI := MultipleDifference( cat, [ SingleDifference( S, Pair( TerminalObject( H ), BI ) ) ] );
        
        return IsInitial( cat, DirectProduct( cat, [ A, mBI ] ) ) and ## A - B.I
               ForAll( ListOfSingleDifferences( B ), s ->
                       IsInitial( cat,
                               DirectProduct( cat,  # A * s.J
                                       [ A,
                                         MultipleDifference( cat, [ SingleDifference( S, Pair( PairInUnderlyingLattice( s )[2], InitialObject( H ) ) ) ] ) # s.J - ∅
                                         ] ) ) );
        
    end );
    
    ##
    AddTerminalObject( D,
      function( cat )
        local T;
        
        T := TerminalObject( UnderlyingCategoryOfSingleDifferences( D ) );
        
        return MultipleDifference( cat, [ T ] );
        
    end );
    
    ##
    AddDirectProduct( D,
      function( cat, L )
        local H, l, SD, A, A_N;
        
        H := UnderlyingCategory( cat );
        
        l := List( L, ListOfSingleDifferences );
        
        ## start unifying the minuend
        A := DirectProduct( H, List( l, ls -> PairInUnderlyingLattice( ls[1] )[1] ) );
        
        ## the meet semi-lattice of single differences
        SD := UnderlyingCategoryOfSingleDifferences( cat );
        
        ## make all single differences have the same minuend
        A_N := List( Concatenation( l ),
          function( s )
            local S;
            
            S := SingleDifference( SD, Pair( A, PairInUnderlyingLattice( s )[2] ) ); # A - s.J
            
            #% CAP_JIT_DROP_NEXT_STATEMENT
            if HasNormalizedDistinguishedSubtrahend( s ) then
                SetNormalizedDistinguishedSubtrahend( S, NormalizedDistinguishedSubtrahend( s ) );
            elif HasPreDistinguishedSubtrahend( s ) then
                SetPreDistinguishedSubtrahend( S, PreDistinguishedSubtrahend( s ) );
            fi;
            
            return S;
            
        end );
        
        return MultipleDifference( cat, A_N );
        
    end );
    
    HandlePrecompiledTowers( D, P, "MeetSemilatticeOfMultipleDifferences" );
    
    Finalize( D );
    
    return D;
    
end );

##
InstallOtherMethodForCompilerForCAP( MultipleDifference,
        [ IsMeetSemilatticeOfMultipleDifferences, IsList ],
        
  function( D, L )
    local A;
    
    A := CreateCapCategoryObjectWithAttributes( D,
                 ListOfPreObjectsInMeetSemilatticeOfDifferences, L,
                 IsLocallyClosed, true );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallGlobalFunction( AsMultipleDifference,
  function( arg )
    local S, D, A_N;
    
    S := CapCategory( arg[1] );
    
    if not ForAll( arg, IsObjectInMeetSemilatticeOfSingleDifferences ) then
        Error( "not all arguments are formal single differences\n" );
    elif not ForAll( arg{[ 2.. Length( arg ) ]}, d -> IsIdenticalObj( CapCategory( d ), S ) ) then
        Error( "not all arguments lie in the same category\n" );
    fi;
    
    D := MeetSemilatticeOfMultipleDifferences( UnderlyingCategory( S ) );
    
    A_N := DirectProduct( D, List( arg, s -> MultipleDifference( D, [ s ] ) ) );
    
    Assert( 4, IsWellDefined( A_N ) );
    
    return A_N;
    
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
    
    return CallFuncList( AsMultipleDifference, A );
    
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
#    return AsMultipleDifference( A ) - B;
#    
#end );

##
InstallMethod( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local T_new, T, pos;
    
    T_new := DirectProduct( List( A, a -> a.I ) );
    
    repeat
        
        T := T_new;
        
        # avoid searching for maximal objects too early
        # avoid excluding exmpty sets too early
        
        A := List( A,
          function( d )
            local D;
            
            D := T - d.J;
            
            NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( D );
            
            if HasNormalizedDistinguishedSubtrahend( d ) then
                SetNormalizedDistinguishedSubtrahend( D, NormalizedDistinguishedSubtrahend( d ) );
            elif HasPreDistinguishedSubtrahend( d ) then
                SetPreDistinguishedSubtrahend( D, PreDistinguishedSubtrahend( d ) );
            fi;
            
            return D;
            
        end );
        
        T_new := DirectProduct( List( A, a -> a.I ) );
        
    until AreIsomorphicForObjectsIfIsHomSetInhabited( T_new, T );
    
    pos := PositionsOfMaximalObjects( List( A, d -> d.J ), IsHomSetInhabited );
    
    return A{pos};
    
end );

##
InstallMethod( ListOfStandardObjectsInMeetSemilatticeOfDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    A := ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A );
    
    List( A, StandardPairInUnderlyingHeytingOrCoHeytingAlgebra );
    
    return A;
    
end );

##
InstallMethod( ListOfSingleDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  ListOfPreObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfSingleDifferences,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences and HasListOfNormalizedObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfNormalizedObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfSingleDifferences,
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
        
        return UniqueMorphism( T, new_source, new_range );
        
    end );
    
    return squash;
    
end );

##
InstallMethod( AsSingleDifference,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local P, F;
    
    P := UnderlyingCategory( CapCategory( A ) );
    
    F := EquivalenceToMeetSemilatticeOfDifferences( P );
    
    return ApplyFunctor( F, A );
    
end );

##
InstallMethod( NormalizeObject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    List( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A ), IsInitial );
    
    return A;
    
end );

##
InstallMethod( StandardizeObject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    List( ListOfStandardObjectsInMeetSemilatticeOfDifferences( A ), IsInitial );
    
    return A;
    
end );

##
InstallMethod( FactorsAttr,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local Ac, facAc, facAp;
    
    StandardizeObject( A );
    
    Ac := Closure( A );
    
    facAc := Factors( Ac );
    
    facAp := Concatenation( List( A, D -> Factors( D.J ) ) );
    
    if facAp = [ ] then
        facAp := [ InitialObject( CapCategory( Ac ) ) ];
    fi;
    
    A := List( facAc, T -> CallFuncList( AsMultipleDifference, List( facAp, S -> T - S ) ) );
    
    List( A, StandardizeObject );
    
    Perform( A, function( a ) SetFactorsAttr( a, [ a ] ); end );
    
    return A;
    
end );

##
InstallMethod( IsClosedSubobject,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local H;
    
    H := UnderlyingCategory( CapCategory( A ) );
    
    if ( HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) ) or
       ( HasIsCartesianClosedCategory( H ) and IsCartesianClosedCategory( H ) ) then
        return ForAll( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A ), IsClosedSubobject );
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( Closure,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local H;
    
    H := UnderlyingCategory( CapCategory( A ) );
    
    if HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) then
        return ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A )[1].I;
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( \*,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInMeetSemilatticeOfMultipleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return AsMultipleDifference( A ) * B;
    
end );

##
InstallMethod( \*,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInMeetSemilatticeOfSingleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A * AsMultipleDifference( B );
    
end );

##
InstallMethod( \=,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInMeetSemilatticeOfMultipleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return AsMultipleDifference( A ) = B;
    
end );

##
InstallMethod( \=,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInMeetSemilatticeOfSingleDifferences ],

  function( A, B )
    
    if IsObjectInMeetSemilatticeOfMultipleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A = AsMultipleDifference( B );
    
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
        
   ListOfSingleDifferences );

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
        return A[1].I;
    elif name[1] = 'J' then
        return A[EvalString( name{[ 2 .. Length( name ) ]} )].J;
    fi;
    
    Error( "no component with this name available\n" );
    
end );

##
InstallMethod( ViewString,
        "for an object in a meet-semilattice of formal mutliple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local n, str, i, j;
    
    A := List( A );
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    str := ViewString( A[1].I : Locales_name := "I", Locales_number := n );
    
    Append( str, " \\\ " );
    
    Append( str, ViewString( A[1].J : Locales_name := "J", Locales_number := n, Locales_counter := 1 ) );
    
    j := Length( A );
    
    if j > 1 then
        
        Append( str, " \\\ " );
        
        if j > 2 then
            Append( str, ".. \\\ " );
        fi;
        
        Append( str, ViewString( A[1].J : Locales_name := "J", Locales_number := n, Locales_counter := j ) );
        
    fi;
    
    return str;
    
end );

##
InstallMethod( ViewObj,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    Print( ViewString( A ) );
    
end );

##
InstallMethod( String,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  ViewString );

##
InstallMethod( DisplayString,
        "for an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    local str, i;
    
    str := DisplayString( A.I );
    
    A := List( A );
    
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
