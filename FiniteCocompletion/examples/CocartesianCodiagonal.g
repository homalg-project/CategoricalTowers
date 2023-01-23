#! @Chunk CocartesianCodiagonal

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
UC := FiniteStrictCoproductCocompletion( C );
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
a := UC.a;
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
aa := Coproduct( a, a );
#! <An object in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Display( aa );
#! [ 2, [ C.a, C.a ] ]
#! 
#! An object in
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#! given by the above data
a = aa;
#! false
HomStructure( a, aa );
#! |2|
hom_a_aa := MorphismsOfExternalHom( a, aa );
#! [ <A morphism in
#!    FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )> ]
hom_a_aa[1] = InjectionOfCofactorOfCoproduct( [ a, a ], 1 );
#! true
hom_a_aa[2] = InjectionOfCofactorOfCoproduct( [ a, a ], 2 );
#! true
HomStructure( aa, a );
#! |1|
hom_aa_a := MorphismsOfExternalHom( aa, a );
#! [ <A morphism in
#!    FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )> ]
delta := hom_aa_a[1];
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )>
Source( delta ) = aa;
#! true
Range( delta ) = a;
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
#! A morphism in
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#! with the above associated map
id_a := IdentityMorphism( C.a );
#! (a)-[(a)]->(a)
delta = CocartesianCodiagonal( a, 2 );
#! true
LUC := LazyCategory( UC );
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
F := PreCompose( YonedaEmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(a)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCocompletion( F );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )
Gdelta := G( delta );
#! <A morphism in LazyCategory(
#!  FiniteStrictCoproductCocompletion( FreeCategory( RightQuiver( "Q(a)[]" ) ) ) )>
IsWellDefined( Gdelta );
#! true
#! @EndExample
