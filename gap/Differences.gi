#
# Locales: Differences
#
# Implementations
#

##
InstallMethod( MeetSemilatticeOfDifferences,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( P )
    local name, D, L;
    
    name := "The meet-semilattice of differences of ";
    
    name := Concatenation( name, Name( P ) );
    
    D := CreateCapCategory( name );
    
    D!.UnderlyingCategory := P;
    
    AddObjectRepresentation( D, IsObjectInMeetSemilatticeOfDifferences );
    
    AddMorphismRepresentation( D, IsMorphismInMeetSemilatticeOfDifferences );
    
    SetIsStrictCartesianCategory( D, true );
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( D );
    
    ##
    AddIsWellDefinedForObjects( D,
      function( A )
        local L;
        
        A := PairInUnderlyingLattice( A );
        
        L := CapCategory( A[1] );
        
        return IsIdenticalObj( L, CapCategory( A[2] ) ) and ForAll( A, IsWellDefinedForObjects );
        
    end );
    
    ##
    AddIsHomSetInhabited( D,
      function( A, B )
        local Ap, Bp;
        
        A := PairInUnderlyingLattice( A );
        B := PairInUnderlyingLattice( B );
        
        Ap := A[2];
        A := A[1];
        
        Bp := B[2];
        B := B[1];
        
        return IsHomSetInhabited( A, Coproduct( Ap, B ) ) and IsHomSetInhabited( DirectProduct( A, Bp ), Ap );
        
    end );
    
    L := ListInstalledOperationsOfCategory( P );
    
    if not ( HasIsSkeletalCategory( P ) and IsSkeletalCategory( P ) ) then
        Error( "the category is not known to be skeletal\n" );
    elif not ( "DirectProduct" in L and "Coproduct" in L ) then
        Error( "the category does not seem to be a lattice\n" );
    fi;
    
    ##
    AddTerminalObject( D,
      function( arg )
        local T, I;
        
        T := TerminalObject( D!.UnderlyingCategory );
        I := InitialObject( D!.UnderlyingCategory );
        
        return T - I;
        
    end );
    
    ##
    AddInitialObject( D,
      function( arg )
        local I;
        
        I := InitialObject( D!.UnderlyingCategory );
        
        return I - I;
        
    end );
    
    ##
    AddDirectProduct( D,
      function( L )
        local T, S;
        
        L := List( L, PairInUnderlyingLattice );
        
        T := DirectProduct( List( L, a -> a[1] ) );
        S := Coproduct( List( L, a -> a[2] ) );
        
        return T - S;
        
    end );
    
    Finalize( D );
    
    return D;
    
end );

##
InstallMethod( \-,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
        
  function( A, B )
    local C, D;
    
    C := rec( );
    
    D := MeetSemilatticeOfDifferences( CapCategory( A ) );
    
    ObjectifyObjectForCAPWithAttributes( C, D,
            PrePairInUnderlyingLattice, [ A, B ],
            IsLocallyClosed, true
            );
    
    Assert( 4, IsWellDefinedForObjects( C ) );
    
    return C;
    
end );

##
InstallMethod( \-,
        "for an object in a meet-semilattice of formal differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    A := PairInUnderlyingLattice( A );
    
    return A[1] - ( A[2] + B );
    
end );

##
InstallMethod( \-,
        "for an object in a thin category and the zero integer",
        [ IsObjectInThinCategory, IsInt and IsZero ],
        
  function( A, B )
    
    return A - InitialObject( A );
    
end );

##
InstallMethod( \-,
        "for an object in a meet-semilattice of formal differences and the zero integer",
        [ IsObjectInMeetSemilatticeOfDifferences, IsInt and IsZero ],
        
  function( A, B )
    
    return A;
    
end );

##
InstallMethod( AdditiveInverseMutable,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    
    return TerminalObject( A ) - A;
    
end );

##
InstallMethod( FormalDifferenceOfNormalizedObjects,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
        
  function( A, B )
    local C, D;
    
    C := rec( );

    D := MeetSemilatticeOfDifferences( CapCategory( A ) );
    
    ObjectifyObjectForCAPWithAttributes( C, D,
            NormalizedPairInUnderlyingHeytingAlgebra, [ A, B ],
            IsLocallyClosed, true
            );
    
    Assert( 4, IsWellDefined( C ) );
    
    return C;
    
end );

