# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( CategoryOfFpModules,
        "for a CAP category",
        [ IsCapCategory and IsAdditiveCategory ],
        
  function( P )
    local Freyd, R;
    
    Freyd := FREYD_CATEGORY( P : FinalizeCategory := false );
    
    R := UnderlyingRing( P );
    
    if IsCategoryOfRows( P ) then
        SetFilterObj( Freyd, IsCategoryOfFpLeftModules );
        SetCategoryOfFpLeftModules( R, Freyd );
    else
        SetFilterObj( Freyd, IsCategoryOfFpRightModules );
        SetCategoryOfFpRightModules( R, Freyd );
    fi;
    
    if IsCategoryOfRows( P ) then
        AddImageEmbedding( Freyd, ImageEmbeddingForFpLeftModulesByFreyd );
    else
        AddImageEmbedding( Freyd, ImageEmbeddingForFpRightModulesByFreyd );
    fi;
    
    INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_FREYD_CATEGORY( Freyd );
    
    Finalize( Freyd );
    
    return Freyd;
    
end );

##
InstallMethod( FreydCategory,
        [ IsCategoryOfRows ],
        
  CategoryOfFpModules );

##
InstallMethod( FreydCategory,
        [ IsCategoryOfColumns ],
        
  CategoryOfFpModules );

BindGlobal( "INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_ROWS",
  function( P )
    
    ##
    AddRelativeLift( P,
      function( category, beta, alpha, nu )
        local chi;
        
        chi := RightDivide( UnderlyingMatrix( beta ), UnderlyingMatrix( alpha ), UnderlyingMatrix( nu ) );
        
        return CategoryOfRowsMorphism( Source( beta ), chi, Source( alpha ) );
        
    end );
    
    ##
    AddProjectionOfBiasedRelativeWeakFiberProduct( P,
      function( category, morphism, range, source )
        local kernel, embedding, source_matrix, biased_relative_weak_fiber_product;
        
        embedding := ReducedSyzygiesOfRows( UnderlyingMatrix( morphism ), UnderlyingMatrix( range ) );
        
        source_matrix := BasisOfRows( UnderlyingMatrix( source ) );
        
        embedding := DecideZeroRows( embedding, source_matrix );
        
        embedding := CertainRows( embedding, NonZeroRows( embedding ) );
        
        biased_relative_weak_fiber_product := CategoryOfRowsObject( NrRows( embedding ), CapCategory( morphism ) );
        
        return CategoryOfRowsMorphism( biased_relative_weak_fiber_product, embedding, Source( morphism ) );
        
    end );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( P,
      function( category, r, alpha )
        
        return CategoryOfRowsMorphism( Source( alpha ), r * UnderlyingMatrix( alpha ), Range( alpha ) );
        
    end );
    
end );

##
InstallMethod( CategoryOfFpLeftModules,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( ring )
    local P, R, B;
    
    P := CategoryOfRows( ring : FinalizeCategory := false );
    
    INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_ROWS( P );
    
    R := UnderlyingRing( P );
    
    if HasIsCommutative( R ) and IsCommutative( R ) then
        B := R;
    else
        B := BaseRing( R );
    fi;
    
    SetCommutativeRingOfLinearCategory( P, B );
    
    SetIsLinearCategoryOverCommutativeRing( P, true );
    
    Finalize( P : FinalizeCategory := true );
    
    return FreydCategory( P );
    
end );

