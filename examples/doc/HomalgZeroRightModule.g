#! @Chunk HomalgZeroRightModule

LoadPackage( "ModulesForHomalg" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
F := HomalgZeroRightModule( ZZ );
#! <A zero right module>
ZZ * 0;
#! <The zero right module>
#! @EndExample
