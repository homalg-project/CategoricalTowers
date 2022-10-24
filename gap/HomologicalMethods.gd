# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareAttribute( "RadicalInclusion", IsObjectInPreSheafCategory );

DeclareOperation( "CoverElementByProjectiveObject", [ IsObjectInPreSheafCategory, IsCapCategoryMorphism, IsInt ] );

DeclareAttribute( "MorphismsFromDirectSumDecompositionOfProjectiveCover", IsObjectInPreSheafCategory );

DeclareAttribute( "DirectSumDecompositionOfProjectiveObject", IsObjectInPreSheafCategory );

DeclareAttribute( "ProjectiveCover", IsObjectInPreSheafCategory );

DeclareAttribute( "DualOfObjectInPreSheafCategory", IsObjectInPreSheafCategory );

DeclareAttribute( "DualOfMorphismInPreSheafCategory", IsMorphismInPreSheafCategory );

#DeclareAttribute( "MorphismsIntoDirectSumDecompositionOfInjectiveEnvelope", IsObjectInPreSheafCategory );

#DeclareAttribute( "DirectSumDecompositionOfInjectiveObject", IsObjectInPreSheafCategory );

DeclareAttribute( "InjectiveEnvelope", IsObjectInPreSheafCategory );
