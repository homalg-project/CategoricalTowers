#! @Chunk CocartesianBraiding

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
UC := FiniteStrictCoproductCocompletion( C );
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
a := UC.a;
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
b := UC.b;
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
ab := Coproduct( a, b );
#! <An object in
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ab );
#! [ C.a, C.b ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
ba := Coproduct( b, a );
#! <An object in
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ba );
#! [ C.b, C.a ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
hom := HomStructure( ab, ba );
#! |1|
g := ExactCoverWithGlobalElements( hom );
#! [ |1| → |1| ]
IsOne( g[1] );
#! true
gamma := CocartesianBraiding( a, b );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
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
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! with the above associated map
LUC := LazyCategory( UC );
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
F := PreCompose( YonedaEmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCocompletion( F );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory( FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Ggamma := G( gamma );
#! <A morphism in LazyCategory(
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )>
IsWellDefined( Ggamma );
#! true
#! @EndExample
