#
# FunctorCategories: Categories of functors
#
# Declarations
#


#! @Chapter Categories of functors

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
        [ IsCapCategoryObjectInHomCategory ] );

#! @Description
#!  Return a list of monomorphisms describing the embeddings
#!  of a list of direct summands of the representation <A>F</A>,
#!  the direct sum thereof is isomorphic to <A>F</A>.
#! @Arguments F
#! @Returns a list
DeclareOperation( "WeakDirectSumDecomposition",
        [ IsCapCategoryObjectInHomCategory ] );
