#
# ZariskiFrames: Morphisms between affine varieties
#
# Implementations
#

##
InstallMethod( ClosedSubsetOfFiberedSpec,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, R_elim, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := AsCategoryOfRowsMorphism( R_elim * UnderlyingMatrix( I ) );
    fi;
    
    A := rec( );
    
    ZC := ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows( R_elim );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            PreMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R_elim,
            BaseOfFibration, TerminalObject( ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R_elim ) ) ),
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpec,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfFiberedSpec( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpec,
        "for a homalg ring element",
        [ IsHomalgRingElement ],

  function( r )
    
    return ClosedSubsetOfFiberedSpec( HomalgMatrix( [ r ], 1, 1, HomalgRing( r ) ) );

end );
    
##
InstallMethod( ClosedSubsetOfFiberedSpecByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, R_elim, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := AsCategoryOfRowsMorphism( R_elim * UnderlyingMatrix( I ) );
    fi;
    
    A := rec( );
    
    ZC := ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows( R_elim );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ReducedMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R_elim,
            BaseOfFibration, TerminalObject( ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R_elim ) ) ),
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfFiberedSpecByReducedMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByReducedMorphism,
        "for a homalg ring element",
        [ IsHomalgRingElement ],

  function( r )
    
    return ClosedSubsetOfFiberedSpecByReducedMorphism( HomalgMatrix( [ r ], 1, 1, HomalgRing( r ) ) );

end );
    
##
InstallMethod( ClosedSubsetOfFiberedSpecByListOfMorphismsOfRank1Range,
        "for a list",
        [ IsList ],

  function( L )
    local R, R_elim, A, ZC;
    
    R := UnderlyingRing( CapCategory( L[1] ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        L := List( L, m -> AsCategoryOfRowsMorphism( R_elim * UnderlyingMatrix( m ) ) );
    fi;
    
    A := rec( );
    
    ZC := ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows( R_elim );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ListOfMorphismsOfRank1RangeOfUnderlyingCategory, L,
            UnderlyingRing, R_elim,
            BaseOfFibration, TerminalObject( ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R_elim ) ) ),
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByStandardMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, R_elim, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R_elim, R ) then
        I := AsCategoryOfRowsMorphism( R_elim * UnderlyingMatrix( I ) );
    fi;
    
    A := rec( );
    
    ZC := ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows( R_elim );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            StandardMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R_elim,
            BaseOfFibration, TerminalObject( ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R_elim ) ) ),
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByStandardMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfFiberedSpecByStandardMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByStandardMorphism,
        "for a homalg ring element",
        [ IsHomalgRingElement ],

  function( r )
    
    return ClosedSubsetOfFiberedSpecByStandardMorphism( HomalgMatrix( [ r ], 1, 1, HomalgRing( r ) ) );

end );
    
