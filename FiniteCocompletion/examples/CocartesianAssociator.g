#! @Chunk CocartesianAssociator

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
LoadPackage( "LazyCategories", ">= 2023.01-02" );
#! true
Q := RightQuiver( "Q(a,b,c)[]" );
#! Q(a,b,c)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
Fam := FiniteStrictCoproductCocompletion( C );
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
a := Fam.a;
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
b := Fam.b;
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
c := Fam.c;
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
ab_c := Coproduct( Coproduct( a, b ), c );
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
a_bc := Coproduct( a, Coproduct( b, c ) );
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
ab_c = a_bc;
#! true
hom := HomStructure( ab_c, a_bc );
#! |1|
g := ExactCoverWithGlobalElements( hom );
#! [ |1| → |1| ]
IsOne( g[1] );
#! true
alpha := HomStructure( ab_c, a_bc, g[1] );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
IsOne( alpha );
#! true
alpha = CocartesianAssociatorLeftToRight( a, b, c );
#! true
LFam := LazyCategory( Fam );
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LFam );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
F := PreCompose( YonedaEmbeddingOfUnderlyingCategory( Fam ), Emb );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCocompletion( F );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) )
Galpha := G( alpha );
#! <A morphism in LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
IsWellDefined( Galpha );
#! true
#! @EndExample
