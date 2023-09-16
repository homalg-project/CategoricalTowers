#! @Chunk HomalgFreeRightModule

LoadPackage( "IntrinsicModules" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
F := HomalgFreeRightModule( 1, zz );
#! <A free right module of rank 1 on a free generator>
zz * 1;
#! <The free right module of rank 1 on a free generator>
F := HomalgFreeRightModule( 2, zz );
#! <A free right module of rank 2 on free generators>
zz * 2;
#! <A free right module of rank 2 on free generators>
#! @EndExample