##
InstallMethod( ClosedSubsetOfFiberedSpec,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfFiberedSpec( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByReducedMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfFiberedSpecByReducedMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfFiberedSpecByStandardMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfFiberedSpecByStandardMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiCoframe;
    
    name := "The coframe of Zariski closed subsets of the fibered affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiCoframe := CreateCapCategory( name );
    
    SetUnderlyingRing( ZariskiCoframe, R );
    
    ZariskiCoframe!.UnderlyingCategory := CategoryOfRows( R );
    
    ZariskiCoframe!.Constructor := ClosedSubsetOfFiberedSpec;
    ZariskiCoframe!.ConstructorByReducedMorphism := ClosedSubsetOfFiberedSpecByReducedMorphism;
    ZariskiCoframe!.ConstructorByStandardMorphism := ClosedSubsetOfFiberedSpecByStandardMorphism;
    
    AddObjectRepresentation( ZariskiCoframe, IsObjectInZariskiCoframeOfAnAffineVariety );
    
    AddMorphismRepresentation( ZariskiCoframe, IsMorphismInZariskiCoframeOfAnAffineVariety );
    
    ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS( ZariskiCoframe );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows( ZariskiCoframe );
    
    ##
    AddIsHomSetInhabited( ZariskiCoframe,
      IsHomSetInhabitedForCoframesUsingCategoryOfRows );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiCoframe,
          IsEqualForObjectsIfIsHomSetInhabitedForCoframesUsingCategoryOfRows );
        
    fi;
    
    ##
    AddTerminalObject( ZariskiCoframe,
      function( arg )
        local T;
        
        T := ClosedSubsetOfFiberedSpecByStandardMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiCoframe,
      function( arg )
        local I;
        
        I := ClosedSubsetOfFiberedSpecByStandardMorphism( HomalgIdentityMatrix( 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddCoproduct( ZariskiCoframe,
      function( L )
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, ListOfMorphismsOfRank1RangeOfUnderlyingCategory );
        
        L := Concatenation( L );
        
        return ClosedSubsetOfFiberedSpecByListOfMorphismsOfRank1Range( L );
            
    end );
    
    ##
    AddDirectProduct( ZariskiCoframe,
      function( L )
        local P;
        
        L := MaximalObjects( L, IsSubset );
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        P := UniversalMorphismFromDirectSum( L );
        
        return ClosedSubsetOfFiberedSpec( P );
        
    end );
    
    ## the closure of the set theortic difference
    AddCoexponentialOnObjects( ZariskiCoframe,
      function( A, B )
        local L;
        
        B := MorphismOfUnderlyingCategory( B );
        
        if IsZero( B ) then
            return InitialObject( A );
        fi;
        
        A := MorphismOfUnderlyingCategory( A );
        
        A := UnderlyingMatrix( A );
        B := UnderlyingMatrix( B );
        
        L := List( [ 1 .. NrRows( B ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( B, [ r ] ), A ) );
        
        L := List( L, ClosedSubsetOfFiberedSpecByReducedMorphism );
        
        return Coproduct( L );
        
    end );
    
    Finalize( ZariskiCoframe );
    
    return ZariskiCoframe;
    
end );

##
InstallMethod( FunctorImageClosureOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( S )
    local R, T, pi;
    
    R := UnderlyingRing( S );
    
    T := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R ) );
    
    pi := CapFunctor( "Functor describing the closure of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    AddObjectFunction( pi,
      function( A )
        local R, R_elim, I;
        
        R := UnderlyingRing( A );
        
        R_elim := PolynomialRingWithProductOrdering( R );
        
        I := UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) );
        
        if not IsIdenticalObj( R, R_elim ) then
            Info( InfoZariskiFrames, 1, "!! The Zariski closed subsets obj was not created using ClosedSubsetOfFiberedSpec* !!\n" );
            I := R_elim * I;
        fi;
        
        if not IsBound( A!.BasisOfRowsOverPolynomialRingWithProductOrdering ) then
            
            A!.BasisOfRowsOverPolynomialRingWithProductOrdering := BasisOfRows( I );
            
        fi;
        
        I := A!.BasisOfRowsOverPolynomialRingWithProductOrdering;
        
        I := PolynomialsWithoutRelativeIndeterminates( I );
        
        return ClosedSubsetOfSpecByReducedMorphism( I );
        
    end );
    
    AddMorphismFunction( pi,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi;
    
end );

##
InstallMethod( ImageClosureOfProjection,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma )
    local pi;
    
    pi := FunctorImageClosureOfProjectionBetweenZariskiCoframes( CapCategory( gamma ) );
    
    return ApplyFunctor( pi, gamma );
    
end );

##
InstallMethod( FunctorPreimageOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( T )
    local R, S, pi_, Constructor;
    
    R := UnderlyingRing( T );
    
    S := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R ) );
    
    pi_ := CapFunctor( "Functor describing the preimage of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    Constructor := T!.Constructor;
    
    AddObjectFunction( pi_,
      function( obj )
        
        obj := UnderlyingMatrix( MorphismOfUnderlyingCategory( obj ) );
        
        obj := R * obj;
        
        return Constructor( obj );
        
    end );
    
    AddMorphismFunction( pi_,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi_;
    
end );

##
InstallMethod( PreimageOfProjection,
        "for a homalg ring and an object in a Zariski coframe of an affine variety",
        [ IsHomalgRing, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( R, beta )
    local T, pi_;
    
    T := ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows( R );
    
    pi_ := FunctorPreimageOfProjectionBetweenZariskiCoframes( T );
    
    return ApplyFunctor( pi_, beta );
    
end );

##
InstallMethod( PreimageOfProjection,
        "for two objects in Zariski coframes of two affine varieties",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma, beta )
    local T, pi_, preimage;
    
    T := ZariskiCoframeOfFiberedAffineSpectrumUsingCategoryOfRows( UnderlyingRing( gamma ) );
    
    pi_ := FunctorPreimageOfProjectionBetweenZariskiCoframes( T );
    
    preimage := ApplyFunctor( pi_, beta );
    
    return preimage * gamma;
    
end );

##
InstallGlobalFunction( DecreaseFiberDimensionWithoutAlteringImageClosureOfProjection,
  function( gamma )
    
    ## TODO: gamma -> [ gamma_{1,0}, [ gamma_2, ..., gamma_n ] ]
    
end );
