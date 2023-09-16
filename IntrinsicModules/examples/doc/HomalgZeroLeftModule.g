#! @Chunk HomalgZeroLeftModule

LoadPackage( "IntrinsicModules" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
F := HomalgZeroLeftModule( zz );
#! <A zero left module>
0 * zz;
#! <The zero left module>
#! @EndExample
