# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Declarations
#

##
DeclareOperation( "FpGradedLeftModuleByFreyd",
        [ IsHomalgMatrix, IsList, IsHomalgGradedRingRep ] );

##
DeclareOperation( "FpGradedRightModuleByFreyd",
        [ IsHomalgMatrix, IsList, IsHomalgGradedRingRep ] );
