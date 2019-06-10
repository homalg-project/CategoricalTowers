#! @Chunk HomalgFreeLeftModule

LoadPackage( "ModulesForHomalg" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
F := HomalgFreeLeftModule( 1, ZZ );
#! <A free left module of rank 1 on a free generator>
1 * ZZ;
#! <The free left module of rank 1 on a free generator>
F := HomalgFreeLeftModule( 2, ZZ );
#! <A free left module of rank 2 on free generators>
2 * ZZ;
#! <A free left module of rank 2 on free generators>
#! @EndExample
