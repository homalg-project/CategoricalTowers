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
DeclareCategory( "IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsCellInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsObjectInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure",
        FilterIntersection( IsCapCategoryObject, IsCellInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ) );

#! @Description
#!  The &GAP; category of morphisms in the free distributive closure category with strict products and coproducts of a category.
DeclareCategory( "IsMorphismInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure",
        FilterIntersection( IsCapCategoryMorphism, IsCellInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ) );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the abelian closure with strict direct sums
#!  category <A>DC</A> := <C>AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure</C>( $C$ ).
#! @Arguments DC
DeclareAttribute( "UnderlyingCategory",
        IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure );

#CapJitAddTypeSignature( "UnderlyingCategory", [ IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
#    
#end );

####################################
#
#! @Section Constructors
#
####################################

#= comment for Julia
#! @Description
#!  Construct the free distributive closure category with strict products and coproducts of a category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure",
        IsCapCategory );
#! @InsertChunk SnakeInFreeAbelian
# =#

#% G2J:julia-only @DeclareFilterDispatchedOperation( "AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure" )

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the free distributive closure category <A>DC</A> with strict products and coproducts into <A>DC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure );

#= comment for Julia
DeclareOperation( "ExtendFunctorToAbelianClosureData",
        [ IsCapCategory, IsList, IsCapCategory ] );
# =#

#% G2J:julia-only @DeclareFilterDispatchedOperation( "ExtendFunctorToAbelianClosureData" );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the free distributive closure category <A>DC</A> with strict products and coproducts into <A>DC</A>.
#! @Arguments DC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToAbelianClosure",
        IsCapFunctor );
