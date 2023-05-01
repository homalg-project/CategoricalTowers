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
  function( P, left )
    local graded_ring, B, weights, Freyd, object_constructor, modeling_tower_object_constructor, object_datum, modeling_tower_object_datum, morphism_constructor, modeling_tower_morphism_constructor, morphism_datum, modeling_tower_morphism_datum, category_filter, category_object_filter, category_morphism_filter, wrapper;
    
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
    
    Freyd := FREYD_CATEGORY( P : FinalizeCategory := false );
    
    INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_FREYD_CATEGORY( Freyd );
    
    Finalize( Freyd : FinalizeCategory := true );
    
    object_constructor := function ( cat, relation_morphism )
        
        return CreateCapCategoryObjectWithAttributes( cat, RelationMorphism, relation_morphism );
        
    end;
    
    modeling_tower_object_constructor := function ( cat, relation_morphism )
        
        return CreateCapCategoryObjectWithAttributes( ModelingCategory( cat ), RelationMorphism, relation_morphism );
        
    end;
    
    object_datum := function ( cat, object )
        
        return RelationMorphism( object );
        
    end;
    
    modeling_tower_object_datum := function ( cat, object )
        
        return RelationMorphism( object );
        
    end;
    
    morphism_constructor := function ( cat, source, underlying_morphism, range )
        
        return CreateCapCategoryMorphismWithAttributes( cat, source, range, UnderlyingMorphism, underlying_morphism );
        
    end;
    
    modeling_tower_morphism_constructor := function ( cat, source, underlying_morphism, range )
        
        return CreateCapCategoryMorphismWithAttributes( ModelingCategory( cat ), source, range, UnderlyingMorphism, underlying_morphism );
        
    end;
    
    morphism_datum := function ( cat, morphism )
        
        return UnderlyingMorphism( morphism );
        
    end;
    
    modeling_tower_morphism_datum := function ( cat, morphism )
        
        return UnderlyingMorphism( morphism );
        
    end;
    
    if left then
        
        category_filter := IsFreydCategory and IsFpGradedLeftModules;
        
        category_object_filter := IsFreydCategoryObject and HasRelationMorphism and IsFpGradedLeftModulesObject;
        
        category_morphism_filter := IsFreydCategoryMorphism and HasUnderlyingMorphism and IsFpGradedLeftModulesMorphism;
        
    else
        
        category_filter := IsFreydCategory and IsFpGradedRightModules;
        
        category_object_filter := IsFreydCategoryObject and HasRelationMorphism and IsFpGradedRightModulesObject;
        
        category_morphism_filter := IsFreydCategoryMorphism and HasUnderlyingMorphism and IsFpGradedRightModulesMorphism;
        
    fi;
    
    wrapper := WrapperCategory( Freyd, rec(
        name := Name( Freyd ),
        category_filter := category_filter,
        category_object_filter := category_object_filter,
        category_morphism_filter := category_morphism_filter,
        object_constructor := object_constructor,
        object_datum := object_datum,
        morphism_constructor := morphism_constructor,
        morphism_datum := morphism_datum,
        modeling_tower_object_constructor := modeling_tower_object_constructor,
        modeling_tower_object_datum := modeling_tower_object_datum,
        modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
        modeling_tower_morphism_datum := modeling_tower_morphism_datum,
        # enforce defaults
        only_primitive_operations := false,
        wrap_range_of_hom_structure := false,
    ) : FinalizeCategory := false );
    
    SetUnderlyingCategory( wrapper, P );
    
    Finalize( wrapper );
    
    return wrapper;
    
end );

##
InstallMethod( FreydCategory,
        [ IsCategoryOfGradedRows ],

  P -> FP_GRADED_MODULES( P, true ) );
        
##
InstallMethod( FreydCategory,
        [ IsCategoryOfGradedColumns ],

  P -> FP_GRADED_MODULES( P, false ) );
        
##
InstallMethod( FpGradedLeftModules,
        "for a graded ring",
        [ IsHomalgGradedRing ],
        
  function( graded_ring )
    local P, H, B, weights, Freyd;
    
    P := CategoryOfGradedRows( graded_ring : FinalizeCategory := false );
    
    P!.Name := Concatenation( "GradedRows( ", String( graded_ring ), " )" );
    
    if HasRangeCategoryOfHomomorphismStructure( P ) then
        
        H := RangeCategoryOfHomomorphismStructure( P );
        
        if IsCategoryOfRows( H ) then
            INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_ROWS( H );
            Finalize( H : FinalizeCategory := true );
        fi;
        
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
    
    if HasIsCommutative( graded_ring ) and IsCommutative( graded_ring ) then
        
        SetIsLinearCategoryOverCommutativeRing( P, true );
        
        B := BaseRing( graded_ring );
        
        weights := Set( WeightsOfIndeterminates( B ) );
        
        if HasIsCommutative( B ) and IsCommutative( B ) and
           Length( weights ) = 1 and IsZero( weights[1] ) then
            SetCommutativeRingOfLinearCategory( P, UnderlyingNonGradedRing( B ) );
            
            ##
            AddMultiplyWithElementOfCommutativeRingForMorphisms( P,
              function( r, alpha )
                local mat;
                
                mat := UnderlyingHomalgMatrix( alpha );
                
                return GradedRowOrColumnMorphism( Source( alpha ), ( r / HomalgRing( mat ) ) * mat, Range( alpha ) );
                
            end );
            
        fi;
        
    fi;
    
    SetRangeCategoryOfHomomorphismStructure( P, P );
    SetIsEquippedWithHomomorphismStructure( P, true );
    
    Finalize( P : FinalizeCategory := true );
    
    if HasRangeCategoryOfHomomorphismStructure( P ) then
        Finalize( RangeCategoryOfHomomorphismStructure( P ) : FinalizeCategory := true );
    fi;
    
    Freyd := FreydCategory( P );
    
    ## mimic the FreydCategory-method in GradedModulePresentationsForCAP
    #Freyd!.Name := Concatenation( "Category of f.p. graded left modules over ", RingName( graded_ring ) );
    
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
        
        if IsCategoryOfColumns( H ) then
            INSTALL_HOMALG_STYLE_FUNCTIONS_FOR_CATEGORY_OF_COLUMNS( H );
            Finalize( H : FinalizeCategory := true );
        fi;
        
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
    
    SetRangeCategoryOfHomomorphismStructure( P, P );
    SetIsEquippedWithHomomorphismStructure( P, true );
    
    Finalize( P : FinalizeCategory := true );
    
    if HasRangeCategoryOfHomomorphismStructure( P ) then
        Finalize( RangeCategoryOfHomomorphismStructure( P ) : FinalizeCategory := true );
    fi;
    
    Freyd := FreydCategory( P );
    
    ## mimic the FreydCategory-method in GradedModulePresentationsForCAP
    #Freyd!.Name := Concatenation( "Category of f.p. graded right modules over ", RingName( graded_ring ) );
    
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

