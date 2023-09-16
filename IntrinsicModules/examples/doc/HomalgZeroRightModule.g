#! @Chunk HomalgZeroRightModule

LoadPackage( "IntrinsicModules" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
F := HomalgZeroRightModule( zz );
#! <A zero right module>
zz * 0;
#! <The zero right module>
#! @EndExample
