# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal exterior or symmetric algebra

####################################
##
#! @Section Operations
##
####################################

#! @Arguments C, V, i, j, str
#! @Returns a &CAP; category morphism
DeclareOperation( "ExteriorOrSymmetricAlgebraMultiplication",
        [ IsCapCategory, IsCapCategoryObject, IsInt, IsInt, IsStringRep ] );
