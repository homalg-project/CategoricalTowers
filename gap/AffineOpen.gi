#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
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
            UnderlyingRing, R
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
            UnderlyingRing, R
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
            UnderlyingRing, R
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
InstallMethod( ZariskiFrameOfAffineSpectrumUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiFrame;
    
    name := "The frame of Zariski open subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name );
    
    ZariskiFrame!.UnderlyingCategory := CategoryOfRows( R );
    
    AddObjectRepresentation( ZariskiFrame, IsObjectInZariskiFrame );
    
    AddMorphismRepresentation( ZariskiFrame, IsMorphismInZariskiFrame );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( ZariskiFrame );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows( ZariskiFrame );
    
    ##
    AddIsHomSetInhabited( ZariskiFrame,
      function( S, T )
        
        S := MorphismOfUnderlyingCategory( S );
        T := MorphismOfUnderlyingCategory( T );
        
        return not Lift( S, T ) = fail;
        
    end );
    
    ##
    AddTerminalObject( ZariskiFrame,
      function( arg )
        
        return OpenSubsetOfSpecByStandardMorphism( HomalgIdentityMatrix( 1, R ) );
        
    end );
    
    ##
    AddInitialObject( ZariskiFrame,
      function( arg )
        
        return OpenSubsetOfSpecByStandardMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiFrame,
      function( L )
        local biased_weak_fiber_product, C;
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        C := UniversalMorphismFromDirectSum( L );
        
        return OpenSubsetOfSpecByReducedMorphism( C );
            
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
        
        return OpenSubsetOfSpecByReducedMorphism( P );
        
    end );
    
    ##
    AddExponentialOnObjects( ZariskiFrame,
      function( A, B )
        local L;
        
        A := MorphismOfUnderlyingCategory( A );
        
        if IsZero( A ) then
            return TerminalObject( CapCategory( B ) );
        fi;
        
        B := MorphismOfUnderlyingCategory( B );
        
        A := UnderlyingMatrix( A );
        B := UnderlyingMatrix( B );
        
        L := List( [ 1 .. NrRows( A ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( A, [ r ] ), B ) );
        
        L := List( L, OpenSubsetOfSpec );
        
        return DirectProduct( L );
        
    end );
    
    Finalize( ZariskiFrame );
    
    return ZariskiFrame;
    
end );

##
InstallMethod( ViewObj,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    local I, n;
    
    I := ValueOption( "Locales_name" );
    
    if I = fail then
        I := "<...>";
    fi;
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    Print( "D_{", RingName( UnderlyingRing( A ) ), "}( ", I, n, " )" );
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    
    Print( "D( <" );
    Print( JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) ), String ) ) );
    Print( "> )\n" );
    
end );
