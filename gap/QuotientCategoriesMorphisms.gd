#############################################################################
##
##  QuotientCategories: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

#! @Chapter Filters and constructors

#! @Section Filters

#! @Description
#!  The gap category of quotient categories morphisms
#! @Arguments alpha
#! @Returns a boolian
DeclareCategory( "IsQuotientCategoryMorphism",
                 IsCapCategoryMorphism );

#! @Section Constructors

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

