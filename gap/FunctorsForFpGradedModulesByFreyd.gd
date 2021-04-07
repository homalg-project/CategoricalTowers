# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Categories of finitely presented graded modules

#######################################
##
#! @Section Functors
##
#######################################

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is a functor which takes
#! a graded left presentation as input and computes
#! its standard presentation.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorStandardGradedModuleLeft",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is a functor which takes
#! a graded right presentation as input and computes
#! its standard presentation.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorStandardGradedModuleRight",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is a functor which takes
#! a graded left presentation as input and gets
#! rid of the zero generators.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorGetRidOfZeroHomogeneousGeneratorsLeft",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is a functor which takes
#! a graded right presentation as input and gets
#! rid of the zero generators.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorGetRidOfZeroHomogeneousGeneratorsRight",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is functor which takes
#! a graded left presentation as input and computes
#! a presentation having less generators.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorLessHomogeneousGeneratorsLeft",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is functor which takes
#! a graded right presentation as input and computes
#! a presentation having less generators.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorLessHomogeneousGeneratorsRight",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$ that has an involution function.
#! The output is functor which takes
#! a graded left presentation <A>M</A> as input and computes
#! its Hom(M, R) as a graded left presentation.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorGradedDualLeft",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$ that has an involution function.
#! The output is functor which takes
#! a graded right presentation <A>M</A> as input and computes
#! its Hom(M, R) as a graded right presentation.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorGradedDualRight",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$ that has an involution function.
#! The output is functor which takes
#! a graded left presentation <A>M</A> as input and computes
#! its <A>Hom( Hom(M, R), R )</A> as a graded left presentation.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorDoubleGradedDualLeft",
                  IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$ that has an involution function.
#! The output is functor which takes
#! a graded right presentation <A>M</A> as input and computes
#! its <A>Hom( Hom(M, R), R )</A> as a graded right presentation.
#! @Returns a functor
#! @Arguments S
DeclareAttribute( "FunctorDoubleGradedDualRight",
                  IsHomalgGradedRing );
