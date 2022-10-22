# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Category of functors of a finitely presented (linear) category

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Return a pair of monomorphisms describing the embeddings
#!  of two direct summands of the representation <A>F</A>,
#!  the direct sum thereof is isomorphic to <A>F</A>.
#! @Arguments F
#! @Returns a list
DeclareOperation( "DecomposeOnceByRandomEndomorphism",
        [ IsObjectInFunctorCategory ] );

#! @Description
#!  Return a list of monomorphisms describing the embeddings
#!  of a list of direct summands of the representation <A>F</A>,
#!  the direct sum thereof is isomorphic to <A>F</A>.
#! @Arguments F
#! @Returns a list
DeclareOperation( "WeakDirectSumDecomposition",
        [ IsObjectInFunctorCategory ] );
