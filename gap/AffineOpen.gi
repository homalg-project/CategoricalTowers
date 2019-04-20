#
# ZariskiFrames: The frame of Zariski open subsets in an affine variety
#
# Implementations
#

##
InstallMethod( OpenSubsetOfSpec,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZF;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZF,
            PreMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpec,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfSpec( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ReducedMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfSpecByReducedMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfSpecByListOfReducedMorphisms,
        "for a list",
        [ IsList ],

  function( L )
    local R, A, ZF;
    
    R := UnderlyingRing( CapCategory( L[1] ) );
    
    A := rec( );
    
    ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZF,
            ListOfReducedMorphismsOfUnderlyingCategory, L,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            StandardMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfSpecByStandardMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfSpecByStandardMorphism( AsCategoryOfRowsMorphism( mat ) );
    
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
    
    name := "The frame of Zariski open subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name );
    
    SetUnderlyingRing( ZariskiFrame, R );
    
    ZariskiFrame!.UnderlyingCategory := CategoryOfRows( R );
    
    ZariskiFrame!.Constructor := OpenSubsetOfSpec;
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
    AddCoproduct( ZariskiFrame,
      function( L )
        local biased_weak_fiber_product, C;
        
        L := MaximalObjects( L, IsHomSetInhabited );
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        C := UniversalMorphismFromDirectSum( L );
        
        return OpenSubsetOfSpec( C );
            
    end );
    
    ##
    AddDirectProduct( ZariskiFrame,
      function( L )
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, ListOfReducedMorphismsOfUnderlyingCategory );
        
        L := Concatenation( L );
        
        return OpenSubsetOfSpecByListOfReducedMorphisms( L );
        
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
    
    return AffineDimension( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
end );

##
InstallMethod( DegreeOfComplement,
        "for an object in a Zariski frame of an affine variety",
        [ IsObjectInZariskiFrameOfAnAffineVariety ],

  function( A )
    
    return AffineDegree( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
end );
