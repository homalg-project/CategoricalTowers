# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# Declarations
#

#! @Chapter Filters and constructors

#! @Section Filters

#! @Description
#!  The gap category of quotient categories morphisms
#! @Arguments alpha
#! @Returns a boolian
DeclareCategory( "IsQuotientCategoryMorphism",
                 IsQuotientCategoryCell and IsCapCategoryMorphism );

#! @Section Constructors

#! @Description
#!  The arguments are two objects $\underline{a}, \underline{b}$ in a quotient category $Q=C/F$ 
#!  and a morphism $\alpha:a \rightarrow b$ in $C$.
#!  The output is $\underline{\alpha}: \underline{a} \rightarrow \underline{b}$ in $Q$.
#! @Arguments _a_, alpha, _b_
#! @Returns a morphism
DeclareOperation( "QuotientCategoryMorphism", [ IsQuotientCategoryObject, IsCapCategoryMorphism, IsQuotientCategoryObject ] );

#! @Description
#! The input is a quotient category $Q=C/F$ and a morphism $\alpha:a \rightarrow b$ in $C$.
#! The output is $\underline{\alpha}: \underline{a} \rightarrow \underline{b}$ in $Q$.
#! @Arguments Q, alpha
#! @Returns a morphism
DeclareOperation( "QuotientCategoryMorphism", [ IsQuotientCategory, IsCapCategoryMorphism ] );

#! @Description
#! The input is a quotient category $Q=C/F$ and a morphism $\alpha:a \rightarrow b$ in $C$.
#! The output is $\underline{\alpha}: \underline{a} \rightarrow \underline{b}$ in $Q$.
#! @Arguments Q, alpha
#! @Returns a morphism
DeclareOperation( "\/", [ IsCapCategoryMorphism, IsQuotientCategory ] );

#! @Section Attributes and properties

#! @Description
#! The input is a morphism $\underline{\alpha}: \underline{a} \rightarrow \underline{b}$ 
#! in some quotient category $Q=C/F$ and the output is $\alpha: a \rightarrow b$ in $C$.
#! @Arguments _alpha_
#! @Returns a morphism
DeclareAttribute( "UnderlyingCell", IsQuotientCategoryMorphism );

