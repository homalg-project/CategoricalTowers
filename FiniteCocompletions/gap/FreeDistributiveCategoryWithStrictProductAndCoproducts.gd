# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Free distributive closure category with strict products and coproducts

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of free distributive closure categories with strict products and coproducts of a category.
DeclareCategory( "IsFreeDistributiveCategoryWithStrictProductAndCoproducts",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsCellInFreeDistributiveCategoryWithStrictProductAndCoproducts",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsObjectInFreeDistributiveCategoryWithStrictProductAndCoproducts",
        IsCellInFreeDistributiveCategoryWithStrictProductAndCoproducts and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsMorphismInFreeDistributiveCategoryWithStrictProductAndCoproducts",
        IsCellInFreeDistributiveCategoryWithStrictProductAndCoproducts and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the distributive closure with strict products and coproducts
#!  category <A>DC</A> := <C>FreeDistributiveCategoryWithStrictProductAndCoproducts</C>( $C$ ).
#! @Arguments DC
DeclareAttribute( "UnderlyingCategory",
        IsFreeDistributiveCategoryWithStrictProductAndCoproducts );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFreeDistributiveCategoryWithStrictProductAndCoproducts ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the free distributive closure category with strict products and coproducts of a category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareOperation( "FreeDistributiveCategoryWithStrictProductAndCoproducts",
        [ IsCapCategory ] );
#! @InsertChunk LeftCartesianDistributivityFactoring

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsFreeDistributiveCategoryWithStrictProductAndCoproducts );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the free distributive closure category <A>DC</A> with strict products and coproducts into <A>DC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsFreeDistributiveCategoryWithStrictProductAndCoproducts );
