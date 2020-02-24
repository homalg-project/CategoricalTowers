#! @Chunk ConcreteCategoryForCAP

LoadPackage( "CatReps" );

#! @Example
c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
objects := SetOfObjects( c3c3 );
#! [ <An object in FinSets>, <An object in FinSets> ]
Perform( objects, Display );
#! [ 1, 2, 3 ]
#! [ 4, 5, 6 ]
SetOfGeneratingMorphisms( c3c3 );
#! [ <A morphism in FinSets>, <A morphism in FinSets>, <A morphism in FinSets> ]
gmorphisms := SetOfGeneratingMorphisms( c3c3 );
#! [ <A morphism in FinSets>, <A morphism in FinSets>, <A morphism in FinSets> ]
Perform( gmorphisms, Display );
#! [ [ 1, 2, 3 ], [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ], [ 1, 2, 3 ] ]
#! [ [ 1, 2, 3 ], [ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ], [ 4, 5, 6 ] ]
#! [ [ 4, 5, 6 ], [ [ 4, 5 ], [ 5, 6 ], [ 6, 4 ] ], [ 4, 5, 6 ] ]
#! @EndExample
