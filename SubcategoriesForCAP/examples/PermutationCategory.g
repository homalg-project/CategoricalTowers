#! @Chapter Category of permutations
#! @Section Examples and Tests

#! @Example
LoadPackage( "SubcategoriesForCAP", true );
#! true

cp := PermutationCategory( : no_precompiled_code := true );;

Q := HomalgFieldOfRationals();;
rows := CategoryOfRows( Q );;
F := EmbeddingOfPermutationCategoryIntoCategoryOfRows( cp, rows );;

o0 := ObjectConstructor( cp, 0 );;
o1 := ObjectConstructor( cp, 1 );;
o2 := ObjectConstructor( cp, 2 );;
o4 := ObjectConstructor( cp, 4 );;
o5 := ObjectConstructor( cp, 5 );;
o10 := ObjectConstructor( cp, 10 );;

mor_0 := MorphismConstructor( cp, o0, (), o0 );;
mor_1 := MorphismConstructor( cp, o1, (), o1 );;
mor_4_31 := MorphismConstructor( cp, o4, (3,1), o4 );;
mor_4_23 := MorphismConstructor( cp, o4, (2,3), o4 );;
mor_5_2415 := MorphismConstructor( cp, o5, (2,4,1,5), o5 );;
mor_5_25 := MorphismConstructor( cp, o5, (2,5), o5 );;
mor_5_0 := MorphismConstructor( cp, o5, (), o5 );;

Cardinality( o0 );
#! 0
Cardinality( o4 );
#! 4
Cardinality( o5 );
#! 5
UnderlyingPermutation( mor_0 );
#! ()
UnderlyingPermutation( mor_4_31 );
#! (1,3)
UnderlyingPermutation( mor_5_2415 );
#! (1,5,2,4)

IsWellDefinedForObjects( o5 );
#! true
IsWellDefinedForMorphisms( mor_0 );
#! true
IsWellDefinedForMorphisms( mor_4_31 );
#! true
IsWellDefinedForMorphisms( mor_5_2415 );
#! true

id_o0 := IdentityMorphism( o0 );;
id_o1 := IdentityMorphism( o1 );;
id_o2 := IdentityMorphism( o2 );;
id_o5 := IdentityMorphism( o5 );;

IsWellDefinedForMorphisms( id_o0 );
#! true
IsWellDefinedForMorphisms( id_o5 );
#! true

IsEqualForObjects( o0, o0 );
#! true
IsEqualForObjects( o4, o4 );
#! true
IsEqualForObjects( o5, o5 );
#! true
IsEqualForObjects( o4, o5 );
#! false
IsEqualForObjects( o0, o5 );
#! false

IsEqualForMorphisms( mor_0, mor_0 );
#! true
IsEqualForMorphisms( mor_4_31, mor_4_31 );
#! true
IsEqualForMorphisms( mor_5_2415, mor_5_2415 );
#! true
IsEqualForMorphisms( mor_4_31, mor_4_23 );
#! false
IsEqualForMorphisms( mor_5_2415, mor_5_0 );
#! false

UnderlyingPermutation( PreCompose( mor_4_23, mor_4_31 ) );
#! (1,3,2)
UnderlyingPermutation( PreCompose( mor_4_31, mor_4_23 ) );
#! (1,2,3)

UnderlyingPermutation( InverseForMorphisms( mor_0 ) );
#! ()
UnderlyingPermutation( InverseForMorphisms( mor_4_31 ) );
#! (1,3)
UnderlyingPermutation( InverseForMorphisms( mor_5_2415 ) );
#! (1,4,2,5)

Cardinality( Coproduct( o2, o4 ) );
#! 6
Cardinality( Coproduct( o1, o4 ) );
#! 5
Cardinality( Coproduct( o2, o0 ) );
#! 2
Cardinality( Coproduct( o0, o0 ) );
#! 0

mor := CoproductFunctorial( [ mor_4_31, id_o2 ] );;
m1 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_4_31 ), 4 ), Q );;
m2 := HomalgMatrix( PermutationMat( UnderlyingPermutation( id_o2 ), 2 ), Q );;
DiagMat( [ m1, m2 ] ) = HomalgMatrix( PermutationMat( UnderlyingPermutation( mor ), 6 ), Q );
#! true

mor := CoproductFunctorial( [ mor_4_23, mor_5_25 ] );;
m1 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_4_23 ), 4 ), Q );;
m2 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_5_25 ), 5 ), Q );;
DiagMat( [ m1, m2 ] ) = HomalgMatrix( PermutationMat( UnderlyingPermutation( mor ), 9 ) , Q );
#! true

mor := CoproductFunctorial( [ mor_1, mor_5_25 ] );;
m1 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_1 ), 1 ), Q );;
m2 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_5_25 ), 5 ), Q );;
DiagMat( [ m1, m2 ] ) = HomalgMatrix( PermutationMat( UnderlyingPermutation( mor ), 6 ) , Q );
#! true

mor := CoproductFunctorial( [ mor_5_25, mor_1 ] );;
m1 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_5_25 ), 5 ), Q );;
m2 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_1 ), 1 ), Q );;
DiagMat( [ m1, m2 ] ) = HomalgMatrix( PermutationMat( UnderlyingPermutation( mor ), 6), Q );
#! true

