# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodWithCache( FreeDistributiveCompletion,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( fp_category, range_category_of_hom_structure )
    local finite_completion, finite_cocompletion,
          free_distributive_completion;
    
    ## building the categorical tower:
    finite_completion := FiniteCompletion( fp_category, range_category_of_hom_structure : FinalizeCategory := true, overhead := false );
    
    finite_cocompletion := FiniteCocompletion( finite_completion, range_category_of_hom_structure : FinalizeCategory := true, overhead := false );
    
    free_distributive_completion :=
      WrapperCategory( finite_cocompletion,
              rec( name := Concatenation( "FreeDistributiveCompletion( ", Name( fp_category ), " )" ),
                   category_filter := IsWrapperCapCategory and IsFreeDistributiveCompletion,
                   category_object_filter := IsWrapperCapCategoryObject and IsObjectInFreeDistributiveCompletion,
                   category_morphism_filter := IsWrapperCapCategoryMorphism and IsMorphismInFreeDistributiveCompletion,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetUnderlyingCategory( free_distributive_completion, fp_category );
    
    if not HasRangeCategoryOfHomomorphismStructure( free_distributive_completion ) and
       (HasIsInitialCategory and IsInitialCategory)( fp_category ) then
        
        SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( free_distributive_completion, free_distributive_completion );
        
    fi;
    
    Finalize( free_distributive_completion : FinalizeCategory := true );
    
    if (HasIsInitialCategory and IsInitialCategory)( fp_category ) then
        Assert( 0, [ ] = MissingOperationsForConstructivenessOfCategory( free_distributive_completion, "IsEquippedWithHomomorphismStructure" ) );
    fi;
    
    return free_distributive_completion;
    
end );

##
InstallMethod( FreeDistributiveCompletion,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( fp_category )
    
    return FreeDistributiveCompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a free distributive completion category",
        [ IsFreeDistributiveCompletion ],
        
  function( free_distributive_completion )
    local D, Y;
    
    D := ModelingCategory( free_distributive_completion );
    
    Y := PreCompose(
                 EmbeddingOfUnderlyingCategory( UnderlyingCategory( D ) ),
                 EmbeddingOfUnderlyingCategory( D ) );
    
    return PreCompose( Y, WrappingFunctor( free_distributive_completion ) );
    
end );

##
InstallMethod( \.,
        "for a free distributive completion category and a positive integer",
        [ IsFreeDistributiveCompletion, IsPosInt ],
        
  function( free_distributive_completion, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( free_distributive_completion );
    
    Y := EmbeddingOfUnderlyingCategory( free_distributive_completion );
    
    Yc := Y( F.(name) );
    
    if IsObjectInFreeDistributiveCompletion( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInFreeDistributiveCompletion( Yc ) then
        
        #if CanCompute( free_distributive_completion, "IsMonomorphism" ) then
        #    IsMonomorphism( Yc );
        #fi;
        
        #if CanCompute( free_distributive_completion, "IsSplitMonomorphism" ) then
        #    IsSplitMonomorphism( Yc );
        #fi;
        
        #if CanCompute( free_distributive_completion, "IsEpimorphism" ) then
        #    IsEpimorphism( Yc );
        #fi;
        
        #if CanCompute( free_distributive_completion, "IsSplitEpimorphism" ) then
        #    IsSplitEpimorphism( Yc );
        #fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        #if CanCompute( free_distributive_completion, "IsIsomorphism" ) then
        #    IsIsomorphism( Yc );
        #fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for a cell in a free distributive completion category and a positive integer",
        [ IsCellInFreeDistributiveCompletion, IsPosInt ],
        
  function( cell, string_as_int )
    
    return UnderlyingCell( cell ).(NameRNam( string_as_int ));
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a free distributive completion category",
        [ IsFreeDistributiveCompletion ],
        
  function( free_distributive_completion )
    
    return SetOfObjectsOfCategory( free_distributive_completion );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a free distributive completion category",
        [ IsFreeDistributiveCompletion ],
        
  function( free_distributive_completion )
    
    return SetOfGeneratingMorphismsOfCategory( free_distributive_completion );
    
end );
