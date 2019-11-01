#! @Chunk HomalgZeroLeftModule

LoadPackage( "IntrinsicModules" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
F := HomalgZeroLeftModule( ZZ );
#! <A zero left module>
0 * ZZ;
#! <The zero left module>
#! @EndExample
