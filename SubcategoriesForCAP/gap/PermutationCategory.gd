# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Declarations
#

#! @Chapter Category of permutations

#! The skeletal category of permutations is the core of
#! of the skeletal category of finite sets.
#! Thus, its objects are the same as those of the
#! skeletal category of finite sets and its morphisms
#! are the isomorphisms of skeletal finite sets.
#!
#! More concretely, an object datum is an integer greater or equal to 0,
#! and a morphism datum is a GAP permutation.

####################################
#
#! @Section GAP categories
#
####################################

DeclareCategory( "IsPermutationCategory", IsCapCategory );

DeclareCategory( "IsObjectInPermutationCategory", IsCapCategoryObject );

DeclareCategory( "IsMorphismInPermutationCategory", IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a &CAP; category of permutations.
DeclareOperation( "PermutationCategory", [ ] );

####################################
#
#! @Section Attributes
#
####################################

DeclareAttribute( "Cardinality", IsObjectInPermutationCategory );

CapJitAddTypeSignature( "Cardinality", [ IsObjectInPermutationCategory ], IsBigInt );

#! @Returns a &GAP; permutation
DeclareAttribute( "UnderlyingPermutation", IsMorphismInPermutationCategory );

CapJitAddTypeSignature( "UnderlyingPermutation", [ IsMorphismInPermutationCategory ], IsPerm );

#######################################
##
#! @Section Functors
##
#######################################

##
DeclareOperation( "EmbeddingOfPermutationCategoryIntoCategoryOfRows",
                  [ IsCapCategory, IsCapCategory ] );

#######################################
##
## Type signatures for GAP permutations
##
#######################################

CapJitAddTypeSignature( "*", [ IsPerm, IsPerm ], IsPerm );

CapJitAddTypeSignature( "OnPoints", [ IsBigInt, IsPerm ], IsBigInt );

# CapJitAddTypeSignature( "InverseImmutable", [ IsPerm ], IsPerm );

CapJitAddTypeSignature( "ListPerm", [ IsPerm, IsBigInt ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

