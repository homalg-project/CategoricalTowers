#! @Chunk ReflexivePair

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
LoadPackage( "LazyCategories", ">= 2023.01-02" );
#! true
Q := RightQuiver( "Q(A,B)[f:A->B,g:A->B]" );
#! Q(A,B)[f:A->B,g:A->B]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) )
SetName( C.A, "C.A" ); SetName( C.B, "C.B" );
UC := FiniteStrictCoproductCocompletion( C );
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )
A := UC.A;
#! <An object in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
B := UC.B;
#! <An object in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
Display( A );
#! [ 1, [ C.A ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )
#! given by the above data
Display( B );
#! [ 1, [ C.B ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )
#! given by the above data
f := UC.f;
#! <A morphism in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
g := UC.g;
#! <A morphism in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
MorphismDatum( f );
#! [ [ 0 ], [ (A)-[(f)]->(B) ] ]
MorphismDatum( g );
#! [ [ 0 ], [ (A)-[(g)]->(B) ] ]
IsSplitEpimorphism( f );
#! false
IsSplitEpimorphism( g );
#! false
AuB := Coproduct( A, B );
#! <An object in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
Display( AuB );
#! [ 2, [ C.A, C.B ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )
#! given by the above data
HomStructure( AuB, B );
#! |2|
hom := MorphismsOfExternalHom( AuB, B );
#! [ <A morphism in FiniteStrictCoproductCocompletion(
#!    FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>,
#!   <A morphism in FiniteStrictCoproductCocompletion(
#!    FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )> ]
ff := hom[1];
#! <A morphism in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
gg := hom[2];
#! <A morphism in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
ff = gg;
#! false
IsSplitEpimorphism( ff );
#! true
IsSplitEpimorphism( gg );
#! true
MorphismDatum( ff );
#! [ [ 0, 0 ], [ (A)-[(f)]->(B), (B)-[(B)]->(B) ] ]
MorphismDatum( gg );
#! [ [ 0, 0 ], [ (A)-[(g)]->(B), (B)-[(B)]->(B) ] ]
HomStructure( B, AuB );
#! |1|
ii := MorphismsOfExternalHom( B, AuB )[1];
#! <A morphism in FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )>
ii = InjectionOfCofactorOfCoproduct( [ A, B ], 2 );
#! true
f = ComponentOfMorphismFromCoproduct( ff, [ A, B ], 1 );
#! true
IsOne( ComponentOfMorphismFromCoproduct( ff, [ A, B ], 2 ) );
#! true
g = ComponentOfMorphismFromCoproduct( gg, [ A, B ], 1  );
#! true
IsOne( ComponentOfMorphismFromCoproduct( gg, [ A, B ], 2 ) );
#! true
LUC := LazyCategory( UC );
#! LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) ) )
Emb := EmbeddingFunctorOfUnderlyingCategory( LUC );
#! Embedding functor into lazy category
Display( Emb );
#! Embedding functor into lazy category:
#! 
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )
#!   |
#!   V
#! LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) ) )
F := PreCompose( YonedaEmbeddingOfUnderlyingCategory( UC ), Emb );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category
Display( F );
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category:
#! 
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) )
#!   |
#!   V
#! LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) ) )
G := ExtendFunctorToFiniteStrictCoproductCocompletion( F );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) )
Display( G );
#! Extension to FiniteStrictCoproductCocompletion( Source(
#! Precomposition of Yoneda embedding functor and
#! Embedding functor into lazy category ) ):
#! 
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) )
#!   |
#!   V
#! LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) ) )
Gff := G( ff );
#! <A morphism in LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) ) )>
IsWellDefined( Gff );
#! true
Ggg := G( gg );
#! <A morphism in LazyCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Q(A,B)[f:A->B,g:A->B]" ) ) ) )>
IsWellDefined( Ggg );
#! true
MorphismDatum( EvaluatedCell( Gff ) );
#! [ [ 0, 0 ], [ (A)-[(f)]->(B), (B)-[(B)]->(B) ] ]
MorphismDatum( EvaluatedCell( Ggg ) );
#! [ [ 0, 0 ], [ (A)-[(g)]->(B), (B)-[(B)]->(B) ] ]
#! @EndExample
