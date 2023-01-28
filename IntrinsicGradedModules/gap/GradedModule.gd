# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Categories of finitely presented graded modules

DeclareFilter( "IsIntrinsicGradedModuleOrSubmodule" );

#! @Section Constructors

# @Description
#  This is a technical operation meant to avoid code duplication
#  in <C>LeftPresentationWithDegrees</C>/<C>RightPresentationWithDegrees</C>.
# @Arguments M
# @Returns a &homalg; graded module, i.e., an intrinsic graded module with generators for each cell
DeclareOperation( "HomalgGradedModule",
        [ IsFpGradedLeftOrRightModulesObject ] );

## remove the enclosing "if false then" once the homalg_project package Modules is deprecated

if false then

#! @Description
#!  This constructor returns the finitely presented left module with homogeneous relations
#!  given by the rows of the &homalg; matrix <A>mat</A>.
#! @Arguments mat
#! @Returns a &homalg; graded left module
DeclareOperation( "LeftPresentationWithDegrees",
        [ IsHomalgMatrix ] );
#! @InsertChunk LeftPresentationWithDegrees

#! @Description
#!  This constructor returns the finitely presented right module with homogeneous relations
#!  given by the columns of the &homalg; matrix <A>mat</A>.
#! @Arguments mat
#! @Returns a &homalg; graded right module
DeclareOperation( "RightPresentationWithDegrees",
        [ IsHomalgMatrix ] );
#! @InsertChunk RightPresentationWithDegrees

fi;
