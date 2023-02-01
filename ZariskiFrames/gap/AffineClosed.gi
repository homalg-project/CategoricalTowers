# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( BaseOfFibration,
        "for a Zariski coframe of an affine variety",
        [ IsZariskiCoframeOfAnAffineVariety ],
        
  function( ZC )
    
    return TerminalObject( ZC );
    
end );

##
InstallMethod( ClosedSubsetOfSpec,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( I )
    local R, R_elim, ZC, A;
    
    R := HomalgRing( I );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := R_elim * I;
        R := R_elim;
    fi;
    
    ZC := ZariskiCoframeOfAffineSpectrum( R );
    
    A := ObjectInZariskiFrameOrCoframe( ZC, I );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfSpec,
        "for a homalg ring element",
        [ IsHomalgRingElement ],
        
  function( r )
    
    return ClosedSubsetOfSpec( HomalgMatrix( [ r ], 1, 1, HomalgRing( r ) ) );

end );

##
InstallMethod( ClosedSubsetOfSpecByRadicalColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( I )
    local R, R_elim, ZC, A;
    
    R := HomalgRing( I );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := R_elim * I;
        R := R_elim;
    fi;
    
    ZC := ZariskiCoframeOfAffineSpectrum( R );
    
    A := ObjectInZariskiFrameOrCoframeByRadicalColumn( ZC, I );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfSpecByRadicalColumn,
        "for a homalg ring element",
        [ IsHomalgRingElement ],
        
  function( r )
    
    return ClosedSubsetOfSpecByRadicalColumn( HomalgMatrix( [ r ], 1, 1, HomalgRing( r ) ) );

end );
    
##
InstallMethod( ClosedSubsetOfSpecByListOfColumns,
        "for a list",
        [ IsList ],
        
  function( L )
    local R, R_elim, ZC, A;
    
    R := HomalgRing( L[1] );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        L := List( L, I -> R_elim * I );
        R := R_elim;
    fi;
    
    ZC := ZariskiCoframeOfAffineSpectrum( R );
    
    A := ObjectInZariskiFrameOrCoframeByListOfColumns( ZC, L );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfSpecByListOfRadicalColumns,
        "for a list",
        [ IsList ],
        
  function( L )
    local R, R_elim, ZC, A;
    
    R := HomalgRing( L[1] );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        L := List( L, I -> R_elim * I );
        R := R_elim;
    fi;
    
    ZC := ZariskiCoframeOfAffineSpectrum( R );
    
    A := ObjectInZariskiFrameOrCoframeByListOfRadicalColumns( ZC, L );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfSpecByStandardColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( I )
    local R, R_elim, ZC, A;
    
    R := HomalgRing( I );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := R_elim * I;
        R := R_elim;
    fi;
    
    ZC := ZariskiCoframeOfAffineSpectrum( R );
    
    A := ObjectInZariskiFrameOrCoframeByStandardColumn( ZC, I );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfSpecByStandardColumn,
        "for a homalg ring element",
        [ IsHomalgRingElement ],
        
  function( r )
    
    return ClosedSubsetOfSpecByStandardColumn( HomalgMatrix( [ r ], 1, 1, HomalgRing( r ) ) );

end );
    
