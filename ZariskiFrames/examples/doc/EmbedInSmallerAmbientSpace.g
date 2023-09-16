#! @Chunk EmbedInSmallerAmbientSpace

LoadPackage( "ZariskiFrames" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
A := ClosedSubsetOfSpec( "[ 10, 15 ]", zz );
#! V_{Z}( <...> )
Display( A );
#! V( <10,15> )
StandardizeObject( A );
#! V_{Z}( <...> )
Display( A );
#! V( <5> )
Ae := EmbedInSmallerAmbientSpace( A );
#! V_{GF(5)}( <...> )
Display( Ae );
#! V( <> )
I := ClosedSubsetOfSpec( "[ 1 ]", zz );
#! V_{Z}( <...> )
Display( I );
#! V( <1> )
Ie := EmbedInSmallerAmbientSpace( I );
#! V_{Z}( <...> )
Display( Ie );
#! ∅
Q := HomalgFieldOfRationals( );
#! Q
L := ClosedSubsetOfSpec( "[ 1 ]", Q );
#! V_{Q}( <...> )
Display( L );
#! V( <1> )
Le := EmbedInSmallerAmbientSpace( L );
#! V_{Q}( <...> )
Display( Le );
#! ∅
R := HomalgRingOfIntegersInSingular( ) * "x";
#! Z[x]
B := ClosedSubsetOfSpec( "[ 2, x^2+1 ]", R );
#! V_{Z[x]}( <...> )
Display( B );
#! V( <2,x^2+1> )
Be := EmbedInSmallerAmbientSpace( B );
#! V_{GF(2)}( <...> )
Display( Be );
#! V( <> )
C := ClosedSubsetOfSpec( "[ 2, x^2+x+1 ]", R );
#! V_{Z[x]}( <...> )
Display( C );
#! V( <2,x^2+x+1> )
Ce := EmbedInSmallerAmbientSpace( C );
#! V_{GF(2)[x]}( <...> )
Display( Ce );
#! V( <x^2+x+1> )
#! @EndExample
