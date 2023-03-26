#! @BeginChunk FinBouquets

LoadPackage( "FunctorCategories" );

#! In the following we construct the category of finite bouquets (or finite multisets or finite maps):

#! @Example
FinBouquets;
#! FinBouquets
C := UnderlyingCategory( FinBouquets );
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) )
P := FinBouquets.P;
#! <A projective object in FinBouquets>
Display( P );
#! ( { 0 }, { } )
L := FinBouquets.L;
#! <A projective object in FinBouquets>
Display( L );
#! ( { 0 }, { 0 ↦ 0 } )
b := FinBouquets.b;
#! <A monomorphism in FinBouquets>
Display( b );
#! Image of <(P)>:
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! Image of <(L)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in FinBouquets
#! given by the above data
T := TerminalObject( FinBouquets );
#! <An object in FinBouquets>
Display( T );
#! ( { 0 }, { 0 ↦ 0 } )
T = L;
#! true
M := CreateBouquet( 3, [ 1, 1, 1, 2 ] );
#! <An object in FinBouquets>
Display( M );
#! ( { 0, 1, 2 }, { 0 ↦ 1, 1 ↦ 1, 2 ↦ 1, 3 ↦ 2 } )
N := Colimit( [ P, P, P, L, L, L, L ],
             [ [ 1, b, 3 ],
               [ 1, b, 4 ],
               [ 1, b, 5 ],
               [ 2, b, 6 ] ] );
#! <An object in FinBouquets>
N = M;
#! true
LL := Coproduct( L, L );
#! <An object in FinBouquets>
L2 := CreateBouquet( 1, [ 0, 0 ] );
#! <An object in FinBouquets>
epsilon := CreateBouquetMorphism( LL, [ 0, 0 ], [ 0, 1 ], L2 );
#! <A morphism in FinBouquets>
IsWellDefined( epsilon );
#! true
IsEpimorphism( epsilon );
#! true
IsSplitEpimorphism( epsilon );
#! false
omega := SubobjectClassifier( FinBouquets );
#! <An object in FinBouquets>
Display( omega );
#! ( { 0, 1 }, { 0 ↦ 0, 1 ↦ 1, 2 ↦ 1 } )
PM := PowerObject( M );
#! <An object in FinBouquets>
Display( PM );
#! ( { 0,..., 7 },
#!   { 0 ↦ 0, 1 ↦ 1, 2 ↦ 2, 3 ↦ 3, 4 ↦ 2, 5 ↦ 3,
#!     6 ↦ 2, 7 ↦ 3, 8 ↦ 2, 9 ↦ 3, 10 ↦ 2, 11 ↦ 3,
#!     12 ↦ 2, 13 ↦ 3, 14 ↦ 2, 15 ↦ 3, 16 ↦ 2, 17 ↦ 3,
#!     18 ↦ 4, 19 ↦ 5, 20 ↦ 6, 21 ↦ 7, 22 ↦ 6, 23 ↦ 7,
#!     24 ↦ 6, 25 ↦ 7, 26 ↦ 6, 27 ↦ 7, 28 ↦ 6, 29 ↦ 7,
#!     30 ↦ 6, 31 ↦ 7, 32 ↦ 6, 33 ↦ 7, 34 ↦ 6, 35 ↦ 7,
#!     36 ↦ 4, 37 ↦ 5, 38 ↦ 6, 39 ↦ 7, 40 ↦ 6, 41 ↦ 7,
#!     42 ↦ 6, 43 ↦ 7, 44 ↦ 6, 45 ↦ 7, 46 ↦ 6, 47 ↦ 7,
#!     48 ↦ 6, 49 ↦ 7, 50 ↦ 6, 51 ↦ 7, 52 ↦ 6, 53 ↦ 7 } )
#! @EndExample
#! @EndChunk
