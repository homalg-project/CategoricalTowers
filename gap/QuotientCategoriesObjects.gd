#
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# Declarations
#

#! @Chapter Filters and constructors

#! @Section Filters

#! @Description
#!  The &GAP; category of cells in the quotient category.
#! @Arguments a object
DeclareCategory( "IsQuotientCategoryCell",
                 IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the quotient category.
#! @Arguments a object
DeclareCategory( "IsQuotientCategoryObject",
                 IsQuotientCategoryCell and IsCapCategoryObject );

#! @Section Constructors

#! @Description
#! The input is a quotient category $Q=C/F$ and an object $a \in C$.
#! The output is $\underline{a} \in Q$.
#! @Arguments Q, a
#! @Returns an object
DeclareOperation( "QuotientCategoryObject", [ IsQuotientCategory, IsCapCategoryObject ] );

#! @Description
#! The input is a quotient category $Q=C/F$ and an object $a \in C$.
#! The output is $\underline{a} \in Q$.
#! @Arguments a, Q
#! @Returns an object
DeclareOperation( "\/", [ IsCapCategoryObject, IsQuotientCategory ] );


#! @Section Attributes and properties

#! @Description
#! The input is an object $\underline{a}$ 
#! in some quotient category $Q=C/F$ and the output is $a$ in $C$.
#! @Arguments _a_
#! @Returns an object
DeclareAttribute( "UnderlyingCell", IsQuotientCategoryObject );


#! @Chapter Examples

#! @Section Abelian groups
#! @InsertChunk abelian_groups
