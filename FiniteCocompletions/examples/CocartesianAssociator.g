#! @Chunk CocartesianAssociator

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
LoadPackage( "Algebroids" );
#! true
LoadPackage( "LazyCategories", ">= 2023.01-02" );
#! true
Q := RightQuiver( "Q(a,b,c)[]" );
#! Q(a,b,c)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
UC := FiniteStrictCoproductCompletion( C );
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
a := UC.a;
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
b := UC.b;
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
c := UC.c;
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
ab_c := Coproduct( Coproduct( a, b ), c );
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
a_bc := Coproduct( a, Coproduct( b, c ) );
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
ab_c = a_bc;
#! true
HomStructure( ab_c, a_bc );
#! |1|
hom := MorphismsOfExternalHom( ab_c, a_bc );
#! [ <A morphism in FiniteStrictCoproductCompletion(
#!    FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )> ]
alpha := hom[1];
#! <A morphism in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
Source( alpha ) = ab_c;
#! true
IsOne( alpha );
#! true
IsWellDefined( alpha );
#! true
alpha = CocartesianAssociatorLeftToRight( a, b, c );
#! true
LUC := LazyCategory( UC );
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
F := PreCompose( EmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCompletion( F );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
#!   |
#!   V
#! LazyCategory( FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
Galpha := G( alpha );
#! <A morphism in LazyCategory( FiniteStrictCoproductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
IsWellDefined( Galpha );
#! true
#! @EndExample
