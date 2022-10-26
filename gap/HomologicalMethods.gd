# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareAttribute( "RadicalInclusionOfPreSheaf", IsObjectInPreSheafCategory );

DeclareOperation( "CoverElementByIndecomposableProjectivePreSheaf", [ IsObjectInPreSheafCategory, IsCapCategoryMorphism, IsInt ] );

DeclareAttribute( "ProjectiveCoverObjectDataOfPreSheaf", IsObjectInPreSheafCategory );

#DeclareAttribute( "MorphismsIntoDirectSumDecompositionOfInjectiveEnvelope", IsObjectInPreSheafCategory );

#DeclareAttribute( "DirectSumDecompositionOfInjectiveObject", IsObjectInPreSheafCategory );

DeclareAttribute( "InjectiveEnvelope", IsObjectInPreSheafCategory );
