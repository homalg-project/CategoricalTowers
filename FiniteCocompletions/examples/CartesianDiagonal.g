#! @Chunk CartesianDiagonal

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
PC := FiniteStrictProductCompletion( C );
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
ModelingCategory( PC );
#! Opposite( FiniteStrictCoproductCompletion( Opposite(
#! PathCategory( FinQuiver( "Q(a)[]" ) ) ) ) )
a := PC.a;
#! <An object in
#!  FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>
aa := DirectProduct( a, a );
#! <An object in
#!  FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>
Display( aa );
#! [ 2, [ C.a, C.a ] ]
#! 
#! An object in
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#! given by the above data
a = aa;
#! false
HomStructure( aa, a );
#! |2|
hom_aa_a := MorphismsOfExternalHom( aa, a );
#! [ <A morphism in
#!    FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>,
#!   <A morphism in
#!    FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )> ]
hom_aa_a[1] = ProjectionInFactorOfDirectProduct( [ a, a ], 1 );
#! true
hom_aa_a[2] = ProjectionInFactorOfDirectProduct( [ a, a ], 2 );
#! true
HomStructure( a, aa );
#! |1|
hom_a_aa := MorphismsOfExternalHom( a, aa );
#! [ <A morphism in
#!    FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )> ]
delta := hom_a_aa[1];
#! <A morphism in
#!  FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )>
Source( delta ) = a;
#! true
Target( delta ) = aa;
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
#! [ id(a):C.a -≻ C.a, id(a):C.a -≻ C.a ]
#! 
#! A morphism in
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#! given by the above data
id_a := IdentityMorphism( C.a );
#! id(a):C.a -≻ C.a
delta = CartesianDiagonal( a, 2 );
#! true
CellAsEvaluatableString( delta, [ "C", "PC" ] );
#! "MorphismConstructor( PC,
#!         ObjectConstructor( PC,
#!                 Pair( 1, [ ObjectConstructor( C, 1 ) ] ) ),
#!         Pair( [ 0, 0 ],
#!               [ IdentityMorphism( C, ObjectConstructor( C, 1 ) ),
#!                 IdentityMorphism( C, ObjectConstructor( C, 1 ) ) ] ),
#!         ObjectConstructor( PC,
#!                 Pair( 2,
#!                       [ ObjectConstructor( C, 1 ),
#!                         ObjectConstructor( C, 1 ) ] ) ) )"
LPC := LazyCategory( PC );
#! LazyCategory(
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LPC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
F := PreCompose( EmbeddingOfUnderlyingCategory( PC ), Emb );
#! Precomposition of
#! Embedding functor into a finite strict product completion category and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of
#! Embedding functor into a finite strict product completion category and
#! Embedding functor into lazy category:
#! 
#! PathCategory( FinQuiver( "Q(a)[]" ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
G := ExtendFunctorToFiniteStrictProductCompletion( F );
#! Extension to FiniteStrictProductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict product completion category and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictProductCompletion( Source( Precomposition of
#! Embedding functor into a finite strict product completion category and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) )
#!   |
#!   V
#! LazyCategory(
#! FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )
Gdelta := G( delta );
#! <A morphism in LazyCategory(
#!  FiniteStrictProductCompletion( PathCategory( FinQuiver( "Q(a)[]" ) ) ) )>
IsWellDefined( Gdelta );
#! true
#! @EndExample
