# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareOperation( "ExternalHomDiagram",
    [ IsCapCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareOperation( "AuxiliaryMorphism",
    [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_PRESHEAF_CATEGORY" );
