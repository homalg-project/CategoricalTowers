# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Declarations
#

#! @Chapter The terminal category allowing multiple objects

#! This is an example of category created using <C>CategoryConstructor</C>
#! which takes not input.

#! The category is also used in conjunction with <C>LazyCategory</C> to
#! to check the type-correctness of derived methods.

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments
DeclareGlobalFunction( "TerminalCategoryWithMultipleObjects" );
#! @InsertChunk TerminalCategoryWithMultipleObjects
