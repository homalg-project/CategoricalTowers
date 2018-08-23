#
# Locales: Heyting algebras
#
# Declarations
#

#! @Chapter Heyting algebras

#! @Section GAP Properties

#! @Description
#!  The property of <A>C</A> being a cartesian closed &CAP; category.
#! @Arguments C
DeclareProperty( "IsCartesianClosedCategory",
                 IsCapCategory );

#! @Description
#!  The property of <A>C</A> being a co-cartesian co-closed &CAP; category.
#! @Arguments C
DeclareProperty( "IsCocartesianCoclosedCategory",
                 IsCapCategory );

# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS" );
