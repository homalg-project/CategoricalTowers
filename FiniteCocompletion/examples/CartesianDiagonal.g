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
ModelingCategory( PC );
#! Opposite( FiniteStrictCoproductCocompletion( Opposite(
#! FreeCategory( RightQuiver( "Q(a)[]" ) ) ) ) )
a := PC.a;
#! <An object in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
aa := DirectProduct( a, a );
#! <An object in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Display( aa );
#! [ 2, [ C.a, C.a ] ]
#! 
#! An object in
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#! given by the above data
a = aa;
#! false
HomStructure( aa, a );
#! |2|
hom_aa_a := MorphismsOfExternalHom( aa, a );
#! [ <A morphism in
#!    FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>,
#!   <A morphism in
#!    FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )> ]
hom_aa_a[1] = ProjectionInFactorOfDirectProduct( [ a, a ], 1 );
#! true
hom_aa_a[2] = ProjectionInFactorOfDirectProduct( [ a, a ], 2 );
#! true
HomStructure( a, aa );
#! |1|
hom_a_aa := MorphismsOfExternalHom( a, aa );
#! [ <A morphism in
#!    FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )> ]
delta := hom_a_aa[1];
#! <A morphism in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Source( delta ) = a;
#! true
Range( delta ) = aa;
#! true
IsOne( ComponentOfMorphismIntoDirectProduct( delta, [ a, a ], 1 ) );
#! true
IsOne( ComponentOfMorphismIntoDirectProduct( delta, [ a, a ], 2 ) );
#! true
IsWellDefined( delta );
#! true
Display( delta );
#! { 0, 1 } ⱶ[ 0, 0 ]→ { 0 }
#! 
#! [ (a)-[(a)]->(a), (a)-[(a)]->(a) ]
#! 
#! A morphism in
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#! given by the above data
id_a := IdentityMorphism( C.a );
#! (a)-[(a)]->(a)
delta = CartesianDiagonal( a, 2 );
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
Display( G );
#! Extension to FiniteStrictProductCompletion( Source(
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
Gdelta := G( delta );
#! <A morphism in LazyCategory(
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )>
IsWellDefined( Gdelta );
#! true
#! @EndExample
