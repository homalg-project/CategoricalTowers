#
# SubcategoriesForCAP
#
# FunctorsForFullSubcategories.gd

####################################
#
#! @Chapter Full subcategories
#! @Section Functors
#
####################################

#! @Description
#!  The natural embedding functor from <A>A</A> to <A>AmbientCategory(A)</A>.
#! @Arguments A
#! @Returns CapFunctor
DeclareAttribute( "InclusionFunctor",
        IsCapFullSubcategory );

#! @Description
#!  The arguments are a functor <A>F</A> and a full subcategory <A>full</A> of <C>Source</C>(<A>F</A>).
#!  The output is the restriction functor $F_{full}$:<A>full</A>$\to$<C>Range</C>(<A>F</A>).
#! @Arguments F, full
#! @Returns CapFunctor
KeyDependentOperation( "RestrictFunctorToFullSubcategoryOfSource",
                  IsCapFunctor, IsCapFullSubcategory, ReturnTrue );


