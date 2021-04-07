# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Categories of finitely presented graded modules

#! @Section GAP categories

#!
DeclareCategory( "IsCategoryOfHomalgGradedModules",
        IsCapCategory );

#! @Section Constructors

#! @Description
#!  Construct the category of finitely presented graded left modules
#!  over the computable graded ring <A>S</A>.
#! @Arguments R
#! @Returns an intrinsic cateogry of left modules
DeclareAttribute( "CategoryOfHomalgFinitelyPresentedGradedLeftModules",
        IsHomalgGradedRing );

#! @Description
#!  Construct the category of finitely presented graded right modules
#!  over the computable graded ring <A>S</A>.
#! @Arguments R
#! @Returns an intrinsic cateogry of right modules
DeclareAttribute( "CategoryOfHomalgFinitelyPresentedGradedRightModules",
        IsHomalgGradedRing );
