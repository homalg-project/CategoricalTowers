# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Relations

DeclareProperty( "_IsHomalgRelations",
        IsLeftOrRightPresentation );

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfLeftModule</C> resp. <C>IsHomalgRelationsOfRightModule</C>
#!  to <A>rels</A> of (type <C>IsLeftOrRightPresentation</C>) and return it.
#! @Arguments rels
#! @Returns rels with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsLeftOrRightPresentation ] );
