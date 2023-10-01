#! @Chunk CocartesianBraiding

#! @Example
LoadPackage( "FiniteCocompletions" );
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
UC := FiniteStrictCoproductCompletion( C );
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
a := UC.a;
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
b := UC.b;
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
ab := Coproduct( a, b );
#! <An object in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ab );
#! [ 2, [ C.a, C.b ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! given by the above data
ba := Coproduct( b, a );
#! <An object in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ba );
#! [ 2, [ C.b, C.a ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! given by the above data
HomStructure( ab, ba );
#! |1|
hom := MorphismsOfExternalHom( ab, ba );
#! [ <A morphism in FiniteStrictCoproductCompletion(
#!    FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )> ]
gamma := hom[1];
#! <A morphism in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Source( gamma ) = ab;
#! true
Range( gamma ) = ba;
#! true
IsWellDefined( gamma );
#! true
Display( gamma );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
#! 
#! [ (a)-[(a)]->(a), (b)-[(b)]->(b) ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! given by the above data
LUC := LazyCategory( UC );
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
F := PreCompose( EmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCompletion( F );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory( FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Ggamma := G( gamma );
#! <A morphism in LazyCategory(
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )>
IsWellDefined( Ggamma );
#! true
#! @EndExample
