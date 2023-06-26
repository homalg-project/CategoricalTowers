# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareOperation( "ExternalHomOnObjectsEqualizerDataUsingOptimizedCoYonedaLemma",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "ExternalHomOnMorphismsEqualizerFunctorialDataUsingCoYonedaLemma",
    [ IsCapCategory, IsMorphismInPreSheafCategory, IsMorphismInPreSheafCategory ] );

DeclareOperation( "ExternalHomDiagram",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "AuxiliaryMorphism",
    [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_PRESHEAF_CATEGORY" );
