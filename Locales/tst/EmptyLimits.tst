gap> START_TEST("NormalizeObject.tst");

gap> LoadPackage( "ZariskiFrames", false );
true
gap> zz := HomalgRingOfIntegers( );
Z
gap> ZC := ZariskiCoframeOfAffineSpectrum( zz );
The coframe of Zariski closed subsets of the affine spectrum of Z
gap> BS := BooleanAlgebraOfConstructibleObjectsAsUnionOfDifferences( ZC );
The Boolean algebra of constructible objects as unions of formal single differences of The coframe of Zariski closed subsets of the affine spectrum of Z
gap> tS := DirectProduct( BS, [ ] );
( V_{Z}( I1 ) \ V_{Z}( J1 ) )
gap> Display( tS );
( V( <> )

\ ∅ )
gap> IsTerminal( tS );
true
gap> iS := Coproduct( BS, [ ] );
∅
gap> Display( iS );
( ∅

\ ∅ )
gap> IsInitial( iS );
true
gap> BM := BooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences( ZC );
The Boolean algebra of constructible objects as unions of formal multiple differences of The coframe of Zariski closed subsets of the affine spectrum of Z
gap> tM := DirectProduct( BM, [ ] );
( V_{Z}( I1 ) \ V_{Z}( J1_1 ) )
gap> Display( tM );
( V( <> )

\ ∅ )
gap> IsTerminal( tM );
true
gap> iM := Coproduct( BM, [ ] );
∅
gap> Display( iM );
( ∅

\ ∅ )
gap> IsInitial( iM );
true
gap> STOP_TEST("NormalizeObject.tst");
