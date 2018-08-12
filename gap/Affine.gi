#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallMethod( ClosedSubsetOfSpec,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            PreMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfSpecByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            MorphismOfUnderlyingCategory, I,
            UnderlyingRing, R
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( MorphismOfUnderlyingCategory,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    local mat, L, biased_weak_fiber_product;
    
    mat := UnderlyingMatrix( PreMorphismOfUnderlyingCategory( A ) );
    
    L := List( PrimaryDecompositionOp( mat ), a -> AsCategoryOfRowsMorphism( a[2] ) );
    
    biased_weak_fiber_product := function( I, J )
        return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
    end;
    
    return Iterated( L, biased_weak_fiber_product );
    
end );

##
InstallMethod( ClosedSubsetOfSpec,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfSpec( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ClosedSubsetOfSpecByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ClosedSubsetOfSpecByReducedMorphism( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiCoframe;
    
    name := "The coframe of Zariski closed subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiCoframe := CreateCapCategory( name );
    
    ZariskiCoframe!.UnderlyingCategory := CategoryOfRows( R );
    
    AddObjectRepresentation( ZariskiCoframe, IsObjectInZariskiCoframe );
    
    AddMorphismRepresentation( ZariskiCoframe, IsMorphismInZariskiCoframe );
    
    ##
    AddIsWellDefinedForObjects( ZariskiCoframe,
      function( A )
        
        A := MorphismOfUnderlyingCategory( A );
        
        if not RankOfObject( Range( A ) ) = 1 then
            return false;
        fi;
        
        return IsWellDefined( A );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( ZariskiCoframe,
      function( emb )
        local S, T;
        
        S := MorphismOfUnderlyingCategory( Source( emb ) );
        T := MorphismOfUnderlyingCategory( Range( emb ) );
        
        return not Lift( T, S ) = fail;
        
    end );
    
    ##
    AddIsEqualForObjects( ZariskiCoframe,
      function( A, B )
        
        A := MorphismOfUnderlyingCategory( A );
        B := MorphismOfUnderlyingCategory( B );
        
        if Lift( A, B ) = fail then
            return false;
        fi;
        
        return not Lift( B, A ) = fail;
        
    end );
    
    ADD_COMMON_METHODS_FOR_LATTICES( ZariskiCoframe );
    
    ##
    AddTerminalObject( ZariskiCoframe,
      function( arg )
        
        return ClosedSubsetOfSpecByReducedMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
    end );
    
    ##
    AddInitialObject( ZariskiCoframe,
      function( arg )
        
        return ClosedSubsetOfSpecByReducedMorphism( HomalgIdentityMatrix( 1, R ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiCoframe,
      function( L )
        local biased_weak_fiber_product, C;
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        biased_weak_fiber_product := function( I, J )
            return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
        end;
        
        C := Iterated( L, biased_weak_fiber_product );
        
        return ClosedSubsetOfSpecByReducedMorphism( C );
            
    end );
    
    ##
    AddDirectProduct( ZariskiCoframe,
      function( L )
        local P;
        
        if Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfUnderlyingCategory );
        
        P := UniversalMorphismFromDirectSum( L );
        
        return ClosedSubsetOfSpecByReducedMorphism( P );
        
    end );
    
    Finalize( ZariskiCoframe );
    
    return ZariskiCoframe;
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    Display( MorphismOfUnderlyingCategory( A ) );
    
end );
