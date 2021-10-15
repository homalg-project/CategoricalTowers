# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Categories of finitely presented modules

#! @Section GAP categories

#!
DeclareCategory( "IsCategoryOfHomalgModules",
        IsCapCategory );

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

#! @Section Operations and global functions

#! @Description
#!  The image-embedding method used for &homalg; left modules.
#! @Arguments morphism
#! @Returns a left &homalg; module map
DeclareGlobalFunction( "ImageEmbeddingForFpLeftModulesByFreyd" );

#! @Description
#!  The image-embedding method used for &homalg; right modules.
#! @Arguments morphism
#! @Returns a right &homalg; module map
DeclareGlobalFunction( "ImageEmbeddingForFpRightModulesByFreyd" );

#! @Description
#!  The image-embedding method used for &homalg; left modules.
#! @Arguments morphism
#! @Returns a left &homalg; module map
DeclareGlobalFunction( "ImageEmbeddingForFpLeftModulesByPresentations" );

#! @Description
#!  The image-embedding method used for &homalg; right modules.
#! @Arguments morphism
#! @Returns a right &homalg; module map
DeclareGlobalFunction( "ImageEmbeddingForFpRightModulesByPresentations" );
