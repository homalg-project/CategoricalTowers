#! @Chunk ConcreteCategoryForCAP

LoadPackage( "CatReps" );

#! @Example
c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
objects := SetOfObjects( c3c3 );
#! [ An object in subcategory given by: <An object in FinSets>,
#!   An object in subcategory given by: <An object in FinSets> ]
Perform( objects, Display );
#! [ 1, 2, 3 ]
#!
#! An object in subcategory given by the above data
#! [ 4, 5, 6 ]
#! 
#! An object in subcategory given by the above data
gmorphisms := SetOfGeneratingMorphisms( c3c3 );
#! [ A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets> ]
Perform( gmorphisms, Display );
#! [ [ 1, 2, 3 ], [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ], [ 1, 2, 3 ] ]
#!
#! A morphism in subcategory given by the above data
#! [ [ 1, 2, 3 ], [ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ], [ 4, 5, 6 ] ]
#!
#! A morphism in subcategory given by the above data
#! [ [ 4, 5, 6 ], [ [ 4, 5 ], [ 5, 6 ], [ 6, 4 ] ], [ 4, 5, 6 ] ]
#!
#! A morphism in subcategory given by the above data
#! @EndExample
