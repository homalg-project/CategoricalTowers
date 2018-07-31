#! @System ZariskiClosedSubsetOfAffineSpectrum

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
A := ZariskiClosedSubsetOfAffineSpectrum( HomalgMatrix( [ 2 ], 1, 1, ZZ ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum of Z>
B := ZariskiClosedSubsetOfAffineSpectrum( HomalgMatrix( [4,6], 2, 1, ZZ ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum of Z>
C := ZariskiClosedSubsetOfAffineSpectrum( HomalgMatrix( [ 3 ], 1, 1, ZZ ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum of Z>
D := ZariskiClosedSubsetOfAffineSpectrum( HomalgMatrix( [ 6 ], 1, 1, ZZ ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum of Z>
A = B;
#! true
A = C;
#! false
embAC := MorphismOfZariskiClosedSubsets( A, C );
#! <A monomorphism in The coframe of Zariski closed subsets of the
#!  affine spectrum of Z>
IsWellDefined( embAC );
#! false
embAD := MorphismOfZariskiClosedSubsets( A, D );
#! <A monomorphism in The coframe of Zariski closed subsets of the
#!  affine spectrum of Z>
IsWellDefined( embAD );
#! true
IsIsomorphism( embAD );
#! false
embDA := MorphismOfZariskiClosedSubsets( D, A );
#! <A monomorphism in The coframe of Zariski closed subsets of the
#!  affine spectrum of Z>
IsWellDefined( embDA );
#! false
#! @EndExample
