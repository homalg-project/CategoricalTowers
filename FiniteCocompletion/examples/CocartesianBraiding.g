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
Fam := FiniteCoproductCocompletion( C );
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
a := Fam.a;
#! <An object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
b := Fam.b;
#! <An object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
ab := Coproduct( a, b );
#! <An object in
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ab );
#! [ C.a, C.b ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
ba := Coproduct( b, a );
#! <An object in
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
Display( ba );
#! [ C.b, C.a ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
HomStructure( ab, ba );
#! |1|
gamma := CocartesianBraiding( a, b );
#! <A morphism
#!  in FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
IsWellDefined( gamma );
#! true
Display( gamma );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! with the above associated map
Source( gamma ) = ab;
#! true
Range( gamma ) = ba;
#! true
LFam := LazyCategory( Fam );
#! LazyCategory(
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LFam );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
F := PreCompose( YonedaEmbeddingOfUnderlyingCategory( Fam ), Emb );
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
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )
G := ExtendFunctorToFiniteCoproductCocompletion( F );
#! Extension to FiniteCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) )
Ggamma := G( gamma );
#! <A morphism in LazyCategory(
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) ) )>
IsWellDefined( Ggamma );
#! true
#! @EndExample
