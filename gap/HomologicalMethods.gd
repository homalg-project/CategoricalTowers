# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareAttribute( "RadicalInclusion", IsObjectInFunctorCategory );

DeclareOperation( "CoverElementByProjectiveObject", [ IsObjectInFunctorCategory, IsCapCategoryMorphism, IsInt ] );

DeclareAttribute( "MorphismsFromDirectSumDecompositionOfProjectiveCover", IsObjectInFunctorCategory );

DeclareAttribute( "DirectSumDecompositionOfProjectiveObject", IsObjectInFunctorCategory );

DeclareAttribute( "ProjectiveCover", IsObjectInFunctorCategory );

DeclareAttribute( "DualOfObjectInFunctorCategory", IsObjectInFunctorCategory );

DeclareAttribute( "DualOfMorphismInFunctorCategory", IsMorphismInFunctorCategory );
