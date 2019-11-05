#
# ZariskiFrames: The frame of Zariski open subsets in an affine variety
#
# Implementations
#

## fallback method
InstallMethod( BaseOfFibration,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframe and IsObjectInZariskiFrameOrCoframeOfAnAffineVariety ],
        
  function( A )
    
    return TerminalObject( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( UnderlyingRing( A ) ) );
    
end );

##
InstallMethod( OpenSubsetOfSpec,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, R_elim, A, ZF, B;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := AsMorphismInCategoryOfRows( R_elim * UnderlyingMatrix( I ) );
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                PreMorphismOfUnderlyingCategory, I,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                PreMorphismOfUnderlyingCategory, I,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpec,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfSpec( AsMorphismInCategoryOfRows( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, R_elim, A, ZF, B;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := AsMorphismInCategoryOfRows( R_elim * UnderlyingMatrix( I ) );
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ReducedMorphismOfUnderlyingCategory, I,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ReducedMorphismOfUnderlyingCategory, I,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfSpecByReducedMorphism( AsMorphismInCategoryOfRows( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByListOfMorphismsOfRank1Range,
        "for a list",
        [ IsList ],

  function( L )
    local l, R, R_elim, A, ZF, B;
    
    List( L, IsZero );
    
    l := L[1];
    
    L := Filtered( L, l -> not ( IsEndomorphism( l ) and IsOne( l ) ) );
    
    if L = [ ] then
        L := [ l ];
    fi;
    
    L := DuplicateFreeList( L );
    
    R := UnderlyingRing( CapCategory( l ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        L := List( L, I -> AsMorphismInCategoryOfRows( R_elim * UnderlyingMatrix( I ) ) );
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ListOfMorphismsOfRank1RangeOfUnderlyingCategory, L,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                ListOfMorphismsOfRank1RangeOfUnderlyingCategory, L,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, R_elim, A, ZF, B;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := AsMorphismInCategoryOfRows( R_elim * UnderlyingMatrix( I ) );
        R := R_elim;
    fi;
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    B := BaseRing( R );
    
    if not IsIdenticalObj( R, B ) then
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                StandardMorphismOfUnderlyingCategory, I,
                UnderlyingRing, R,
                BaseOfFibration, TerminalObject( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( B ) ),
                IsOpen, true
                );
    else
        ObjectifyObjectForCAPWithAttributes( A, ZF,
                StandardMorphismOfUnderlyingCategory, I,
                UnderlyingRing, R,
                IsOpen, true
                );
    fi;
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfSpecByStandardMorphism( AsMorphismInCategoryOfRows( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfSpec,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfSpec( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfSpecByReducedMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfSpecByStandardMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiFrame;
    
    R := PolynomialRingWithProductOrdering( R );
    
    name := "The frame of Zariski open subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name );
    
    SetUnderlyingRing( ZariskiFrame, R );
    
    ZariskiFrame!.UnderlyingCategory := CategoryOfRows( R );
    
    ZariskiFrame!.Constructor := OpenSubsetOfSpec;
    ZariskiFrame!.ConstructorByListOfMorphismsOfRank1Range := OpenSubsetOfSpecByListOfMorphismsOfRank1Range;
    ZariskiFrame!.ConstructorByReducedMorphism := OpenSubsetOfSpecByReducedMorphism;
    ZariskiFrame!.ConstructorByStandardMorphism := OpenSubsetOfSpecByStandardMorphism;
    
    AddObjectRepresentation( ZariskiFrame, IsObjectInZariskiFrameOfAnAffineVariety );
    
    AddMorphismRepresentation( ZariskiFrame, IsMorphismInZariskiFrameOfAnAffineVariety );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( ZariskiFrame );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows( ZariskiFrame );
    
    ##
    AddIsHomSetInhabited( ZariskiFrame,
      IsHomSetInhabitedForFramesUsingCategoryOfRows );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiFrame,
          IsEqualForObjectsIfIsHomSetInhabitedForFramesUsingCategoryOfRows );
        
    fi;
    
    ##
    AddIsEqualForObjects( ZariskiFrame,
      function( A, B )
        
        if not DimensionOfComplement( A ) = DimensionOfComplement( B ) then
            return false;
        fi;
        
        return IsHomSetInhabited( A, B ) and IsEqualForObjectsIfIsHomSetInhabited( A, B );
        
    end );
    
    ##
    AddTerminalObject( ZariskiFrame,
      function( arg )
        local T;
        
        T := OpenSubsetOfSpecByStandardMorphism( HomalgIdentityMatrix( 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiFrame,
      function( arg )
        local I;
        
        I := OpenSubsetOfSpecByStandardMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiFrame,
      function( A )
        local mor, one;
        
        mor := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
        
        ## avoid the warning "an empty matrix is about to get evaluated!"
        List( mor, IsZero );
        
        one := StandardMorphismOfUnderlyingCategory( TerminalObject( A ) );
        
        return ForAll( mor, m -> IsLiftable( one, m ) );
        
    end );
    
    ##
    AddIsInitial( ZariskiFrame,
      function( A )
        
        return IsZero( MorphismOfRank1RangeOfUnderlyingCategory( A ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiFrame,
      function( L )
        local l;
        
        ## triggers radical computations which we want to avoid by all means
        #L := MaximalObjects( L, IsHomSetInhabited );
        ## instead:
        
        l := L[1];
        
        if ForAny( L, IsTerminal ) then
            return TerminalObject( l );
        fi;
        
        L := Filtered( L, A -> not IsInitial( A ) );
        
        if L = [ ] then
            return InitialObject( l );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfRank1RangeOfUnderlyingCategory );
        
        L := DuplicateFreeList( L );
        
        ## examples show that the GB computations of the entries of L
        ## (needed to check IsLiftable) might be immensely more expensive
        ## than the GB of the resulting UniversalMorphismFromDirectSum( L ),
        ## so never execute the next line:
        #L := MaximalObjects( L, IsLiftable );
        
        l := UniversalMorphismFromDirectSum( L );
        
        l := OpenSubsetOfSpec( l );
        
        SetIsInitial( l, false );
        
        return l;
        
    end );
    
    ##
    AddDirectProduct( ZariskiFrame,
      function( L )
        local l;
        
        l := L[1];
        
        if ForAny( L, IsInitial ) then
            return InitialObject( l );
        fi;
        
        L := Filtered( L, A -> not IsTerminal( A ) );
        
        if L = [ ] then
            return TerminalObject( l );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, ListOfMorphismsOfRank1RangeOfUnderlyingCategory );
        
        L := Concatenation( L );
        
        l := OpenSubsetOfSpecByListOfMorphismsOfRank1Range( L );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    ##
    AddExponentialOnObjects( ZariskiFrame,
      function( A, B )
        local L;
        
        A := MorphismOfUnderlyingCategory( A );
        
        if IsZero( A ) then
            return TerminalObject( B );
        fi;
        
        B := MorphismOfUnderlyingCategory( B );
        
        A := UnderlyingMatrix( A );
        B := UnderlyingMatrix( B );
        
        L := List( [ 1 .. NrRows( A ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( A, [ r ] ), B ) );
        
        L := List( L, OpenSubsetOfSpecByReducedMorphism );
        
        return DirectProduct( L );
        
    end );
    
    Finalize( ZariskiFrame );
    
    ZariskiFrame!.ZariskiCoframe := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
    
    SetZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R, ZariskiFrame );
    
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
    
    A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    A := List( A, UnderlyingMatrix );
    
    return Maximum( List( A, AffineDimension ) );
    
end );

##
InstallMethod( DegreeOfComplement,
        "for an object in a Zariski frame of an affine variety",
        [ IsObjectInZariskiFrameOfAnAffineVariety ],

  function( A )
    
    return AffineDegree( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
end );
