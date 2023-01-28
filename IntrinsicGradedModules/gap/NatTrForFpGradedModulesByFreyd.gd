# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Categories of finitely presented graded modules

#######################################
##
#! @Section Natural transformations
##
#######################################

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural isomorphism from the identity functor
#! to the left standard module functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{StandardGradedModuleLeft}$
#! @Arguments S
DeclareAttribute( "NaturalIsomorphismFromIdentityToStandardGradedModuleLeft",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural isomorphism from the identity functor
#! to the right standard module functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{StandardGradedModuleRight}$
#! @Arguments S
DeclareAttribute( "NaturalIsomorphismFromIdentityToStandardGradedModuleRight",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural isomorphism from the identity functor
#! to the functor that gets rid of zero generators of left modules.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{GetRidOfZeroHomogeneousGeneratorsLeft}$
#! @Arguments S
DeclareAttribute( "NaturalIsomorphismFromIdentityToGetRidOfZeroHomogeneousGeneratorsLeft",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural isomorphism from the identity functor
#! to the functor that gets rid of zero generators of right modules.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{GetRidOfZeroHomogeneousGeneratorsRight}$
#! @Arguments S
DeclareAttribute( "NaturalIsomorphismFromIdentityToGetRidOfZeroHomogeneousGeneratorsRight",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural morphism from the identity functor
#! to the left less generators functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{LessHomogeneousGeneratorsLeft}$
#! @Arguments S
DeclareAttribute( "NaturalIsomorphismFromIdentityToLessHomogeneousGeneratorsLeft",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural morphism from the identity functor
#! to the right less generator functor.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{LessHomogeneousGeneratorsRight}$
#! @Arguments S
DeclareAttribute( "NaturalIsomorphismFromIdentityToLessHomogeneousGeneratorsRight",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural morphism from the identity functor
#! to the double dual functor in left Presentations category.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{FunctorDoubleGradedDualLeft}$
#! @Arguments S
DeclareAttribute( "NaturalTransformationFromIdentityToDoubleGradedDualLeft",
        IsHomalgGradedRing );

#! @Description
#! The argument is a homalg graded ring $S$.
#! The output is the natural morphism from the identity functor
#! to the double dual functor in right Presentations category.
#! @Returns a natural transformation $\mathrm{Id} \rightarrow \mathrm{FunctorDoubleGradedDualRight}$
#! @Arguments S
DeclareAttribute( "NaturalTransformationFromIdentityToDoubleGradedDualRight",
        IsHomalgGradedRing );
