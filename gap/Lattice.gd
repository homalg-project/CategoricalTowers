#
# Locales: Lattices
#
# Declarations
#

# @Section Operations

DeclareOperation( "+",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

DeclareOperation( "*",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );


# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_LATTICES" );
