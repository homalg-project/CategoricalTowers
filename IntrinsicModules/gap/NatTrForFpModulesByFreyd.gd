# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Natural transformations

#! @Section Natural isomorphisms from identity functor

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is the natural isomorphism from the identity functor
#! to the left standard module functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{StandardPresentationOfFpLeftModule}$
#! @Arguments A
DeclareAttribute( "NaturalIsomorphismFromIdentityToStandardPresentationOfFpLeftModule",
        IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is the natural isomorphism from the identity functor
#! to the right standard module functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{StandardPresentationOfFpRightModule}$
#! @Arguments A
DeclareAttribute( "NaturalIsomorphismFromIdentityToStandardPresentationOfFpRightModule",
        IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is the natural isomorphism from the identity functor
#! to the functor that gets rid of zero generators of left modules.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{GetRidOfZeroGeneratorsOfFpLeftModule}$
#! @Arguments A
DeclareAttribute( "NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsOfFpLeftModule",
        IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is the natural isomorphism from the identity functor
#! to the functor that gets rid of zero generators of right modules.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{GetRidOfZeroGeneratorsOfFpRightModule}$
#! @Arguments A
DeclareAttribute( "NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsOfFpRightModule",
        IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is the natural morphism from the identity functor
#! to the left less generators functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{LessGeneratorsOfFpLeftModule}$
#! @Arguments A
DeclareAttribute( "NaturalIsomorphismFromIdentityToLessGeneratorsOfFpLeftModule",
        IsCapCategory );

#! @Description
#! The argument is an additve closure category $A$ of a ring.
#! The output is the natural morphism from the identity functor
#! to the right less generator functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{LessGeneratorsOfFpRightModule}$
#! @Arguments A
DeclareAttribute( "NaturalIsomorphismFromIdentityToLessGeneratorsOfFpRightModule",
        IsCapCategory );