##
InstallMethod( NormalizedPairInUnderlyingHeytingAlgebra,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    local S, T, L, H;
    
    A := PairInUnderlyingLattice( A );
    
    S := A[2];
    T := A[1];
    
    L := CapCategory( S );
    
    if HasIsCartesianClosedCategory( L ) and IsCartesianClosedCategory( L ) then
        
        H := ExponentialOnObjects( T, S );
        
        return [ Coproduct( H, T ), H ];
        
    elif HasIsCocartesianCoclosedCategory( L ) and IsCocartesianCoclosedCategory( L ) then
        
        H := CoexponentialOnObjects( T, S );
        
        return [ H, DirectProduct( S, H ) ];
        
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( NormalizedObject,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    List( NormalizedPairInUnderlyingHeytingAlgebra( A ), IsInitial );
    
    if IsInitial( A ) then
        return InitialObject( A );
    fi;
    
    return A;
    
end );

##
InstallMethod( StandardObject,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    List( StandardPairInUnderlyingHeytingAlgebra( A ), IsInitial );
    
    if IsInitial( A ) then
        return InitialObject( A );
    fi;
    
    return A;
    
end );

##
InstallMethod( PairInUnderlyingLattice,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  PrePairInUnderlyingLattice );

##
InstallMethod( PairInUnderlyingLattice,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences and HasNormalizedPairInUnderlyingHeytingAlgebra ],
        
  NormalizedPairInUnderlyingHeytingAlgebra );

##
InstallMethod( PairInUnderlyingLattice,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences and HasStandardPairInUnderlyingHeytingAlgebra ],
        
  StandardPairInUnderlyingHeytingAlgebra );

##
InstallMethod( NormalizedPairInUnderlyingHeytingAlgebra,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences and HasStandardPairInUnderlyingHeytingAlgebra ],
        
  StandardPairInUnderlyingHeytingAlgebra );

##
InstallMethod( IsClosed,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) then
        return IsInitial( NormalizedPairInUnderlyingHeytingAlgebra( A )[2] );
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( IsOpen,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallMethod( Closure,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCocartesianCoclosedCategory( H ) and IsCocartesianCoclosedCategory( H ) then
        return NormalizedPairInUnderlyingHeytingAlgebra( A )[1];
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( LocallyClosedApproximation,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    if IsClosed( A ) then
        return Closure( A );
    fi;
    
    return StandardObject( A );
    
end );

##
InstallMethod( CanonicalObject,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  LocallyClosedApproximation );

##
InstallMethod( AffineDimension,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    return AffineDimension( Closure( A ) );
    
end );

##
InstallMethod( \*,
        "for an object in a thin category and an object in a meet-semilattice of formal differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A, B )
    
    if IsObjectInMeetSemilatticeOfDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return ( A - 0 ) * B;
    
end );

##
InstallMethod( \*,
        "for an object in a meet-semilattice of formal differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    if IsObjectInMeetSemilatticeOfDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A * ( B - 0 );
    
end );

##
InstallMethod( \=,
        "for an object in a thin category and an object in a meet-semilattice of formal differences",
        [ IsObjectInThinCategory, IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A, B )
    
    if IsObjectInMeetSemilatticeOfDifferences( A ) then
        TryNextMethod( );
    fi;
    
    return ( A - 0 ) = B;
    
end );

##
InstallMethod( \=,
        "for an object in a meet-semilattice of formal differences and an object in a thin category",
        [ IsObjectInMeetSemilatticeOfDifferences, IsObjectInThinCategory ],
        
  function( A, B )
    
    if IsObjectInMeetSemilatticeOfDifferences( B ) then
        TryNextMethod( );
    fi;
    
    return A = ( B - 0 );
    
end );

##
InstallMethod( \.,
        "for an object in a meet-semilattice of formal differences and a positive integer",
        [ IsObjectInMeetSemilatticeOfDifferences, IsPosInt ],

  function( A, string_as_int )
    local name;
    
    A := PairInUnderlyingLattice( A );
    
    name := NameRNam( string_as_int );
    
    if name[1] = 'I' then
        return A[1];
    elif name[1] = 'J' then
        return A[2];
    fi;
    
    Error( "no component with this name available\n" );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    local n;
    
    A := PairInUnderlyingLattice( A );
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    ViewObj( A[1] : Locales_name := "I", Locales_number := n );
    Print( " \\\ " );
    ViewObj( A[2] : Locales_name := "J", Locales_number := n );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    A := PairInUnderlyingLattice( A );
    
    return Concatenation(
                   DisplayString( A[1] ),
                   " \\ ",
                   DisplayString( A[2] ) );
    
end );

##
InstallMethod( Display,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    Display( DisplayString( A ) );
    
end );
