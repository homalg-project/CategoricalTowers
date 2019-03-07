#
# Locales: ConstructibleObjectsAsUnionOfMultipleDifferences
#
# Implementations
#

##
InstallMethod( IsHomSetInhabitedWithTypeCast,
        "for an object in a meet-semilattice of formal differences and a constructible object as a union of formal multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences, IsConstructibleObjectAsUnionOfMultipleDifferences ],

  function( A, B )
    local Ap, Bp, b;
    
    A := PairInUnderlyingLattice( A );
    
    Ap := A[2];
    A := A[1];
    
    B := ListOfObjectsInMeetSemilatticeOfMultipleDifferences( B );
    
    B := List( B, AsDifference );
    
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
InstallMethod( BooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( P )
    local name, C, BinaryDirectProduct;
    
    name := "The Boolean algebra of constructible objects of ";
    
    name := Concatenation( name, Name( P ) );
    
    C := CreateCapCategory( name );
    
    C!.UnderlyingCategory := P;
    C!.MeetSemilatticeOfMultipleDifferences := MeetSemilatticeOfMultipleDifferences( P );
    
    AddObjectRepresentation( C, IsConstructibleObjectAsUnionOfMultipleDifferences );
    
    AddMorphismRepresentation( C, IsMorphismBetweenConstructibleObjectsAsUnionOfMultipleDifferences );
    
    ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS( C );
    
    ##
    AddIsWellDefinedForObjects( C,
      function( A )
        local U;
        
        U := ListOfObjectsInMeetSemilatticeOfMultipleDifferences( A );
        
        return ForAll( U, IsWellDefinedForObjects );
        
    end );
    
    ##
    AddIsHomSetInhabited( C,
      function( A, B )
        
        A := ListOfObjectsInMeetSemilatticeOfMultipleDifferences( A );
        
        A := List( A, AsDifference );
        
        return ForAll( A, M -> IsHomSetInhabitedWithTypeCast( M, B ) );
        
    end );
    
    ##
    AddTerminalObject( C,
      function( arg )
        local T;
        
        T := TerminalObject( C!.MeetSemilatticeOfMultipleDifferences );
        
        return UnionOfMultipleDifferences( T );
        
    end );
    
    ##
    AddInitialObject( C,
      function( arg )
        local I;
        
        I := InitialObject( C!.MeetSemilatticeOfMultipleDifferences );
        
        return UnionOfMultipleDifferences( I );
        
    end );
    
    ##
    AddIsInitial( C,
      function( A )
        
        A := ListOfObjectsInMeetSemilatticeOfMultipleDifferences( A );
        
        return ForAll( A, IsInitial );
        
    end );
    
    BinaryDirectProduct := function( A, B )
        local L, l, I, U;
        
        L := [ ListOfObjectsInMeetSemilatticeOfMultipleDifferences( A ),
               ListOfObjectsInMeetSemilatticeOfMultipleDifferences( B ) ];
        
        l := [ 1, 2 ];
        
        ## TODO: replace Cartesian -> IteratorOfCartesianProduct once GAP supports List with an iterator as 1st argument
        I := Cartesian( List( L, a -> [ 1 .. Length( a ) ] ) );
        
        ## the distributive law
        U := List( I, i -> DirectProduct( List( l, j -> L[j][i[j]] ) ) );
        
        return CallFuncList( UnionOfMultipleDifferences, U );
        
    end;
    
    ##
    AddDirectProduct( C,
      function( L )
        
        return Iterated( L, BinaryDirectProduct );
        
    end );
    
    ##
    AddCoproduct( C,
      function( L )
        
        L := List( L, ListOfObjectsInMeetSemilatticeOfMultipleDifferences );
        
        ## an advantage of this this specific data structure for constructible objects
        return CallFuncList( UnionOfMultipleDifferences, Concatenation( L ) );
        
    end );
    
    Finalize( C );
    
    return C;
    
end );

##
InstallGlobalFunction( UnionOfMultipleDifferences,
  function( arg )
    local A, arg1, C;
    
    A := rec( );
    
    arg := List( arg,
                 function( A )
                   if IsConstructibleObjectAsUnionOfMultipleDifferences( A ) then
                       return ListOfObjectsInMeetSemilatticeOfMultipleDifferences( A );
                   elif IsObjectInMeetSemilatticeOfMultipleDifferences( A ) then
                       return A;
                   elif IsObjectInMeetSemilatticeOfDifferences( A ) then
                       return AsFormalMultipleDifference( A );
                   elif IsObjectInThinCategory( A ) then
                       return AsFormalMultipleDifference( A - 0 );
                   else
                       Error( "this entry is neither a constructible set as a union of formal multiple differences, nor a formal multiple difference, nor a formal difference, not even an object in a thin category: ", A, "\n" );
                   fi;
               end );
    
    arg := Flat( arg );
    
    arg1 := arg[1];
    
    C := BooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences(
                 CapCategory( PairInUnderlyingLattice( ListOfObjectsInMeetSemilatticeOfDifferences( arg1 )[1] )[1] ) );
    
    arg := Filtered( arg, D -> not IsInitial( D ) );
    
    if arg = [ ] then
        arg := [ arg1 ];
    fi;
    
    ObjectifyObjectForCAPWithAttributes( A, C,
            ListOfPreObjectsInMeetSemilatticeOfMultipleDifferences, arg
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
#InstallMethod( \+,
#        "for an object in a meet-semilattice of formal differences and an object in a thin category",
#        [ IsObjectInMeetSemilatticeOfDifferences, IsObjectInThinCategory ],
#        
#  UnionOfMultipleDifferences );

##
#InstallMethod( \+,
#        "for an object in a thin category and an object in a meet-semilattice of formal differences",
#        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfDifferences ],
#        
#  UnionOfMultipleDifferences );

##
InstallMethod( \+,
        "for an object in a meet-semilattice of formal multiple differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsObjectInThinCategory ],
        
  UnionOfMultipleDifferences );

##
InstallMethod( \+,
        "for an object in a thin category and an object in a meet-semilattice of formal multiple differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  UnionOfMultipleDifferences );

##
InstallMethod( \+,
        "for two constructible objects as unions of formal multiple differences",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences, IsObjectInThinCategory ],
        
  UnionOfMultipleDifferences );

##
InstallGlobalFunction( UnionOfMultipleDifferencesOfNormalizedObjects,
  function( arg )
    local A, C;
    
    A := rec( );

    C := BooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences(
                 CapCategory( PairInUnderlyingLattice( ListOfObjectsInMeetSemilatticeOfDifferences( arg[1] )[1] )[1] ) );
    
    ObjectifyObjectForCAPWithAttributes( A, C,
            ListOfNormalizedObjectsInMeetSemilatticeOfMultipleDifferences, arg
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ListOfObjectsInMeetSemilatticeOfMultipleDifferences,
        "for a constructible object as a union of formal multiple differences",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences ],
        
  ListOfPreObjectsInMeetSemilatticeOfMultipleDifferences );

##
InstallMethod( ListOfObjectsInMeetSemilatticeOfMultipleDifferences,
        "for a constructible object as a union of formal multiple differences",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences and HasListOfNormalizedObjectsInMeetSemilatticeOfMultipleDifferences ],
        
  ListOfNormalizedObjectsInMeetSemilatticeOfDifferences );

##
InstallMethod( ListOfObjectsInMeetSemilatticeOfMultipleDifferences,
        "for a constructible object as a union of formal multiple differences",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences and HasListOfStandardObjectsInMeetSemilatticeOfMultipleDifferences ],
        
  ListOfStandardObjectsInMeetSemilatticeOfMultipleDifferences );

##
InstallMethod( CanonicalObject,
        "for a constructible object as a union of formal multiple differences",
        [ ListOfStandardObjectsInMeetSemilatticeOfMultipleDifferences ],
        
  function( A )
    
    A := ListOfObjectsInMeetSemilatticeOfDifferences( A );
    
    return Iterated( A, function( C, D ) return CanonicalObjectOp( C + D ); end );
    
end );

##
InstallMethod( Display,
        "for a constructible object as a union of formal multiple differences",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences ],

  function( A )
    
    Perform( ListOfObjectsInMeetSemilatticeOfMultipleDifferences( A ), Display );
    
    Print( "\nA constructible object given by the union of the above formal multiple differences\n" );
    
end );
