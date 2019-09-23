############################################################################
##
##                                InternalModules package
##
##  Copyright 2019, Mohamed Barakat,   University of Siegen
##
#! @Chapter Internal symmetric algebra
##
#############################################################################

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsInternalSymmetricAlgebra", IsInternalAlgebra and IsObjectInPositivelyZGradedCategory );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments V
#! @Returns an infinite list
DeclareAttribute( "SymmetricAlgebraAsInfiniteList", IsCapCategoryObject, "mutable" );

#! @Arguments V
#! @Returns a list of lists of morphisms
DeclareAttribute( "SymmetricAlgebraMultiplicationListList", IsCapCategoryObject, "mutable" );

#! @Arguments V
#! @Returns a CAP; category object in the filter <C>IsObjectInPositivelyZGradedCategory</C>
DeclareAttribute( "SymmetricAlgebra", IsCapCategoryObject );

#! @Arguments V
#! @Returns a CAP; category morphism in the filter <C>IsMorphismInPositivelyZGradedCategory</C>
DeclareAttribute( "SymmetricAlgebraMultiplicationMorphism", IsCapCategoryObject );

#! @Arguments V
#! @Returns a CAP; object morphism in the filter <C>IsCategoryOfLeftSModules</C>
DeclareAttribute( "SymmetricAlgebraAsLeftModule", IsCapCategoryObject );

#! @Arguments V
#! @Returns a CAP; object morphism in the filter <C>IsCategoryOfRightSModules</C>
DeclareAttribute( "SymmetricAlgebraAsRightModule", IsCapCategoryObject );

####################################
##
#! @Section Operations
##
####################################

#! @Arguments V
#! @Returns a &CAP; category morphism
DeclareOperation( "SymmetricAlgebraMultiplication",
        [ IsCapCategoryObject, IsInt, IsInt ] );

