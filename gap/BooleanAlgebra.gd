#
# Locales: Boolean algebras
#
# Declarations
#

#! @Chapter Boolean algebras

#! @Section GAP Properties

#! @Description
#!  The property of <A>C</A> being a cartesian closed &CAP; category with isomorphic biduals.
#! @Arguments C
DeclareProperty( "IsCartesianClosedCategoryWithIsomorphicBiduals",
                 IsCapCategory );

# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS" );
