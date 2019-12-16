#
# Locales: ConstructibleObjectsAsUnionOfDifferences
#
# Implementations
#

##
InstallMethod( IsHomSetInhabitedWithTypeCast,
        "for an object in a meet-semilattice of formal single differences and a constructible object as a union of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A, B )
    local Ap, Bp, b;
    
    A := PairInUnderlyingLattice( A );
    
    Ap := A[2];
    A := A[1];
    
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
    local name, C, BinaryDirectProduct;
    
    name := "The Boolean algebra of constructible objects as unions of formal single differences of ";
    
    name := Concatenation( name, Name( P ) );
    
    C := CreateCapCategory( name );
    
    SetIsCartesianClosedCategoryWithIsomorphicDoubleNegations( C, true );
    SetIsCocartesianCoclosedCategoryWithIsomorphicDoubleConegations( C, true );
    
    C!.UnderlyingCategory := P;
    C!.MeetSemilatticeOfDifferences := MeetSemilatticeOfDifferences( P );
    
    AddObjectRepresentation( C, IsConstructibleObjectAsUnionOfSingleDifferences );
    
    AddMorphismRepresentation( C, IsMorphismBetweenConstructibleObjectsAsUnionOfDifferences );
    
    ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS( C );
    
    ##
    AddIsWellDefinedForObjects( C,
      function( A )
        
        return ForAll( A, IsWellDefinedForObjects );
        
    end );
    
    ##
    AddIsHomSetInhabited( C,
      function( A, B )
        
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
    AddIsInitial( C,
      function( A )
        
        return ForAll( A, IsInitial );
        
    end );
    
    BinaryDirectProduct := function( A, B )
        local L, l, I, U;
        
        L := [ List( A ), List( B ) ];
        
        l := [ 1, 2 ];
        
        ## TODO: replace Cartesian -> IteratorOfCartesianProduct once GAP supports List with an iterator as 1st argument
        I := Cartesian( List( L, a -> [ 1 .. Length( a ) ] ) );
        
        ## the distributive law
        U := List( I, i -> DirectProduct( List( l, j -> L[j][i[j]] ) ) );
        
        return CallFuncList( UnionOfDifferences, U );
        
    end;
    
    ##
    AddDirectProduct( C,
      function( L )
        
        return Iterated( L, BinaryDirectProduct );
        
    end );
    
    ##
    AddCoproduct( C,
      function( L )
        
        L := List( L, List );
        
        ## an advantage of this this specific data structure for constructible objects
        return CallFuncList( UnionOfDifferences, Concatenation( L ) );
        
    end );
    
    Finalize( C );
    
    return C;
    
end );

##
InstallGlobalFunction( UnionOfDifferences,
  function( arg )
    local A, arg1, C;
    
    A := rec( );
    
    arg := List( arg,
                 function( A )
                   local D;
                   if IsConstructibleObjectAsUnionOfSingleDifferences( A ) then
                       return List( A );
                   elif IsObjectInMeetSemilatticeOfSingleDifferences( A ) then
                       return A;
                   elif IsObjectInThinCategory( A ) then
                       D := A - 0;
                       if not IsObjectInMeetSemilatticeOfSingleDifferences( D ) then
                           Error( "the difference `D := A - 0' is not an object in a meet-semilattice of formal single differences\n" );
                       fi;
                       return D;
                   else
                       Error( "this entry is neither a constructible set as a union of formal single differences, nor a formal single difference, nor a formal single difference, not even an object in a thin category: ", A, "\n" );
                   fi;
               end );
    
    arg := Flat( arg );
    
    arg1 := arg[1];
    
    C := BooleanAlgebraOfConstructibleObjectsAsUnionOfDifferences(
                 CapCategory( PairInUnderlyingLattice( arg1 )[1] ) );
    
    arg := Filtered( arg, D -> not IsInitial( D ) );
    
    if arg = [ ] then
        arg := [ arg1 ];
    fi;
    
    ObjectifyObjectForCAPWithAttributes( A, C,
            ListOfPreObjectsInMeetSemilatticeOfDifferences, arg
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( \+,
        "for an object in a meet-semilattice of formal single differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInThinCategory ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a thin category and an object in a meet-semilattice of formal single differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for a constructible object as a union of formal single differences and an object in a thin category",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsObjectInThinCategory ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a thin category and a constructible object as a union of formal single differences",
        [ IsObjectInThinCategory, IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  UnionOfDifferences );

##
InstallMethod( \+,
        "for an object in a meet-semilattice of formal single differences and the zero integer",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsInt and IsZero ],
        
  function( A, B )
    
    return A + InitialObject( CapCategory( A ) );
    
end );

##
InstallMethod( \+,
        "for the zero integer and an object in a meet-semilattice of formal single differences",
        [ IsInt and IsZero, IsObjectInMeetSemilatticeOfSingleDifferences ],
        
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
                 CapCategory( PairInUnderlyingLattice( ListOfObjectsInMeetSemilatticeOfDifferences( arg[1] )[1] )[1] ) );
    
    ObjectifyObjectForCAPWithAttributes( A, C,
            ListOfNormalizedObjectsInMeetSemilatticeOfDifferences, arg
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A )
    
    return List( A, NormalizeObject );
    
end );

##
InstallMethod( ListOfStandardObjectsInMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A )
    
    return List( A, StandardizeObject );
    
end );

##
InstallMethod( ListOfObjectsInMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  ListOfPreObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsInMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences and HasListOfNormalizedObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfNormalizedObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsInMeetSemilatticeOfDifferences,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences and HasListOfStandardObjectsInMeetSemilatticeOfDifferences ],
        
  ListOfStandardObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOp,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  ListOfObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOp,
        "for a constructible object as a union of formal single differences and a function",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsFunction ],
        
  function( A, f )
    
    return List( List( A ), f );
    
