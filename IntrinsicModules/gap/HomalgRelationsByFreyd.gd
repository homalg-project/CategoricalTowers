# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Relations

DeclareProperty( "_IsHomalgRelations",
        IsFreydCategoryObject );

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfLeftModule</C> resp. <C>IsHomalgRelationsOfRightModule</C>
#!  to <A>rels</A> of (type <C>IsFreydCategoryObject</C>) and return it.
#! @Arguments rels
#! @Group HomalgRelationsForModule
#! @Returns rels with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsFreydCategoryObject ] );

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfLeftModule</C>
#!  to <A>rels</A> of (type <C>IsCategoryOfRowsObject</C>) and return it.
#! @Arguments rels
#! @Group HomalgRelationsForModule
#! @Returns rels with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsCategoryOfRowsObject ] );

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfRightModule</C>
#!  to <A>rels</A> of (type <C>IsCategoryOfColumnsObject</C>) and return it.
#! @Arguments rels
#! @Group HomalgRelationsForModule
#! @Returns rels with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsCategoryOfColumnsObject ] );
