# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal exterior algebra

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsInternalExteriorAlgebra", IsInternalAlgebra and IsObjectInFinitelyZGradedClosureCategory );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments V
#! @Returns an infinite list
DeclareAttribute( "ExteriorAlgebraAsZFunction", IsCapCategoryObject, "mutable" );

#! @Arguments V
#! @Returns a list of lists of morphisms
DeclareAttribute( "ExteriorAlgebraMultiplicationListList", IsCapCategoryObject, "mutable" );

#! @Arguments V
#! @Returns a &CAP; category object (<C>IsObjectInFinitelyZGradedClosureCategory</C>)
DeclareAttribute( "ExteriorAlgebra", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; category morphism (<C>IsMorphismInFinitelyZGradedClosureCategory</C>)
DeclareAttribute( "ExteriorAlgebraMultiplicationMorphism", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; object morphism in the filter <C>IsCategoryOfLeftEModules</C>
DeclareAttribute( "ExteriorAlgebraAsLeftModule", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; object morphism in the filter <C>IsCategoryOfRightEModules</C>
DeclareAttribute( "ExteriorAlgebraAsRightModule", IsCapCategoryObject );
