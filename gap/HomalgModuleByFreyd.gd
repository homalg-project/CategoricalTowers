# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Modules

#! @Section Constructors

# @Description
#  This is a technical operation meant to avoid code duplication
#  in <C>LeftPresentation</C>/<C>RightPresentation</C>.
# @Arguments M
# @Returns a &homalg; module, i.e., an intrinsic module with generators for each cell
DeclareOperation( "HomalgModule",
        [ IsFreydCategoryObject ] );
