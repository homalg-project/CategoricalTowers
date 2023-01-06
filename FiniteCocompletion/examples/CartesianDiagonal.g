#! @Chunk CartesianDiagonal

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
LoadPackage( "LazyCategories", ">= 2023.01-02" );
#! true
Q := RightQuiver( "Q(a)[]" );
#! Q(a)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a)[]" ) )
SetName( C.a, "C.a" );
PC := FiniteStrictProductCompletion( C );
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
a := PC.a;
#! <An object in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
aa := DirectProduct( a, a );
#! <An object in
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Display( aa );
#! [ C.a, C.a ]
#! 
#! An object in the finite product completion category given by the above data
a = aa;
#! false
HomStructure( aa, a );
#! |2|
HomStructure( a, aa );
#! |1|
id_a := IdentityMorphism( C.a );
#! (a)-[(a)]->(a)
delta := MorphismConstructor( a, Pair( [ 0, 0 ], [ id_a, id_a ] ), aa );
#! <A morphism in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
IsWellDefined( delta );
#! true
LPC := LazyCategory( PC );
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LPC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
F := PreCompose( CoYonedaEmbeddingOfUnderlyingCategory( PC ), Emb );
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictProductCompletion( F );
#! Extension to FiniteStrictProductCompletion( Source(
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category ) )
Gdelta := G( delta );
#! <A morphism in LazyCategory(
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )>
IsWellDefined( Gdelta );
#! true
#! @EndExample