mor := CoproductFunctorial( [ mor_0, mor_0 ] );;
m1 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_0 ), 0 ), Q );;
m2 := HomalgMatrix( PermutationMat( UnderlyingPermutation( mor_0 ), 0 ), Q );;
DiagMat( [ m1, m2 ] ) = HomalgMatrix( PermutationMat( UnderlyingPermutation( mor ), 0), Q );
#! true

Cardinality( TensorProductOnObjects( o2, o4 ) );
#! 8
Cardinality( TensorProductOnObjects( o1, o4 ) );
#! 4
Cardinality( TensorProductOnObjects( o2, o0 ) );
#! 0

mor := TensorProductOnMorphisms( id_o5, id_o2 );;
m1 := PermutationMat( UnderlyingPermutation( id_o5 ), 5 );;
m2 := PermutationMat( UnderlyingPermutation( id_o2 ), 2 );;
KroneckerProduct( m1, m2 ) = PermutationMat( UnderlyingPermutation( mor ), 10 );
#! true
IsEqualForMorphisms( mor, IdentityMorphism( ObjectConstructor( cp, 10 ) ) );
#! true

mor := TensorProductOnMorphisms( mor_4_31, id_o2 );;
m1 := PermutationMat( UnderlyingPermutation( mor_4_31 ), 4 );;
m2 := PermutationMat( UnderlyingPermutation( id_o2 ), 2 );;
KroneckerProduct( m1, m2 ) = PermutationMat( UnderlyingPermutation( mor ), 8 );
#! true

mor := TensorProductOnMorphisms( mor_4_23, mor_5_25 );;
m1 := PermutationMat( UnderlyingPermutation( mor_4_23 ), 4 );;
m2 := PermutationMat( UnderlyingPermutation( mor_5_25 ), 5 );;
KroneckerProduct( m1, m2 ) = PermutationMat( UnderlyingPermutation( mor ), 20 );
#! true

mor := TensorProductOnMorphisms( mor_1, mor_5_25 );;
m1 := PermutationMat( UnderlyingPermutation( mor_1 ), 1 );;
m2 := PermutationMat( UnderlyingPermutation( mor_5_25 ), 5 );;
KroneckerProduct( m1, m2 ) = PermutationMat( UnderlyingPermutation( mor ), 5 );
#! true

mor := TensorProductOnMorphisms( mor_5_25, mor_1 );;
m1 := PermutationMat( UnderlyingPermutation( mor_5_25 ), 5 );;
m2 := PermutationMat( UnderlyingPermutation( mor_1 ), 1 );;
KroneckerProduct( m1, m2 ) = PermutationMat( UnderlyingPermutation( mor ), 5 );
#! true

Display( ApplyFunctor( F, o0 ) );
#! A row module over Q of rank 0
Display( ApplyFunctor( F, o1 ) );
#! A row module over Q of rank 1
Display( ApplyFunctor( F, o4 ) );
#! A row module over Q of rank 4
Display( ApplyFunctor( F, o5 ) );
#! A row module over Q of rank 5
Display( ApplyFunctor( F, mor ) );
#! Source: 
#! A row module over Q of rank 5
#! 
#! Matrix: 
#! [ [  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1 ],
#!   [  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  1,  0 ],
#!   [  0,  1,  0,  0,  0 ] ]
#! 
#! Range: 
#! A row module over Q of rank 5
#! 
#! A morphism in Rows( Q )

o5o2 := TensorProductOnObjects( o5, o2 );;
mor_5_25_times_id_o2 := TensorProductOnMorphismAndObjectWithGivenTensorProducts( cp, o5o2, mor_5_25, o2, o5o2 );;
IsEqualForMorphisms( mor_5_25_times_id_o2, TensorProductOnMorphisms( mor_5_25, id_o2 ) );
#! true
Display( mor_5_25_times_id_o2 );
#! 10 ⱶ(3,9)(4,10)→ 10
Display( TensorProductOnMorphisms( mor_5_25, id_o2 ) );
#! 10 ⱶ(3,9)(4,10)→ 10

id_o5_times_id_o2 := TensorProductOnMorphismAndObjectWithGivenTensorProducts( cp, o10, id_o5, o2, o10 );;
IsEqualForMorphisms( id_o5_times_id_o2, IdentityMorphism( o10 ) );
#! true

id_o2_times_mor_5_25 := TensorProductOnObjectAndMorphismWithGivenTensorProducts( cp, o5o2, o2, mor_5_25, o5o2 );;
tp_mor := TensorProductOnMorphisms( id_o2, mor_5_25 );;
IsEqualForMorphisms( id_o2_times_mor_5_25, tp_mor );
#! true
Display( id_o2_times_mor_5_25 );
#! 10 ⱶ(2,5)(7,10)→ 10
Display( id_o2_times_mor_5_25 );
#! 10 ⱶ(2,5)(7,10)→ 10

id_o5_times_id_o2 := TensorProductOnObjectAndMorphismWithGivenTensorProducts( cp, o10, o5, id_o2, o10 );;
IsEqualForMorphisms( id_o5_times_id_o2, IdentityMorphism( o10 ) );
#! true

#! @EndExample
