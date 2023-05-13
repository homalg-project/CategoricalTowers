gap> LoadPackage( "FiniteCocompletion", false );
true
gap> LoadPackage( "FinSetsForCAP", false );
true
gap> LoadPackage( "LazyCategories", false );
true

#
gap> START_TEST( "cartesian" );

gap> C := SkeletalFinSets;
SkeletalFinSets
gap> L := LazyCategory( C );
LazyCategory( SkeletalFinSets )
gap> UL := FiniteStrictCoproductCocompletion( L );
FiniteStrictCoproductCocompletion( LazyCategory( SkeletalFinSets ) )

#
gap> m := 3;
3
gap> n := 4;
4

#
gap> o1 := Pair( m, List( [ 0 .. m - 1 ], i -> i / C / L ) ) / UL;
<An object in FiniteStrictCoproductCocompletion( LazyCategory( SkeletalFinSets ) )>
gap> o2 := Pair( n, List( [ 0 .. n - 1 ], i -> i / C / L ) ) / UL;
<An object in FiniteStrictCoproductCocompletion( LazyCategory( SkeletalFinSets ) )>

#
gap> o12 := DirectProduct( o1, o2 );
<An object in FiniteStrictCoproductCocompletion( LazyCategory( SkeletalFinSets ) )>

#
gap> Display( List( ObjectDatum( o12 )[2], d -> List( GenesisOfCellArguments( d ), a -> List( EvaluatedCell( a ), Length ) )[1] ) );
[ [  0,  0 ],
  [  1,  0 ],
  [  2,  0 ],
  [  0,  1 ],
  [  1,  1 ],
  [  2,  1 ],
  [  0,  2 ],
  [  1,  2 ],
  [  2,  2 ],
  [  0,  3 ],
  [  1,  3 ],
  [  2,  3 ] ]

#
gap> STOP_TEST( "cartesian" );