##
InstallMethod( ClosedSubsetOfSpec,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],
        
  function( str, R )
    
    return ClosedSubsetOfSpec( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfSpecByRadicalColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],
        
  function( str, R )
    
    return ClosedSubsetOfSpecByRadicalColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfSpecByStandardColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],
        
  function( str, R )
    
    return ClosedSubsetOfSpecByStandardColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiCoframeOfAffineSpectrum,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiCoframe, B;
    
    R := PolynomialRingWithProductOrdering( R );
    
    name := "The coframe of Zariski closed subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiCoframe := CreateCapCategory( name,
                              IsZariskiCoframeOfAnAffineVariety,
                              IsObjectInZariskiCoframeOfAnAffineVariety,
                              IsMorphismInZariskiCoframeOfAnAffineVariety,
                              IsCapCategoryTwoCell );
    
    ZariskiCoframe!.category_as_first_argument := true;
    
    SetIsCoHeytingAlgebra( ZariskiCoframe, true );
    
    ZariskiCoframe!.Constructor := ClosedSubsetOfSpec;
    ZariskiCoframe!.ConstructorByListOfColumns := ClosedSubsetOfSpecByListOfColumns;
    ZariskiCoframe!.ConstructorByRadicalColumn := ClosedSubsetOfSpecByRadicalColumn;
    ZariskiCoframe!.ConstructorByStandardColumn := ClosedSubsetOfSpecByStandardColumn;
    
    SetUnderlyingRing( ZariskiCoframe, R );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES( ZariskiCoframe );
    
    ##
    AddIsHomSetInhabited( ZariskiCoframe,
      { cat, S, T } -> IsHomSetInhabitedForCoframes( cat, S, T ) );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiCoframe,
          { cat, A, B } -> IsEqualForObjectsIfIsHomSetInhabitedForCoframes( cat, A, B ) );
        
    fi;
    
    ##
    AddIsEqualForObjects( ZariskiCoframe,
      function( cat, A, B )
        
        if not Dimension( A ) = Dimension( B ) then
            return false;
        fi;
        
        return IsHomSetInhabited( cat, A, B ) and IsEqualForObjectsIfIsHomSetInhabited( cat, A, B );
        
    end );
    
    ##
    AddTerminalObject( ZariskiCoframe,
      function( cat )
        local T;
        
        T := ClosedSubsetOfSpecByStandardColumn( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiCoframe,
      function( cat )
        local I;
        
        I := ClosedSubsetOfSpecByStandardColumn( HomalgIdentityMatrix( 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiCoframe,
      function( cat, A )
        
        return IsZero( UnderlyingColumn( A ) );
        
    end );
    
    ##
    AddIsInitial( ZariskiCoframe,
      function( cat, A )
        local R, id, mats;
        
        R := UnderlyingRing( cat );
        
        id := HomalgIdentityMatrix( 1, R );
        
        mats := UnderlyingListOfColumns( A );
        
        return ForAll( mats, mat -> IsZero( DecideZeroRows( id, mat ) ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiCoframe,
      function( cat, L )
        local l;
        
        l := L[1];
        
        if ForAny( L, IsTerminal ) then
            return TerminalObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsInitial( A ) );
        
        if L = [ ] then
            return InitialObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, UnderlyingListOfColumns );
        
        L := Concatenation( L );
        
        l := ClosedSubsetOfSpecByListOfColumns( L );
        
        SetIsInitial( l, false );
        
        return l;
        
    end );
    
    ##
    AddDirectProduct( ZariskiCoframe,
      function( cat, L )
        local l;
        
        ## triggers radical computations which we want to avoid by all means
        #L := MaximalObjects( L, IsSubset );
        ## instead:
        
        l := L[1];

        ## testing the membership of 1 might be very expensive for some ideals in the sum
        if ForAny( L, a -> HasIsInitial( a ) and IsInitial( a ) ) then
            return InitialObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsTerminal( A ) );
        
        if L = [ ] then
            return TerminalObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, UnderlyingColumn );
        
        L := DuplicateFreeList( L );
        
        ## examples show that the GB computations of the entries of L
        ## (needed to check IsZero @ DecideZeroRows) might be immensely more expensive
        ## than the GB of the resulting UnionOfRows( L ),
        ## so never execute the next line:
        #L := MaximalObjects( L, { a, b } -> IsZero( DecideZeroRows( a, b ) ) );
        
        l := UnionOfRows( L );
        
        l := ClosedSubsetOfSpec( l );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    ## the closure of the set theortic difference
    AddCoexponentialOnObjects( ZariskiCoframe,
      function( cat, A, B )
        local L;
        
        B := BestUnderlyingColumn( B );
        
        if IsZero( B ) then
            return InitialObject( CapCategory( A ) );
        fi;
        
        A := BestUnderlyingColumn( A );
        
        L := List( [ 1 .. NrRows( B ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( B, [ r ] ), A ) );
        
        L := List( L, ClosedSubsetOfSpecByRadicalColumn );
        
        return Coproduct( L );
        
    end );
    
    Finalize( ZariskiCoframe );
    
    SetZariskiCoframeOfAffineSpectrum( R, ZariskiCoframe );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        SetBaseOfFibration( ZariskiCoframe, TerminalObject( ZariskiCoframeOfAffineSpectrum( B ) ) );
    fi;
    
    return ZariskiCoframe;
    
end );

##
InstallOtherMethod( IsOpen,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallOtherMethod( Dimension,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( A )
    
    A := UnderlyingListOfColumns( A );
    
    return Maximum( List( A, AffineDimension ) );
    
end );

##
InstallOtherMethod( DegreeAttr,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( A )
    
    return AffineDegree( BestUnderlyingColumn( A ) );
    
end );

##
InstallMethod( AClosedSingleton,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframe and IsObjectInZariskiFrameOrCoframeOfAnAffineVariety ],
        
  function( A )
    local C;
    
    if IsInitial( A ) then
        Error( "the input A is empty\n" );
    fi;
    
    C := CapCategory( A );
    
    A := UnderlyingStandardColumn( A );
    
    A := AMaximalIdealContaining( A );
    
    A := C!.ConstructorByRadicalColumn( A );
    
    return A;
    
end );

## the second argument is for the method selection
InstallMethod( RabinowitschCover,
        "for an object in a meet-semilattice of formal single differences and an object in a Zariski coframe of an affine variety",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( A, Ac )
    local Ap, R, indets, B, S, t;
    
    A := StandardizeObject( A );
    
    Ap := A.J;
    Ap := BestUnderlyingColumn( Ap );
    
    A := A.I;
    
    A := BestUnderlyingColumn( A );
    
    R := HomalgRing( A );
    
    Ap := DecideZeroRows( Ap, A );
    Ap := CertainRows( Ap, NonZeroRows( Ap ) );
    
    indets := List( RelativeIndeterminatesOfPolynomialRing( R ), String );
    
    B := BaseRing( R );
    
    S := B * Concatenation( indets, [ "t_Rabinowitsch" ] );
    
    t := RelativeIndeterminatesOfPolynomialRing( S )[Length( indets) + 1];
    
    A := S * A;
    Ap := S * Ap;
    
    Ap := EntriesOfHomalgMatrix( Ap );
    Ap := DuplicateFreeList( Ap );
    Ap := List( Ap, a -> t * a - 1 );
    
    Ap := List( Ap, p -> HomalgMatrix( [ p ], 1, 1, S ) );
    A := List( Ap, p -> UnionOfRows( A, p ) );
    
    A := List( A, ClosedSubsetOfSpecByRadicalColumn );
    
    return Sum( A );
    
end );

##
InstallMethod( TangentSpaceAtPoint,
        "for an object in a Zariski coframe of an affine variety and a homalg matrix",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ],
        
  function( gamma, point )
    local R, T, var;
    
    R := UnderlyingRing( gamma );
    
    gamma := BestUnderlyingColumn( gamma );
    
    T := TangentSpaceByEquationsAtPoint( gamma, point );
    
    var := Indeterminates( R );
    
    T := ( R * T ) * HomalgMatrix( var, Length( var ), 1, R );
    
    return ClosedSubsetOfSpecByRadicalColumn( T );
    
end );

##
InstallMethod( TangentSpaceAtPoint,
        "for an object in a Zariski coframe of an affine variety and a list",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ],
        
  function( gamma, point )
    local R, k;
    
    R := UnderlyingRing( gamma );
    
    k := CoefficientsRing( R );
    
    point := HomalgMatrix( point, Length( point ), 1, k );
    
    return TangentSpaceAtPoint( gamma, point );
    
end );

##
InstallMethod( ComplementOfTangentSpaceAtPoint,
        "for an object in a Zariski coframe of an affine variety and a homalg matrix",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ],
        
  function( gamma, point )
    local R, T;
    
    R := UnderlyingRing( gamma );
    
    gamma := BestUnderlyingColumn( gamma );
    
    T := TangentSpaceByEquationsAtPoint( gamma, point );
    
    return MatrixOfGenerators( ByASmallerPresentation( LeftPresentation( T ) ) );
    
end );

##
InstallMethod( ComplementOfTangentSpaceAtPoint,
        "for an object in a Zariski coframe of an affine variety and a list",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ],
        
  function( gamma, point )
    local R, k;
    
    R := UnderlyingRing( gamma );
    
    k := CoefficientsRing( R );
    
    point := HomalgMatrix( point, Length( point ), 1, k );
    
    return ComplementOfTangentSpaceAtPoint( gamma, point );
    
end );