BindGlobal( "INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_COLUMNS",
  function( P )
    
    ##
    AddRelativeLift( P,
      function( category, beta, alpha, nu )
        local chi;
        
        chi := LeftDivide( UnderlyingMatrix( alpha ), UnderlyingMatrix( beta ), UnderlyingMatrix( nu ) );
        
        return CategoryOfColumnsMorphism( Source( beta ), chi, Source( alpha ) );
        
    end );
    
    ##
    AddProjectionOfBiasedRelativeWeakFiberProduct( P,
      function( category, morphism, range, source )
        local kernel, embedding, source_matrix, biased_relative_weak_fiber_product;
        
        embedding := ReducedSyzygiesOfColumns( UnderlyingMatrix( morphism ), UnderlyingMatrix( range ) );
        
        source_matrix := BasisOfColumns( UnderlyingMatrix( source ) );
        
        embedding := DecideZeroColumns( embedding, source_matrix );
        
        embedding := CertainColumns( embedding, NonZeroColumns( embedding ) );
        
        biased_relative_weak_fiber_product := CategoryOfColumnsObject( NrColumns( embedding ), CapCategory( morphism ) );
        
        return CategoryOfColumnsMorphism( biased_relative_weak_fiber_product, embedding, Source( morphism ) );
        
    end );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( P,
      function( category, r, alpha )
        
        return CategoryOfColumnsMorphism( Source( alpha ), r * UnderlyingMatrix( alpha ), Range( alpha ) );
        
    end );

end );

##
InstallMethod( CategoryOfFpRightModules,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( ring )
    local P, R, B;
    
    P := CategoryOfColumns( ring : FinalizeCategory := false );
    
    INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_COLUMNS( P );
    
    R := UnderlyingRing( P );
    
    if HasIsCommutative( R ) and IsCommutative( R ) then
        B := R;
    else
        B := BaseRing( R );
    fi;
    
    SetCommutativeRingOfLinearCategory( P, B );
    
    SetIsLinearCategoryOverCommutativeRing( P, true );
    
    Finalize( P : FinalizeCategory := true );
    
    return FreydCategory( P );
    
end );

##
InstallMethod( FpLeftModuleByFreyd,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local R, M, A;
    
    R := HomalgRing( mat );
    
    A := CategoryOfFpLeftModules( R );
    
    M := AsCategoryOfRowsMorphism( mat, UnderlyingCategory( A ) );
    
    M := FreydCategoryObject( A, M );
    
    SetUnderlyingHomalgRing( M, R );
    
    return M;
    
end );

##
InstallOtherMethod( FpRightModuleByFreyd,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local R, M, A;
    
    R := HomalgRing( mat );
    
    A := CategoryOfFpRightModules( R );
    
    M := AsCategoryOfColumnsMorphism( mat, UnderlyingCategory( A ) );
    
    M := FreydCategoryObject( A, M );
    
    SetUnderlyingHomalgRing( M, R );
    
    return M;
    
end );

##
InstallMethod( FreeFpLeftModuleByFreyd,
        "for an integer and a homalg ring",
        [ IsInt, IsHomalgRing ],
        
  function( rank, R )
    
    return FpLeftModuleByFreyd( HomalgZeroMatrix( 0, rank, R ) );
    
end );

##
InstallMethod( FreeFpRightModuleByFreyd,
        "for an integer and a homalg ring",
        [ IsInt, IsHomalgRing ],
        
  function( rank, R )
    
    return FpRightModuleByFreyd( HomalgZeroMatrix( rank, 0, R ) );
    
end );

##
InstallMethod( FpModuleMorphism,
        "for two Freyd category objects and a homalg matrix",
        [ IsFreydCategoryObject, IsHomalgMatrix, IsFreydCategoryObject ],
        
  function( source, mat, range )
    local s, r;
    
    s := Range( RelationMorphism( source ) );
    r := Range( RelationMorphism( range ) );
    
    if IsCategoryOfRowsObject( s ) then
        mat := CategoryOfRowsMorphism( s, mat, r );
    else
        mat := CategoryOfColumnsMorphism( s, mat, r );
    fi;
    
    return FreydCategoryMorphism( CapCategory( source ), source, mat, range );
    
end );

##
InstallOtherMethod( FpModuleMorphism,
        "for two category of rows objects and a homalg matrix",
        [ IsCategoryOfRowsObject, IsHomalgMatrix, IsCategoryOfRowsObject ],
        
  CategoryOfRowsMorphism );

##
InstallOtherMethod( FpModuleMorphism,
        "for two category of columns objects and a homalg matrix",
        [ IsCategoryOfColumnsObject, IsHomalgMatrix, IsCategoryOfColumnsObject ],
        
  CategoryOfColumnsMorphism );
