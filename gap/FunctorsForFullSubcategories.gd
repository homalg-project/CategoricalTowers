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
DeclareOperation( "RestrictFunctorToFullSubcategoryOfSource",
        [ IsCapFunctor, IsCapFullSubcategory ] );

#! @Description
#!  The arguments are a functor <A>F</A> and a full subcategory <A>full</A> of <C>Range</C>(<A>F</A>).
#!  The output is the restriction functor $F_{full}$:<C>Source</C>(<A>F</A>)$\to$<A>full</A>.
#! @Arguments F, full
#! @Returns CapFunctor
DeclareOperation( "RestrictFunctorToFullSubcategoryOfRange",
        [ IsCapFunctor, IsCapFullSubcategory ] );

#! @Description
#!  The arguments are a functor <A>F</A> and two full subcategories <A>full_1</A> of <C>Source</C>(<A>F</A>)
#!  and <A>full_2</A> of <C>Range</C>(<A>F</A>).
#!  The output is the restriction functor $F_{full}$:<A>full_1</A>$\to$<A>full_2</A>.
#! @Arguments F, full_1, full_2
#! @Returns CapFunctor
DeclareOperation( "RestrictFunctorToFullSubcategories",
        [ IsCapFunctor, IsCapFullSubcategory, IsCapFullSubcategory ] );
