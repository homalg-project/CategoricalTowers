# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Functors

#! @Section Endofunctors of finitely presented modules

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is a functor which takes
#! a graded left presentation as input and computes
#! its standard presentation.
#! @Returns a functor
#! @Arguments A
DeclareAttribute( "FunctorStandardPresentationOfFpLeftModule",
                  IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is a functor which takes
#! a graded right presentation as input and computes
#! its standard presentation.
#! @Returns a functor
#! @Arguments A
DeclareAttribute( "FunctorStandardPresentationOfFpRightModule",
                  IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is a functor which takes
#! a graded left presentation as input and gets
#! rid of the zero generators.
#! @Returns a functor
#! @Arguments A
DeclareAttribute( "FunctorGetRidOfZeroGeneratorsOfFpLeftModule",
                  IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is a functor which takes
#! a graded right presentation as input and gets
#! rid of the zero generators.
#! @Returns a functor
#! @Arguments A
DeclareAttribute( "FunctorGetRidOfZeroGeneratorsOfFpRightModule",
                  IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is functor which takes
#! a graded left presentation as input and computes
#! a presentation having less generators.
#! @Returns a functor
#! @Arguments A
DeclareAttribute( "FunctorLessGeneratorsOfLeftFpModule",
                  IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is functor which takes
#! a graded right presentation as input and computes
#! a presentation having less generators.
#! @Returns a functor
#! @Arguments A
DeclareAttribute( "FunctorLessGeneratorsOfRightFpModule",
                  IsCapCategory );
