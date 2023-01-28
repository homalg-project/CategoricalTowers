#! @BeginChunk FinBouquets

LoadPackage( "FunctorCategories" );

#! In the following we construct the category of finite bouquets (or finite multisets or finite maps):

#! @Example
FinBouquets;
#! CategoryOfBouquetsEnrichedOver( SkeletalFinSets )
C := UnderlyingCategory( FinBouquets );
#! FreeCategory( RightQuiver( "q(V,L)[b:V->L]" ) )
V := FinBouquets.V;
#! <A projective object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
Display( V );
#! ( { 0 }, { } )
L := FinBouquets.L;
#! <A projective object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
Display( L );
#! ( { 0 }, { 0 ↦ 0 } )
b := FinBouquets.b;
#! <A monomorphism in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
Display( b );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! Image of <(L)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )
#! given by the above data
T := TerminalObject( FinBouquets );
#! <An object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
Display( T );
#! ( { 0 }, { 0 ↦ 0 } )
T = L;
#! true
M := CreateBouquet( 3, [ 1, 1, 1, 2 ] );
#! <An object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
Display( M );
#! ( { 0, 1, 2 }, { 0 ↦ 1, 1 ↦ 1, 2 ↦ 1, 3 ↦ 2 } )
N := Colimit( [ V, V, V, L, L, L, L ],
             [ [ 1, b, 3 ],
               [ 1, b, 4 ],
               [ 1, b, 5 ],
               [ 2, b, 6 ] ] );
#! <An object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
N = M;
#! true
LL := Coproduct( L, L );
#! <An object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
L2 := CreateBouquet( 1, [ 0, 0 ] );
#! <An object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
epsilon := CreateBouquetMorphism( LL, [ 0, 0 ], [ 0, 1 ], L2 );
#! <A morphism in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
IsWellDefined( epsilon );
#! true
IsEpimorphism( epsilon );
#! true
IsSplitEpimorphism( epsilon );
#! false
omega := SubobjectClassifier( FinBouquets );
#! <An object in CategoryOfBouquetsEnrichedOver( SkeletalFinSets )>
Display( omega );
#! ( { 0, 1 }, { 0 ↦ 0, 1 ↦ 1, 2 ↦ 1 } )
#! @EndExample
#! @EndChunk
