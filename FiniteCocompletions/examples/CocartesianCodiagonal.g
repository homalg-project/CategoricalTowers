#! @Chunk CocartesianCodiagonal

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
LoadPackage( "Algebroids" );
#! true
LoadPackage( "LazyCategories", ">= 2023.01-02" );
#! true
Q := FinQuiver( "Q(a)[]" );
#! FinQuiver( "Q(a)[]" )
C := PathCategory( Q );
#! PathCategory( FinQuiver( "Q(a)[]" ) )
SetName( C.a, "C.a" );
UC := FiniteStrictCoproductCompletion( C );
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
a := UC.a;
#! <An object in
#!  FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>
aa := Coproduct( a, a );
#! <An object in
#!  FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>
Display( aa );
#! [ 2, [ C.a, C.a ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#! given by the above data
a = aa;
#! false
HomStructure( a, aa );
#! |2|
hom_a_aa := MorphismsOfExternalHom( a, aa );
#! [ <A morphism in
#!    FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )> ]
hom_a_aa[1] = InjectionOfCofactorOfCoproduct( [ a, a ], 1 );
#! true
hom_a_aa[2] = InjectionOfCofactorOfCoproduct( [ a, a ], 2 );
#! true
HomStructure( aa, a );
#! |1|
hom_aa_a := MorphismsOfExternalHom( aa, a );
#! [ <A morphism in
#!    FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )> ]
delta := hom_aa_a[1];
#! <A morphism in
#!  FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>
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
#! [ id(a):C.a → C.a, id(a):C.a → C.a ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#! given by the above data
id_a := IdentityMorphism( C.a );
#! id(a):C.a → C.a
delta = CocartesianCodiagonal( a, 2 );
#! true
CellAsEvaluatableString( delta, [ "C", "UC" ] );
#! "MorphismConstructor( UC,
#!         ObjectConstructor( UC,
#!                 Pair( 2,
#!                       [ ObjectConstructor( C, 1 ),
#!                         ObjectConstructor( C, 1 ) ] ) ),
#!         Pair( [ 0, 0 ],
#!               [ IdentityMorphism( C, ObjectConstructor( C, 1 ) ),
#!                 IdentityMorphism( C, ObjectConstructor( C, 1 ) ) ] ),
#!         ObjectConstructor( UC,
#!                 Pair( 1, [ ObjectConstructor( C, 1 ) ] ) ) )"
LUC := LazyCategory( UC );
#! LazyCategory(
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
F := PreCompose( EmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category:
#! 
#! PathCategory( FinQuiver( "Q(a)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCompletion( F );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict coproduct cocompletion category and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
Gdelta := G( delta );
#! <A morphism in LazyCategory(
#!  FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )>
IsWellDefined( Gdelta );
#! true
#! @EndExample
