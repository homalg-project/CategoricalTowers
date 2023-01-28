#! @Chunk ConvertToMapOfFinSets

LoadPackage( "CatReps" );

#! @Example
c3c3 := ConcreteCategory([[2,3,1],[4,5,6],[,,,5,6,4]]);
#! rec( codomain := [ 1, 2, 2 ], domain := [ 1, 1, 2 ],
#!      generators := [ [ 2, 3, 1 ], [ 4, 5, 6 ], [ ,,, 5, 6, 4 ] ],
#!      objects := [ [ 1, 2, 3 ], [ 4, 5, 6 ] ], operations := rec(  ) )
objects := List( c3c3.objects, FinSet );
#! [ <An object in FinSets>, <An object in FinSets> ]
g1 := ConvertToMapOfFinSets( objects, c3c3.generators[1] );
#! <A morphism in FinSets>
Display( g1 );
#! [ [ 1, 2, 3 ], [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ], [ 1, 2, 3 ] ]
g2 := ConvertToMapOfFinSets( objects, c3c3.generators[2] );
#! <A morphism in FinSets>
Display( g2 );
#! [ [ 1, 2, 3 ], [ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ], [ 4, 5, 6 ] ]
g3 := ConvertToMapOfFinSets( objects, c3c3.generators[3] );
#! <A morphism in FinSets>
Display( g3 );
#! [ [ 4, 5, 6 ], [ [ 4, 5 ], [ 5, 6 ], [ 6, 4 ] ], [ 4, 5, 6 ] ]
g := ConvertToMapOfFinSets( objects, [,,,1,1,1] );
#! <A morphism in FinSets>
Display( g );
#! [ [ 4, 5, 6 ], [ [ 4, 1 ], [ 5, 1 ], [ 6, 1 ] ], [ 1, 2, 3 ] ]
#! @EndExample

