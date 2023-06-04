#! @Chunk IsomorphismOntoCartesianSquareOfPowerObject

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
a := FinSet( 2 );
#! |2|
ia := IsomorphismOntoCartesianSquareOfPowerObject( a );
#! |16| ⭇ |16|
Display( ia );
#! { 0,..., 15 }\
#!  ⱶ[ 0, 1, 4, 5, 2, 3, 6, 7, 8, 9, 12, 13, 10, 11, 14, 15 ]→ { 0,..., 15 }
#! @EndExample
