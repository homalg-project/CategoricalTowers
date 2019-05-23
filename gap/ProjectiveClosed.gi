#
# ZariskiFrames: The coframe of Zariski closed subsets in a projective variety
#
# Implementations
#

##
InstallMethod( ClosedSubsetOfProj,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            PreMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProj,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfProj( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfProjByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ReducedMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProjByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfProjByReducedMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfProjByListOfMorphismsOfRank1Range,
        "for a list",
        [ IsList ],

  function( L )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( L[1] ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ListOfMorphismsOfRank1RangeOfUnderlyingCategory, L,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProjByStandardMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            StandardMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProjByStandardMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfProjByStandardMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfProj,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfProj( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfProjByReducedMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfProjByReducedMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfProjByStandardMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfProjByStandardMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiCoframeOfProjUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiCoframe;
    
    name := "The coframe of Zariski closed subsets of the Proj of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiCoframe := CreateCapCategory( name );
    
    ZariskiCoframe!.Constructor := ClosedSubsetOfProj;
    ZariskiCoframe!.ConstructorByListOfMorphismsOfRank1Range := ClosedSubsetOfProjByListOfMorphismsOfRank1Range;
    ZariskiCoframe!.ConstructorByReducedMorphism := ClosedSubsetOfProjByReducedMorphism;
    ZariskiCoframe!.ConstructorByStandardMorphism := ClosedSubsetOfProjByStandardMorphism;
    
    SetUnderlyingRing( ZariskiCoframe, R );
    
    ZariskiCoframe!.UnderlyingCategory := CategoryOfRows( R );
    
    AddObjectRepresentation( ZariskiCoframe, IsObjectInZariskiCoframeOfAProjectiveVariety );
    
    AddMorphismRepresentation( ZariskiCoframe, IsMorphismInZariskiCoframeOfAProjectiveVariety );
    
    ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS( ZariskiCoframe );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows( ZariskiCoframe );
    
    ##
    AddIsHomSetInhabited( ZariskiCoframe,
      IsHomSetInhabitedForCoframesUsingCategoryOfRows );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiCoframe,
          function( S, T )
            
            S := UnderlyingMatrix( MorphismOfUnderlyingCategory( S ) );
            T := UnderlyingMatrix( MorphismOfUnderlyingCategory( T ) );
            
            return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
            
        end );
        
    fi;
    
    ##
    AddTerminalObject( ZariskiCoframe,
      function( arg )
        local T;
        
        T := ClosedSubsetOfProjByStandardMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiCoframe,
      function( arg )
        local I;
        
        I := ClosedSubsetOfProjByStandardMorphism( HomalgIdentityMatrix( 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiCoframe,
      function( A )
        
        return IsZero( MorphismOfRank1RangeOfUnderlyingCategory( A ) );
        
    end );
    
    ##
    AddIsInitial( ZariskiCoframe,
      function( A )
        local mor, one;
        
        mor := ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory( A );
        
        ## avoid the warning "an empty matrix is about to get evaluated!"
        List( mor, IsZero );
        
        one := StandardMorphismOfUnderlyingCategory( InitialObject( A ) );
        
        return ForAll( mor, m -> IsLiftable( one, m ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiCoframe,
      function( L )
        local l;
        
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
        
        L := List( L, ListOfMorphismsOfRank1RangeOfUnderlyingCategory );
        
        L := Concatenation( L );
        
        return ClosedSubsetOfProjByListOfMorphismsOfRank1Range( L );
            
    end );
    
    ##
    AddDirectProduct( ZariskiCoframe,
      function( L )
        local l, P;
        
        ## triggers radical computations which we want to avoid by all means
        #L := MaximalObjects( L, IsSubset );
        ## instead:
        
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
        
        L := List( L, MorphismOfRank1RangeOfUnderlyingCategory );
        
        P := UniversalMorphismFromDirectSum( L );
        
        return ClosedSubsetOfProj( P );
        
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
        
        L := List( L, ClosedSubsetOfProjByReducedMorphism );
        
        return Coproduct( L );
        
    end );
    
    Finalize( ZariskiCoframe );
    
    return ZariskiCoframe;
    
end );

##
InstallMethod( IsOpen,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],

  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallMethod( Dimension,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],

  function( A )
    
    return AffineDimension( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) ) - 1;
    
end );

##
InstallMethod( DegreeAttr,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],

  function( A )
    
    return ProjectiveDegree( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
end );
