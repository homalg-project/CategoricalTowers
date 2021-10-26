# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for attributes:
#
####################################

##
InstallOtherMethod( UnderlyingGradedRing,
        "for a fp graded left or right module",
        [ IsFpGradedLeftOrRightModulesObject ],
        
  function( M )
    
    return UnderlyingHomalgGradedRing( RelationMorphism( M ) );
    
end );

####################################
#
# methods for operations:
#
####################################

BindGlobal( "FP_GRADED_MODULES",
  function( P )
    local graded_ring, B, weights, Freyd;
    
    graded_ring := UnderlyingGradedRing( P );
    
    if HasIsCommutative( graded_ring ) and IsCommutative( graded_ring ) then
        
        SetIsLinearCategoryOverCommutativeRing( P, true );
        
        B := BaseRing( graded_ring );
        
        weights := Set( WeightsOfIndeterminates( B ) );
        
        if HasIsCommutative( B ) and IsCommutative( B ) and
           Length( weights ) = 1 and IsZero( weights[1] ) then
            SetCommutativeRingOfLinearCategory( P, UnderlyingNonGradedRing( B ) );
        fi;
        
    fi;
    
    Finalize( P : FinalizeCategory := true );
    
    if HasRangeCategoryOfHomomorphismStructure( P ) then
        Finalize( RangeCategoryOfHomomorphismStructure( P ) : FinalizeCategory := true );
    fi;
    
    Freyd := FREYD_CATEGORY( P : FinalizeCategory := false );
    
    INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_FREYD_CATEGORY( Freyd );
    
    Finalize( Freyd );
    
    if HasRangeCategoryOfHomomorphismStructure( Freyd ) then
        Finalize( RangeCategoryOfHomomorphismStructure( Freyd ) );
    fi;
    
    return Freyd;
    
end );

##
InstallMethod( FreydCategory,
        [ IsCategoryOfGradedRows ],

  FP_GRADED_MODULES );
        
##
InstallMethod( FreydCategory,
        [ IsCategoryOfGradedColumns ],

  FP_GRADED_MODULES );
        
##
InstallMethod( FpGradedLeftModules,
        "for a graded ring",
        [ IsHomalgGradedRing ],
        
  function( graded_ring )
    local P, H, Freyd;
    
    P := CategoryOfGradedRows( graded_ring : FinalizeCategory := false );
    
    P!.Name := Concatenation( "GradedRows( ", String( graded_ring ), " )" );
    
    if HasRangeCategoryOfHomomorphismStructure( P ) then
        
        H := RangeCategoryOfHomomorphismStructure( P );
        
        INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_ROWS( H );
        
        Finalize( H : FinalizeCategory := true );
        
    fi;
    
    ##
    AddRelativeLift( P,
      function( beta, alpha, nu )
        local chi;
        
        chi := RightDivide( UnderlyingHomalgMatrix( beta ), UnderlyingHomalgMatrix( alpha ), UnderlyingHomalgMatrix( nu ) );
        
        return GradedRowOrColumnMorphism( Source( beta ), chi, Source( alpha ) );
        
    end );
    
    ##
    AddProjectionOfBiasedRelativeWeakFiberProduct( P,
      function( morphism, range, source )
        local kernel, embedding, source_matrix, biased_relative_weak_fiber_product;
        
        embedding := ReducedSyzygiesOfRows( UnderlyingHomalgMatrix( morphism ), UnderlyingHomalgMatrix( range ) );
        
        source_matrix := BasisOfRows( UnderlyingHomalgMatrix( source ) );
        
        embedding := DecideZeroRows( embedding, source_matrix );
        
        embedding := CertainRows( embedding, NonZeroRows( embedding ) );
        
        return DeduceSomeMapFromMatrixAndRangeForGradedRows( embedding, Source( morphism ) );
        
    end );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( P,
      function( r, alpha )
        local mat;
        
        mat := UnderlyingHomalgMatrix( alpha );
        
        return GradedRowOrColumnMorphism( Source( alpha ), ( r / HomalgRing( mat ) ) * mat, Range( alpha ) );
        
    end );
    
    Finalize( P : FinalizeCategory := true );
    
    Freyd := FreydCategory( P );
    
    ## mimic the FreydCategory-method in GradedModulePresentationsForCAP
    #Freyd!.Name := Concatenation( "Category of f.p. graded left modules over ", RingName( graded_ring ) );
    
    SetFilterObj( Freyd, IsFpGradedLeftModules );
    
    Finalize( Freyd );
    
    return Freyd;
    
end );

