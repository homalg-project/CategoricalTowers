#
# Locales: MeetSemilatticeOfDifferences
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
    
    SetIsStrictMonoidalCategory( D, true );
    
    SetIsSymmetricClosedMonoidalCategory( D, true );
    
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
        
        return IsSubset( Coproduct( Ap, B ), A ) and IsSubset( Ap, DirectProduct( A, Bp ) );
        
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
            PrePairInUnderlyingLattice, [ A, B ]
            );
    
    Assert( 4, IsWellDefinedForObjects( C ) );
    
    return C;
    
end );

##
InstallMethod( \-,
        "for an object in a thin category and the zero integer",
        [ IsObjectInThinCategory, IsInt and IsZero ],
        
  function( A, B )
    
    return A - InitialObject( CapCategory( A ) );
    
end );

##
InstallMethod( AdditiveInverseMutable,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( A )
    
    return TerminalObject( CapCategory( A ) ) - A;
    
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
            NormalizedPairInUnderlyingHeytingAlgebra, [ A, B ]
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
    
    H := InternalHomOnObjects( T, S );
    
    if HasIsCartesianClosedCategory( L ) and IsCartesianClosedCategory( L ) then
        
        return [ Coproduct( H, T ), H ];
        
    elif HasIsCocartesianCoclosedCategory( L ) and IsCocartesianCoclosedCategory( L ) then
        
        return [ H, DirectProduct( S, H ) ];
        
    fi;
    
    TryNextMethod( );
    
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
InstallMethod( AdditiveInverseMutable,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    A := PairInUnderlyingLattice( A );
    
    return A[2] - A[1];
    
end );

##
InstallMethod( AdditiveInverseMutable,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences and HasNormalizedPairInUnderlyingHeytingAlgebra ],
        
  function( A )
    
    A := NormalizedPairInUnderlyingHeytingAlgebra( A );
    
    return NormalizedPairInUnderlyingHeytingAlgebra( A[2], A[1] );
    
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
InstallMethod( Display,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    A := PairInUnderlyingLattice( A );
    
    Display( A[1] );
    
    Print( "\n\\\n\n" );
    
    Display( A[2] );
    
    Print( "\nA formal difference given by the above morphism\n" );
    
end );
