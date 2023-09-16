#! @Chunk ClosedSubsetOfSpecZ

LoadPackage( "ZariskiFrames" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
ZC := ZariskiCoframeOfAffineSpectrum( zz );
#! The coframe of Zariski closed subsets of the affine spectrum of Z
A := ClosedSubsetOfSpec( HomalgMatrix( [ 4 ], 1, 1, zz ) );
#! V_{Z}( <...> )
Display( A );
#! V( <4> )
B := ClosedSubsetOfSpec( "[ 12, 20 ]", zz );
#! V_{Z}( <...> )
C := ClosedSubsetOfSpecByRadicalColumn( "[ 3 ]", zz );
#! V_{Z}( <...> )
D := ClosedSubsetOfSpec( "[ 12 ]", zz );
#! V_{Z}( <...> )
A = B;
#! true
Display( A );
#! V( <2> )
A = C;
#! false
LCA := LocallyClosedPart( A );
#! V_{Z}( <...> )
Display( LCA );
#! V( <2> )
A = LCA;
#! true
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
#! ∅
A := ClosedSubsetOfSpec( "[ 4 ]", zz );
#! V_{Z}( <...> )
Display( A );
#! V( <4> )
AvC := Coproduct( A, C );
#! V_{Z}( <...> )
Display( AvC );
#! { V( <4> ) ∪ V( <3> ) }
StandardizeObject( AvC );
#! V_{Z}( <...> )
Display( AvC );
#! { V( <2> ) ∪ V( <3> ) }
AC := DirectProduct( A, C );
#! V_{Z}( <...> )
Display( AC );
#! V( <4,3> )
StandardizeObject( AC );
#! V_{Z}( <...> )
Display( AC );
#! ∅
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
p := AClosedSingleton( D );
#! V_{Z}( <...> )
Display( p );
#! V( <2> )
q := AClosedSingleton( D - p );
#! V_{Z}( <...> )
Display( q );
#! V( <3> )
p + q = D;
#! true
#! @EndExample
