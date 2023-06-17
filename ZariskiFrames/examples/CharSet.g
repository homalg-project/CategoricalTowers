#! @Chunk CharSet

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegersInSingular( );
#! Z
R := ZZ * "x";
#! Z[x]
gamma := ClosedSubsetOfSpecByRadicalColumn( "[2*x+1]", R );
#! V_{Z[x]}( <...> )
im := ConstructibleProjection( gamma );
#! ( V_{Z}( I1 ) \ V_{Z}( J1_1 ) )
Display( im );
#! ( V( <> )
#! 
#! \ V( <2> ) )
char := -im;
#! ( V_{Z}( I1 ) \ V_{Z}( J1_1 ) \ V_{Z}( J1_2 ) )
Display( char );
#! ( V( <2> )
#! 
#! \ ∅
#! 
#! \ ∅ )
char := CanonicalObject( char );
#! V_{Z}( <...> )
Display( char );
#! V( <2> )
#! @EndExample
