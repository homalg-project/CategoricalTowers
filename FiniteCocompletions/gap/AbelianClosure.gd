# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Abelian closure with strict direct sums

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of free distributive closure categories with strict products and coproducts of a category.
DeclareCategory( "IsAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsCellInAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsObjectInAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCellInAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsMorphismInAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCellInAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the abelian closure with strict direct sums
#!  category <A>DC</A> := <C>AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure</C>( $C$ ).
#! @Arguments DC
DeclareAttribute( "UnderlyingCategory",
        IsAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure ],
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
DeclareAttribute( "AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCapCategory );
#! @InsertChunk SnakeInFreeAbelian

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the free distributive closure category <A>DC</A> with strict products and coproducts into <A>DC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsAbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure );

DeclareOperation( "ExtendFunctorToAbelianClosureWithStrictDirectSumsData",
        [ IsCapCategory, IsList, IsCapCategory ] );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the free distributive closure category <A>DC</A> with strict products and coproducts into <A>DC</A>.
#! @Arguments DC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToAbelianClosureWithStrictDirectSums",
        IsCapFunctor );
