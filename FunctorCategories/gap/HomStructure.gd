# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareOperation( "CoequalizerDataOfPreSheaf",
    [ IsCapCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "ApplyPreSheafToObjectInFiniteStrictCoproductCocompletion",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInFiniteStrictCoproductCocompletion ] );

DeclareOperation( "ApplyPreSheafToMorphismInFiniteStrictCoproductCocompletion",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsMorphismInFiniteStrictCoproductCocompletion ] );

DeclareOperation( "ExternalHomAsEqualizerOnObjects",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "ExternalHomAsEqualizerOnMorphisms",
    [ IsCapCategory, IsMorphismInPreSheafCategory, IsMorphismInPreSheafCategory ] );

DeclareOperation( "ExternalHomDiagram",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "AuxiliaryMorphism",
    [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_PRESHEAF_CATEGORY" );
