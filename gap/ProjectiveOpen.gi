#
# ZariskiFrames: The frame of Zariski open subsets in a projective variety
#
# Implementations
#

##
InstallMethod( OpenSubsetOfProj,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZF;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZF := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZF,
            PreMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProj,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfProj( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ReducedMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfProjByReducedMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            StandardMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfProjByStandardMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfProj,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfProj( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByReducedMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfProjByReducedMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfProjByStandardMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiFrameOfProjUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiFrame;
    
    name := "The frame of Zariski open subsets of the Proj of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name );
    
    SetUnderlyingRing( ZariskiFrame, R );
    
    ZariskiFrame!.UnderlyingCategory := CategoryOfRows( R );
    
    ZariskiFrame!.Constructor := OpenSubsetOfProj;
    ZariskiFrame!.ConstructorByReducedMorphism := OpenSubsetOfProjByReducedMorphism;
    ZariskiFrame!.ConstructorByStandardMorphism := OpenSubsetOfProjByStandardMorphism;
    
    AddObjectRepresentation( ZariskiFrame, IsObjectInZariskiFrameOfAProjectiveVariety );
    
    AddMorphismRepresentation( ZariskiFrame, IsMorphismInZariskiFrameOfAProjectiveVariety );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( ZariskiFrame );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows( ZariskiFrame );
    
    ##
    AddIsHomSetInhabited( ZariskiFrame,
      function( S, T )
        
        S := MorphismOfUnderlyingCategory( S );
        T := MorphismOfUnderlyingCategory( T );
        
        return IsLiftable( S, T );
        
    end );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiFrame,
          function( S, T )
            
            S := UnderlyingMatrix( MorphismOfUnderlyingCategory( S ) );
            T := UnderlyingMatrix( MorphismOfUnderlyingCategory( T ) );
            
            return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
            
        end );
        
    fi;
    
    ##
    AddTerminalObject( ZariskiFrame,
      function( arg )
        local T;
        
        T := OpenSubsetOfProjByStandardMorphism( HomalgIdentityMatrix( 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiFrame,
      function( arg )
        local I;
        
        I := OpenSubsetOfProjByStandardMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddCoproduct( ZariskiFrame,
      function( L )
        local biased_weak_fiber_product, C;
        
        L := MaximalObjects( L, IsHomSetInhabited );
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        C := UniversalMorphismFromDirectSum( L );
        
        return OpenSubsetOfProj( C );
            
    end );
    
    ##
    AddDirectProduct( ZariskiFrame,
      function( L )
        local P;
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        P := INTERSECTION_OF_IDEALS_USING_CategoryOfRows( L );
        
        return OpenSubsetOfProjByReducedMorphism( P );
        
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
        
        L := List( L, OpenSubsetOfProjByReducedMorphism );
        
        return DirectProduct( L );
        
    end );
    
    Finalize( ZariskiFrame );
    
    return ZariskiFrame;
    
end );

##
InstallMethod( IsClosedSubobject,
        "for an object in a Zariski frame of a projective variety",
        [ IsObjectInZariskiFrameOfAProjectiveVariety ],

  function( A )
    
    return IsOpen( -A );
    
end );

##
InstallMethod( DimensionOfComplement,
        "for an object in a Zariski frame of a projective variety",
        [ IsObjectInZariskiFrameOfAProjectiveVariety ],
        
  function( A )
    
    return AffineDimension( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) ) - 1;
    
end );
