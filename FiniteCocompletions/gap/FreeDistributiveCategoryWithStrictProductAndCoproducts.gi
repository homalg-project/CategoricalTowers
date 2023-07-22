# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FreeDistributiveCategoryWithStrictProductAndCoproducts,
        [ IsCapCategory ],
        
  function( C )
    local PC, UPC, DC;
    
    ## building the categorical tower:
    
    ## the finite strict product completion of the category C:
    PC := FiniteStrictProductCompletion( C : FinalizeCategory := true );
    
    ## the finite strict coproduct completion of the finite strict product completion of the category C:
    UPC := FiniteStrictCoproductCocompletion( PC : FinalizeCategory := true );
    
    ## UPC is a model for the free distributive closure category with strict products and coproducts of the category C:
    DC :=
      WrapperCategory( UPC,
              rec( name := Concatenation( "FreeDistributiveCategoryWithStrictProductAndCoproducts( ", Name( C ), " )" ),
                   category_filter := IsFreeDistributiveCategoryWithStrictProductAndCoproducts and IsWrapperCapCategory,
                   category_object_filter := IsObjectInFreeDistributiveCategoryWithStrictProductAndCoproducts and IsWrapperCapCategoryObject,
                   category_morphism_filter := IsMorphismInFreeDistributiveCategoryWithStrictProductAndCoproducts and IsWrapperCapCategoryMorphism,
                   only_primitive_operations := true )
              : FinalizeCategory := true );
    
    SetUnderlyingCategory( DC, C );
    
    Append( DC!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory" ] );
    
    return DC;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for the free distributive closure category with strict products and coproducts of a category",
        [ IsFreeDistributiveCategoryWithStrictProductAndCoproducts ],
        
  function( DC )
    local UPC, PC;
    
    UPC := ModelingCategory( DC );
    
    PC := UnderlyingCategory( UPC );
    
    return
      PreComposeWithWrappingFunctorData( DC,
              PreComposeFunctorsByData( UPC,
                      EmbeddingOfUnderlyingCategoryData( PC ),
                      EmbeddingOfUnderlyingCategoryData( UPC ) ) );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for the free distributive closure category with strict products and coproducts of a category",
        [ IsFreeDistributiveCategoryWithStrictProductAndCoproducts ],
        
  function( DC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( DC );
    
    Y := CapFunctor( "Embedding functor into a free distributive closure category with strict products and coproducts", data[1], DC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for the free distributive closure category with strict products and coproducts of a category and a positive integer",
        [ IsFreeDistributiveCategoryWithStrictProductAndCoproducts, IsPosInt ],
        
  function( DC, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( DC );
    
    Y := EmbeddingOfUnderlyingCategory( DC );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteStrictCoproductCocompletion( Yc ) then

        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elif IsMorphismInFiniteStrictCoproductCocompletion( Yc ) then
        
        if CanCompute( DC, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( DC, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( DC, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( DC, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( DC, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );
