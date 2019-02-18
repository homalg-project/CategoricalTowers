#! @System ClosedSubsetOfSpec

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
ZC := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( ZZ );
#! The coframe of Zariski closed subsets of the affine spectrum of Z
A := ClosedSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 2 ], 1, 1, ZZ ) );
#! V_{Z}( <...> )
B := ClosedSubsetOfSpec( HomalgMatrix( [ 12, 20 ], 2, 1, ZZ ) );
#! V_{Z}( <...> )
C := ClosedSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 3 ], 1, 1, ZZ ) );
#! V_{Z}( <...> )
D := ClosedSubsetOfSpec( HomalgMatrix( [ 12 ], 1, 1, ZZ ) );
#! V_{Z}( <...> )
A = B;
#! true
A = C;
#! false
embAB := UniqueMorphism( A, B );
#! <An epi-, monomorphism in The coframe of Zariski closed subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAB );
#! true
IsIsomorphism( embAB );
#! true
embAC := UniqueMorphism( A, C );
#! <An epi-, monomorphism in The coframe of Zariski closed subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAC );
#! false
embAD := UniqueMorphism( A, D );
#! <An epi-, monomorphism in The coframe of Zariski closed subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAD );
#! true
IsSubset( D, A );
#! true
IsIsomorphism( embAD );
#! false
embDA := UniqueMorphism( D, A );
#! <An epi-, monomorphism in The coframe of Zariski closed subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embDA );
#! false
IsSubset( A, D );
#! false
T := TerminalObject( ZC );
#! V_{Z}( <...> )
Display( T );
#! V( <> )
I := InitialObject( ZC );
#! V_{Z}( <...> )
Display( I );
#! 0
AvC := Coproduct( A, C );
#! V_{Z}( <...> )
Display( AvC );
#! V( <-6> )
StandardMorphismOfUnderlyingCategory( AvC );
#! <A morphism in Rows( Z )>
Display( AvC );
#! V( <6> )
AC := DirectProduct( A, C );
#! V_{Z}( <...> )
Display( AC );
#! V( <2,3> )
DirectProduct( A, C ) = I;
#! true
CoexponentialOnObjects( I, T ) = I;
#! true
CoexponentialOnObjects( I, A ) = I;
#! true
CoexponentialOnObjects( I, I ) = I;
#! true
CoexponentialOnObjects( A, I ) = A;
#! true
CoexponentialOnObjects( T, I ) = T;
#! true
CoexponentialOnObjects( T, A ) = T;
#! true
CoexponentialOnObjects( T, T ) = I;
#! true
CoexponentialOnObjects( B, D ) = I;
#! true
CoexponentialOnObjects( D, B ) = C;
#! true
CoexponentialOnObjects( C, D ) = I;
#! true
CoexponentialOnObjects( D, C ) = B;
#! true
#! @EndExample
