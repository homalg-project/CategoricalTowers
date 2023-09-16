#! @Chunk HomalgFreeLeftModule

LoadPackage( "IntrinsicModules" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
F := HomalgFreeLeftModule( 1, zz );
#! <A free left module of rank 1 on a free generator>
1 * zz;
#! <The free left module of rank 1 on a free generator>
F := HomalgFreeLeftModule( 2, zz );
#! <A free left module of rank 2 on free generators>
2 * zz;
#! <A free left module of rank 2 on free generators>
#! @EndExample
