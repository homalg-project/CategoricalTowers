#! @System OpenSubsetOfSpec

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( ZZ );
#! The frame of Zariski open subsets of the affine spectrum of Z
A := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 2 ], 1, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
B := OpenSubsetOfSpec( HomalgMatrix( [ 12,20 ], 2, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
C := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 3 ], 1, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
D := OpenSubsetOfSpec( HomalgMatrix( [ 12 ], 1, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
A = B;
#! true
A = C;
#! false
embAB := UniqueMorphism( A, B );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAB );
#! true
IsIsomorphism( embAB );
#! true
embAC := UniqueMorphism( A, C );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAC );
#! false
embDA := UniqueMorphism( D, A );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embDA );
#! true
IsIsomorphism( embDA );
#! false
embAD := UniqueMorphism( A, D );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAD );
#! false
T := TerminalObject( ZF );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( T );
#! [ [  1 ] ]
#! 
#! A morphism in Rows( Z )
I := InitialObject( ZF );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( I );
#! (an empty 0 x 1 matrix)
#! 
#! A morphism in Rows( Z )
AvC := Coproduct( A, C );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( AvC );
#! [ [  2 ],
#!   [  3 ] ]
#! A morphism in Rows( Z )
Coproduct( A, C ) = T;
#! true
AC := DirectProduct( A, C );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( AC );
#! [ [  -6 ] ]
#! 
#! A morphism in Rows( Z )
StandardMorphismOfUnderlyingCategory( AC );
#! <A morphism in Rows( Z )>
Display( AC );
#! [ [  6 ] ]
#! 
#! A morphism in Rows( Z )
InternalHomOnObjects( I, T ) = T;
#! true
InternalHomOnObjects( A, T ) = T;
#! true
InternalHomOnObjects( T, T ) = T;
#! true
InternalHomOnObjects( T, A ) = A;
#! true
InternalHomOnObjects( T, I ) = I;
#! true
InternalHomOnObjects( A, I ) = I;
#! true
InternalHomOnObjects( I, I ) = T;
#! true
InternalHomOnObjects( D, B ) = T;
#! true
InternalHomOnObjects( B, D ) = C;
#! true
InternalHomOnObjects( D, C ) = T;
#! true
InternalHomOnObjects( C, D ) = B;
#! true
#! @EndExample
