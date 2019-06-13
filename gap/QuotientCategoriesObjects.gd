##############################################################################
##
##  QuotientCategoriesForCAP: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

#! @Chapter Filters and constructors

#! @Section Filters

#! @Description
#!  The category of objects in the quotient category.
#! @Arguments a object
DeclareCategory( "IsQuotientCategoryObject",
                 IsCapCategoryObject );

#! @Section Constructors

#! @Description
#! The input is a quotient category $Q=C/F$ and an object $a \in C$.
#! The output is $\underline{a} \in Q$.
#! @Arguments Q, a
#! @Returns an object
DeclareOperation( "QuotientCategoryObject", [ IsQuotientCategory, IsCapCategoryObject ] );

#! @Section Attributes and properties

#! @Description
#! The input is an object $\underline{a}$ 
#! in some quotient category $Q=C/F$ and the output is $a$ in $C$.
#! @Arguments _a_
#! @Returns an object
DeclareAttribute( "UnderlyingCapCategoryObject", IsQuotientCategoryObject );


#! @Chapter Examples

#! @Section Abelian groups
#! @InsertChunk abelian_groups
