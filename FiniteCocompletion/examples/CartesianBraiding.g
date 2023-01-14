#! @Chunk CartesianBraiding

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
LoadPackage( "LazyCategories", ">= 2023.01-02" );
#! true
Q := RightQuiver( "Q(a,b)[]" );
#! Q(a,b)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) )
SetName( C.a, "C.a" ); SetName( C.b, "C.b" );
PC := FiniteStrictProductCompletion( C );
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
ModelingCategory( PC );
#! Opposite( FiniteStrictCoproductCocompletion( Opposite(
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) ) )
a := PC.a;
#! <An object in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
b := PC.b;
#! <An object in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
ab := DirectProduct( a, b );
#! <An object in
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ab );
#! [ 2, [ C.a, C.b ] ]
#! 
#! An object in the finite product completion category given by the above data
ba := DirectProduct( b, a );
#! <An object in
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ba );
#! [ 2, [ C.b, C.a ] ]
#! 
#! An object in the finite product completion category given by the above data
HomStructure( ab, ba );
#! |1|
hom := MorphismsOfExternalHom( ab, ba );
#! [ <A morphism in
#!    FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )> ]
gamma := hom[1];
#! <A morphism in
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Source( gamma ) = ab;
#! true
Range( gamma ) = ba;
#! true
IsWellDefined( gamma );
#! true
Display( gamma );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! with the above associated map
gamma = CartesianBraiding( a, b );
#! true
LPC := LazyCategory( PC );
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LPC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
F := PreCompose( CoYonedaEmbeddingOfUnderlyingCategory( PC ), Emb );
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictProductCompletion( F );
#! Extension to FiniteStrictProductCompletion( Source(
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictProductCompletion( Source(
#! Precomposition of CoYoneda embedding functor and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Ggamma := G( gamma );
#! <A morphism in LazyCategory(
#!  FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )>
IsWellDefined( Ggamma );
#! true
#! @EndExample
