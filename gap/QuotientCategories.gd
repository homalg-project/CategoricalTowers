# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# Declarations
#

DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY" );

#! @Chapter Filters and constructors

#! @Section Filters

#! @Description
#!  The Gap filter of the Cap quotient categories.
#! @Arguments C
#! @Returns a boolian
DeclareCategory( "IsQuotientCategory",
                 IsCapCategory );

#! @Section Constructors

#! @Description
#! The input is a category $C$ and a function $F$. For two objects $a$ and $b$ in $C$,
#! the function $F$ can be applied on two morphisms $\alpha,\beta \in \mathrm{Hom}_C(a,b)$ and returns 
#! <C>true</C> if $\alpha \sim \beta$ and <C>false</C> otherwise.
#! The output is the quotient category $C/F$.
#! @Arguments C, F
#! @Returns a Cap category
DeclareOperation( "QuotientCategory", [ IsCapCategory, IsFunction ] );

#! @Section Attributes and properties

#! @Description
#! The input is a quotient category $Q := C/F$. The output is the category $C$.
#! @Arguments Q
#! @Returns a category
DeclareAttribute( "UnderlyingCategory", IsQuotientCategory );

#! @Description
#! The input is a quotient category $Q := C/F$. The output is the congruence test function $F$.
#! @Arguments Q
#! @Returns a function
DeclareAttribute( "CongruencyTestFunctionForQuotientCategory", IsQuotientCategory );

#! @Description
#! The input is a quotient category $Q := C/F$. The output is the canonical projection functor
#! $\pi:C \rightarrow C/F$.
#! @Arguments Q
#! @Returns a functor
DeclareAttribute( "ProjectionFunctor", IsQuotientCategory );


DeclareGlobalFunction( "ADD_BASIC_OPERATIONS_FOR_QUOTIENT_CATEGORY" );



