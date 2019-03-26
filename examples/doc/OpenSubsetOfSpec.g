#! @System OpenSubsetOfSpec

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( ZZ );
#! The frame of Zariski open subsets of the affine spectrum of Z
A := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 2 ], 1, 1, ZZ ) );
#! D_{Z}( <...> )
B := OpenSubsetOfSpec( HomalgMatrix( [ 12,20 ], 2, 1, ZZ ) );
#! D_{Z}( <...> )
C := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 3 ], 1, 1, ZZ ) );
#! D_{Z}( <...> )
D := OpenSubsetOfSpec( HomalgMatrix( [ 12 ], 1, 1, ZZ ) );
#! D_{Z}( <...> )
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
IsSubset( A, D );
#! true
IsIsomorphism( embDA );
#! false
embAD := UniqueMorphism( A, D );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAD );
#! false
IsSubset( D, A );
#! false
T := TerminalObject( ZF );
#! D_{Z}( <...> )
Display( T );
#! D( <1> )
I := InitialObject( ZF );
#! D_{Z}( <...> )
Display( I );
#! ∅
AvC := Coproduct( A, C );
#! D_{Z}( <...> )
Display( AvC );
#! D( <1> )
Coproduct( A, C ) = T;
#! true
AC := DirectProduct( A, C );
#! D_{Z}( <...> )
Display( AC );
#! D( <-6> )
StandardMorphismOfUnderlyingCategory( AC );
#! <A morphism in Rows( Z )>
Display( AC );
#! D( <6> )
ExponentialOnObjects( I, T ) = T;
#! true
ExponentialOnObjects( A, T ) = T;
#! true
ExponentialOnObjects( T, T ) = T;
#! true
ExponentialOnObjects( T, A ) = A;
#! true
ExponentialOnObjects( T, I ) = I;
#! true
ExponentialOnObjects( A, I ) = I;
#! true
ExponentialOnObjects( I, I ) = T;
#! true
ExponentialOnObjects( D, B ) = T;
#! true
ExponentialOnObjects( B, D ) = C;
#! true
ExponentialOnObjects( D, C ) = T;
#! true
ExponentialOnObjects( C, D ) = B;
#! true
IsWellDefined( CartesianEvaluationMorphism( A, C ) );
#! true
IsIsomorphism( CartesianEvaluationMorphism( A, C ) );
#! false
IsWellDefined( CartesianEvaluationMorphism( C, A ) );
#! true
IsIsomorphism( CartesianEvaluationMorphism( C, A ) );
#! false
IsWellDefined( CartesianCoevaluationMorphism( A, D ) );
#! true
IsIsomorphism( CartesianCoevaluationMorphism( A, D ) );
#! false
IsWellDefined( CartesianCoevaluationMorphism( D, A ) );
#! true
IsIsomorphism( CartesianCoevaluationMorphism( D, A ) );
#! false
th := UniqueMorphism( DirectProduct( A, C ), C );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( th );
#! true
th := DirectProductToExponentialAdjunctionMap( A, C, th );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( th );
#! true
IsIsomorphism( th );
#! false
ht := UniqueMorphism( A, ExponentialOnObjects( D, B ) );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( ht );
#! true
ht := ExponentialToDirectProductAdjunctionMap( D, B, ht );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( ht );
#! true
IsIsomorphism( ht );
#! false
IsWellDefined( CartesianPreComposeMorphism( A, C, D ) );
#! true
IsIsomorphism( CartesianPreComposeMorphism( A, C, D ) );
#! false
#! @EndExample
