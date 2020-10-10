# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Categories of finitely presented modules

#! @Section Constructors

DeclareGlobalFunction( "INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS" );

#! @Description
#!  Turn a natural isomorphism from the identity functor to and endo-equivalence
#!  on the underlying &CAP; category into an identity rewriting functor
#!  on the &homalg; category.
#! @Arguments natiso
#! @Returns a &CAP; functor
DeclareOperation( "TurnAutoequivalenceIntoIdentityFunctorForHomalg",
        [ IsCapNaturalTransformation, IsCapCategory ] );

#! @Description
#!  Construct the category of finitely presented left &homalg; modules
#!  over the computable &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns an intrinsic cateogry of left modules
DeclareAttribute( "CategoryOfHomalgFinitelyPresentedLeftModules",
        IsHomalgRing );

#! @Description
#!  Construct the category of finitely presented right &homalg; modules
#!  over the computable &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns an intrinsic cateogry of right modules
DeclareAttribute( "CategoryOfHomalgFinitelyPresentedRightModules",
        IsHomalgRing );