##
InstallMethod( FpGradedRightModules,
        "for a graded ring",
        [ IsHomalgGradedRing ],
        
  function( graded_ring )
    local P, H, Freyd;
    
    P := CategoryOfGradedColumns( graded_ring : FinalizeCategory := false );
    
    P!.Name := Concatenation( "GradedColumns( ", String( graded_ring ), " )" );
    
    if HasRangeCategoryOfHomomorphismStructure( P ) then
        
        H := RangeCategoryOfHomomorphismStructure( P );
        
        INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_COLUMNS( H );
        
        Finalize( H );
        
    fi;
    
    ##
    AddRelativeLift( P,
      function( beta, alpha, nu )
        local chi;
        
        chi := LeftDivide( UnderlyingHomalgMatrix( alpha ), UnderlyingHomalgMatrix( beta ), UnderlyingHomalgMatrix( nu ) );
        
        return GradedRowOrColumnMorphism( Source( beta ), chi, Source( alpha ) );
        
    end );
    
    ##
    AddProjectionOfBiasedRelativeWeakFiberProduct( P,
      function( morphism, range, source )
        local kernel, embedding, source_matrix, biased_relative_weak_fiber_product;
        
        embedding := ReducedSyzygiesOfColumns( UnderlyingHomalgMatrix( morphism ), UnderlyingHomalgMatrix( range ) );
        
        source_matrix := BasisOfColumns( UnderlyingHomalgMatrix( source ) );
        
        embedding := DecideZeroColumns( embedding, source_matrix );
        
        embedding := CertainColumns( embedding, NonZeroColumns( embedding ) );
        
        return DeduceSomeMapFromMatrixAndRangeForGradedCols( biased_relative_weak_fiber_product, embedding, Source( morphism ) );
        
    end );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( P,
      function( r, alpha )
        local mat;
        
        mat := UnderlyingHomalgMatrix( alpha );
        
        return GradedRowOrColumnMorphism( Source( alpha ), ( r / HomalgRing( mat ) ) * mat, Range( alpha ) );
        
    end );
    
    Finalize( P : FinalizeCategory := true );
    
    Freyd := FreydCategory( P );
    
    ## mimic the FreydCategory-method in GradedModulePresentationsForCAP
    #Freyd!.Name := Concatenation( "Category of f.p. graded right modules over ", RingName( graded_ring ) );
    
    SetFilterObj( Freyd, IsFpGradedRightModules );
    
    Finalize( Freyd );
    
    return Freyd;
    
end );

##
InstallMethod( FpGradedLeftModuleByFreyd,
        "for a homalg matrix, a list, and a homalg graded ring",
        [ IsHomalgMatrix, IsList, IsHomalgGradedRingRep ],
        
  function( mat, twists, S )
    local M;
    
    if not IsIdenticalObj( HomalgRing( mat ), S ) then
        mat := S * mat;
    fi;
    
    if ForAll( twists, IsInt ) or
       ForAll( twists, IsHomalgModuleElement ) then
        
        twists := List( twists, a -> [ a, 1 ] );
        
    fi;
    
    M := DeduceSomeMapFromMatrixAndRangeForGradedRows( mat, GradedRow( twists, S, false ) );
    
    return FreydCategoryObject( M );
    
end );

##
InstallOtherMethod( FpGradedRightModuleByFreyd,
        "for a homalg matrix, a list, and a homalg graded ring",
        [ IsHomalgMatrix, IsList, IsHomalgGradedRingRep ],
        
  function( mat, twists, S )
    local M;
    
    if not IsIdenticalObj( HomalgRing( mat ), S ) then
        mat := S * mat;
    fi;
    
    if ForAll( twists, IsInt ) or
       ForAll( twists, IsHomalgModuleElement ) then
        
        twists := List( twists, a -> [ a, 1 ] );
        
    fi;
    
    M := DeduceSomeMapFromMatrixAndRangeForGradedCols( mat, GradedColumn( twists, S, false ) );
    
    return FreydCategoryObject( M );
    
end );

