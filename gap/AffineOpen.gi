# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

## fallback method
InstallMethod( BaseOfFibration,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframe and IsObjectInZariskiFrameOrCoframeOfAnAffineVariety ],
        
  function( A )
    
    return TerminalObject( ZariskiFrameOfAffineSpectrum( UnderlyingRing( A ) ) );
    
end );

##
InstallMethod( OpenSubsetOfSpec,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( I )
    local R, R_elim, A, ZF, B;
    
    R := HomalgRing( I );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := R_elim * I;
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrum( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                PreUnderlyingMatrix, I,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrum( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                PreUnderlyingMatrix, I,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( I )
    local R, R_elim, A, ZF, B;
    
    R := HomalgRing( I );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := R_elim * I;
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrum( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ReducedUnderlyingColumn, I,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrum( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ReducedUnderlyingColumn, I,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByListOfColumns,
        "for a list",
        [ IsList ],

  function( L )
    local l, R, R_elim, A, ZF, B;
    
    List( L, IsZero );
    
    l := L[1];
    
    L := Filtered( L, l -> not IsOne( l ) );
    
    if L = [ ] then
        L := [ l ];
    fi;
    
    L := DuplicateFreeList( L );
    
    R := HomalgRing( l );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        L := List( L, I -> R_elim * I );
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrum( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ListOfUnderlyingColumns, L,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrum( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ListOfUnderlyingColumns, L,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( I )
    local R, R_elim, A, ZF, B;
    
    R := HomalgRing( I );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := R_elim * I;
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrum( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                StandardUnderlyingColumn, I,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrum( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                StandardUnderlyingColumn, I,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpec,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfSpec( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfSpecByReducedColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfSpecByStandardColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiFrameOfAffineSpectrum,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiFrame;
    
    R := PolynomialRingWithProductOrdering( R );
    
    name := "The frame of Zariski open subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name );
    
    SetFilterObj( ZariskiFrame, IsZariskiFrameOfAnAffineVariety );
    
    ZariskiFrame!.category_as_first_argument := true;
    
    SetUnderlyingRing( ZariskiFrame, R );
    
    ZariskiFrame!.Constructor := OpenSubsetOfSpec;
    ZariskiFrame!.ConstructorByListOfColumns := OpenSubsetOfSpecByListOfColumns;
    ZariskiFrame!.ConstructorByReducedColumn := OpenSubsetOfSpecByReducedColumn;
    ZariskiFrame!.ConstructorByStandardColumn := OpenSubsetOfSpecByStandardColumn;
    
    AddObjectRepresentation( ZariskiFrame, IsObjectInZariskiFrameOfAnAffineVariety );
    
    AddMorphismRepresentation( ZariskiFrame, IsMorphismInZariskiFrameOfAnAffineVariety );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( ZariskiFrame );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES( ZariskiFrame );
    
    ##
    AddIsHomSetInhabited( ZariskiFrame,
      { cat, S, T } -> IsHomSetInhabitedForFrames( S, T ) );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiFrame,
          { cat, A, B } -> IsEqualForObjectsIfIsHomSetInhabitedForFrames( A, B ) );
        
    fi;
    
    ##
    AddIsEqualForObjects( ZariskiFrame,
      function( cat, A, B )
        
        if not DimensionOfComplement( A ) = DimensionOfComplement( B ) then
            return false;
        fi;
        
        return IsHomSetInhabited( A, B ) and IsEqualForObjectsIfIsHomSetInhabited( A, B );
        
    end );
    
    ##
    AddTerminalObject( ZariskiFrame,
      function( cat )
        local T;
        
        T := OpenSubsetOfSpecByStandardColumn( HomalgIdentityMatrix( 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiFrame,
      function( cat )
        local I;
        
        I := OpenSubsetOfSpecByStandardColumn( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiFrame,
      function( cat, A )
        local R, id, mats;
        
        R := UnderlyingRing( cat );
        
        id := HomalgIdentityMatrix( 1, R );
        
        mats := ListOfUnderlyingColumns( A );
        
        return ForAll( mats, mat -> IsZero( DecideZeroRows( id, mat ) ) );
        
    end );
    
    ##
    AddIsInitial( ZariskiFrame,
      function( cat, A )
        
        return IsZero( UnderlyingColumn( A ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiFrame,
      function( cat, L )
        local l;
        
        ## triggers radical computations which we want to avoid by all means
        #L := MaximalObjects( L, IsHomSetInhabited );
        ## instead:
        
        l := L[1];
        
        ## testing the membership of 1 might be very expensive for some ideals in the sum
        if ForAny( L, a -> HasIsTerminal( a ) and IsTerminal( a ) ) then
            return TerminalObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsInitial( A ) );
        
        if L = [ ] then
            return InitialObject( CapCategory( l ) );
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
        
        l := OpenSubsetOfSpec( l );
        
        SetIsInitial( l, false );
        
        return l;
        
    end );
    
    ##
    AddDirectProduct( ZariskiFrame,
      function( cat, L )
        local l;
        
        l := L[1];
        
        if ForAny( L, IsInitial ) then
            return InitialObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsTerminal( A ) );
        
        if L = [ ] then
            return TerminalObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, ListOfUnderlyingColumns );
        
        L := Concatenation( L );
        
        l := OpenSubsetOfSpecByListOfColumns( L );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    ##
    AddExponentialOnObjects( ZariskiFrame,
      function( cat, A, B )
        local L;
        
        A := BestUnderlyingColumn( A );
        
        if IsZero( A ) then
            return TerminalObject( CapCategory( B ) );
        fi;
        
        B := BestUnderlyingColumn( B );
        
        L := List( [ 1 .. NrRows( A ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( A, [ r ] ), B ) );
        
        L := List( L, OpenSubsetOfSpecByReducedColumn );
        
        return DirectProduct( L );
        
    end );
    
    Finalize( ZariskiFrame );
    
    ZariskiFrame!.ZariskiCoframe := ZariskiCoframeOfAffineSpectrum( R );
    
    SetZariskiFrameOfAffineSpectrum( R, ZariskiFrame );
    
    return ZariskiFrame;
    
end );

##
InstallMethod( IsClosedSubobject,
        "for an object in a Zariski frame of an affine variety",
        [ IsObjectInZariskiFrameOfAnAffineVariety ],

  function( A )
    
    return IsClosed( AsDifferenceOfClosed( A ) );
    
end );

##
InstallMethod( DimensionOfComplement,
        "for an object in a Zariski frame of an affine variety",
        [ IsObjectInZariskiFrameOfAnAffineVariety ],
        
  function( A )
    
    A := ListOfUnderlyingColumns( A );
    
    return Maximum( List( A, AffineDimension ) );
    
end );

##
InstallMethod( DegreeOfComplement,
        "for an object in a Zariski frame of an affine variety",
        [ IsObjectInZariskiFrameOfAnAffineVariety ],

  function( A )
    
    return AffineDegree( BestUnderlyingColumn( A ) );
    
end );