end );

##
InstallMethod( Iterator,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  A -> Iterator( List( A ) ) );

##
InstallMethod( ForAllOp,
        "for a constructible object as a union of formal single differences and a function",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsFunction ],
        
  function( A, f )
    
    return ForAll( List( A ), f );
    
end );

##
InstallMethod( ForAnyOp,
        "for a constructible object as a union of formal single differences and a function",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsFunction ],
        
  function( A, f )
    
    return ForAny( List( A ), f );
    
end );

##
InstallMethod( Length,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  C -> Length( List( C ) ) );

##
InstallMethod( NormalizedObject,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A )
    local L;
    
    L := Filtered( ListOfNormalizedObjectsInMeetSemilatticeOfDifferences( A ), m -> not IsInitial( m ) );
    
    if L = [ ] then
        return InitialObject( A );
    fi;
    
    return CallFuncList( UnionOfDifferences, L );
    
end );

##
InstallMethod( StandardizedObject,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A )
    local L;
    
    L := Filtered( ListOfStandardObjectsInMeetSemilatticeOfDifferences( A ), m -> not IsInitial( m ) );
    
    if L = [ ] then
        return InitialObject( A );
    fi;
    
    return CallFuncList( UnionOfDifferences, L );
    
end );

##
InstallMethod( \-,
        "for an object in a thin category and an object in a meet-semilattice of formal single differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A, B )
    
    B := PairInUnderlyingLattice( B );
    
    return ( A - B[1] ) + A * B[2];
    
end );

##
InstallMethod( \-,
        "for an object in a thin category and a constructible object as a union of formal single differences",
        [ IsObjectInThinCategory, IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A, B )
    
    B := ListOfObjectsInMeetSemilatticeOfDifferences( B );
    
    return DirectProduct( List( B, b -> A - b ) );
    
end );

##
InstallMethod( \-,
        "for a constructible object as a union of formal single differences and an object in a thin category",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    A := ListOfObjectsInMeetSemilatticeOfDifferences( A );
    
    return CallFuncList( UnionOfDifferences, List( A, a -> a - B ) );
    
end );

##
InstallMethod( AdditiveInverseMutable,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    
    return -UnionOfDifferences( A );
    
end );

##
InstallMethod( Closure,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) then
        return Coproduct( List( A, Closure ) );
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( ClosureAsConstructibleObject,
        "for a constructible object as a union of formal single differences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A )
    
    return ( Closure( A ) - 0 ) + 0;
    
end );

##
InstallMethod( \=,
        "for an object in a thin category and a constructible object as a union of formal single differences",
        [ IsObjectInThinCategory, IsConstructibleObjectAsUnionOfSingleDifferences ],
        
  function( A, B )
    
    if IsConstructibleObjectAsUnionOfSingleDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return ( A + 0 ) = B;
    
end );

##
InstallMethod( \=,
        "for a constructible object as a union of formal single differences and an object in a thin category",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    if IsConstructibleObjectAsUnionOfSingleDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A = ( B + 0 );
    
end );

##
InstallMethod( \.,
        "for a constructible object as a union of formal single differences and a positive integer",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsPosInt ],
        
  function( A, string_as_int )
    local name, n;
    
    A := ListOfObjectsInMeetSemilatticeOfDifferences( A );
    
    name := NameRNam( string_as_int );
    
    n := EvalString( name{[ 2 .. Length( name ) ]} );
    
    if name[1] = 'I' then
        return A[n].I;
    elif name[1] = 'J' then
        return A[n].J;
    fi;
    
    Error( "no component with this name available\n" );
    
end );
