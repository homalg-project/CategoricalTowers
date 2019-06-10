#! @Chunk HomalgFreeRightModule

LoadPackage( "ModulesForHomalg" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
F := HomalgFreeRightModule( 1, ZZ );
#! <A free right module of rank 1 on a free generator>
ZZ * 1;
#! <The free right module of rank 1 on a free generator>
F := HomalgFreeRightModule( 2, ZZ );
#! <A free right module of rank 2 on free generators>
ZZ * 2;
#! <A free right module of rank 2 on free generators>
#! @EndExample
