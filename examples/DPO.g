#! @Chunk DPO

#! Double pushout in the slice category of <C>SkeletalFinSets</C>
#! over its subobject classifier.

#! @Example
LoadPackage( "SubcategoriesForCAP" );
#! true
omega := SubobjectClassifier( SkeletalFinSets );
#! |2|
S := SliceCategory( omega );
#! A slice category of SkeletalFinSets
k := omega;
#! |2|
K := MapOfFinSets( k, [ 1, 0 ], omega ) / S;
#! An object in the slice category given by: |2| → |2|
l := FinSet( 6 );
#! |6|
L := MapOfFinSets( l, [ 1, 0, 1, 0, 0, 1 ], omega ) / S;
#! An object in the slice category given by: |6| → |2|
r := FinSet( 7 );
#! |7|
R := MapOfFinSets( r, [ 1, 0, 0, 1, 1, 0, 0 ], omega ) / S;
#! An object in the slice category given by: |7| → |2|
lambda := AsSliceCategoryCell( K, MapOfFinSets( k, [ 0, 1 ], l ), L );
#! A morphism in the slice category given by: |2| → |6|
rho := AsSliceCategoryCell( K, MapOfFinSets( k, [ 0, 1 ], r ), R );
#! A morphism in the slice category given by: |2| → |7|
g := FinSet( 8 );
#! |8|
G := MapOfFinSets( g, [ 1, 0, 1, 0, 0, 1, 1, 1 ], omega ) / S;
#! An object in the slice category given by: |8| → |2|
mu := AsSliceCategoryCell( L, MapOfFinSets( l, [ 0, 1, 2, 3, 4, 5 ], g ), G );
#! A morphism in the slice category given by: |6| → |8|
poc := PushoutComplement( lambda, mu );
#! A morphism in the slice category given by: |4| → |8|
Display( poc );
#! { 0,..., 3 } ⱶ[ 0, 1, 6, 7 ]→ { 0,..., 7 }
#! 
#! A morphism in the slice category given by the above data
Display( Source( poc ) );
#! { 0,..., 3 } ⱶ[ 1, 0, 1, 1 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
dpo := DPO( mu, lambda, rho );
#! [ A morphism in the slice category given by: |4| → |9|,
#!   A morphism in the slice category given by: |7| → |9| ]
Display( dpo[1] );
#! { 0,..., 3 } ⱶ[ 0, 1, 2, 3 ]→ { 0,..., 8 }
#! 
#! A morphism in the slice category given by the above data
Display( dpo[2] );
#! { 0,..., 6 } ⱶ[ 0, 1, 4, 5, 6, 7, 8 ]→ { 0,..., 8 }
#! 
#! A morphism in the slice category given by the above data
Display( Range( dpo[1] ) );
#! { 0,..., 8 } ⱶ[ 1, 0, 1, 1, 0, 1, 1, 0, 0 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
#! @EndExample
