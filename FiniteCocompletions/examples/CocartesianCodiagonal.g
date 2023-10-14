#! @Chunk CocartesianCodiagonal

#! @Example
LoadPackage( "FiniteCocompletions" );
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
UC := FiniteStrictCoproductCompletion( C );
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
a := UC.a;
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
aa := Coproduct( a, a );
#! <An object in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Display( aa );
#! [ 2, [ C.a, C.a ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#! given by the above data
a = aa;
#! false
HomStructure( a, aa );
#! |2|
hom_a_aa := MorphismsOfExternalHom( a, aa );
#! [ <A morphism in
#!    FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )> ]
hom_a_aa[1] = InjectionOfCofactorOfCoproduct( [ a, a ], 1 );
#! true
hom_a_aa[2] = InjectionOfCofactorOfCoproduct( [ a, a ], 2 );
#! true
HomStructure( aa, a );
#! |1|
hom_aa_a := MorphismsOfExternalHom( aa, a );
#! [ <A morphism in
#!    FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )> ]
delta := hom_aa_a[1];
#! <A morphism in
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Source( delta ) = aa;
#! true
Target( delta ) = a;
#! true
IsOne( ComponentOfMorphismFromCoproduct( delta, [ a, a ], 1 ) );
#! true
IsOne( ComponentOfMorphismFromCoproduct( delta, [ a, a ], 2 ) );
#! true
IsWellDefined( delta );
#! true
Display( delta );
#! { 0, 1 } ⱶ[ 0, 0 ]→ { 0 }
#! 
#! [ (a)-[(a)]->(a), (a)-[(a)]->(a) ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#! given by the above data
id_a := IdentityMorphism( C.a );
#! (a)-[(a)]->(a)
delta = CocartesianCodiagonal( a, 2 );
#! true
LUC := LazyCategory( UC );
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
F := PreCompose( EmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCompletion( F );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
Gdelta := G( delta );
#! <A morphism in LazyCategory(
#!  FiniteStrictCoproductCompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )>
IsWellDefined( Gdelta );
#! true
#! @EndExample
