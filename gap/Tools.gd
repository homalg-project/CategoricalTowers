#
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Tools

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#!  There are 3 arguments.
#!  The first argument is
#!  The first argument is an irreducible
#!  character <A>c</A>, which will be then interpreted as giving the input $[ [ 1, c ] ]$.
#!  The second argument is the CAP category $C = G$-mod.
#!  The output is the unique simple object in $G$-mod having corresponding
#!  to the character <A>c</A>.
#!  The third argument is a string used as follows:
#!  <C>SetString</C>( <C>GIrreducibleObject</C>( <A>c</A> ), <A>str</A> ).
#! @Returns an object in $G$-mod
#! @Arguments c, C, str
DeclareOperation( "RepresentationCategoryObject", [ IsList, IsCapCategory, IsString ] );
