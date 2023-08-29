# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal symmetric algebra

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsInternalSymmetricAlgebra", IsInternalAlgebra and IsObjectInPositivelyZGradedClosureCategory );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments V
#! @Returns an infinite list
DeclareAttribute( "SymmetricAlgebraAsZFunction", IsCapCategoryObject, "mutable" );

#! @Arguments V
#! @Returns a list of lists of morphisms
DeclareAttribute( "SymmetricAlgebraMultiplicationListList", IsCapCategoryObject, "mutable" );

#! @Arguments V
#! @Returns a &CAP; category object (<C>IsObjectInPositivelyZGradedClosureCategory</C>)
DeclareAttribute( "SymmetricAlgebra", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; category morphism (<C>IsMorphismInPositivelyZGradedClosureCategory</C>)
DeclareAttribute( "SymmetricAlgebraMultiplicationMorphism", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; object morphism in the filter <C>IsCategoryOfLeftSModules</C>
DeclareAttribute( "SymmetricAlgebraAsLeftModule", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; object morphism in the filter <C>IsCategoryOfRightSModules</C>
DeclareAttribute( "SymmetricAlgebraAsRightModule", IsCapCategoryObject );
