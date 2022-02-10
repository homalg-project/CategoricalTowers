# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareOperation( "ExternalHomDiagram",
    [ IsCapCategory, IsObjectInFunctorCategory, IsObjectInFunctorCategory ] );

DeclareOperation( "AuxiliaryMorphism",
    [ IsFunctorCategory, IsObjectInFunctorCategory, IsObjectInFunctorCategory ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTOR_CATEGORY" );
