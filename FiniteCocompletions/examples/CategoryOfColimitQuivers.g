#! @BeginChunk CategoryOfColimitQuivers

#! @Example
LoadPackage( "FunctorCategories", ">= 2024.09-09", false );
#! true
FinBouquets;
#! FinBouquets
Chat := ModelingCategory( FinBouquets );
#! FiniteCocompletion( PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )
ColimitQuiversC := CategoryOfColimitQuivers(
                 UnderlyingCategory( FinBouquets ) );
#! CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )
P := ColimitQuiversC.P;
#! <A projective object in CategoryOfColimitQuivers(
#!  PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )>
Display( P );
#! [ [ <(P)> ], [  ] ]
#! 
#! An object in CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
L := ColimitQuiversC.L;
#! <A projective object in CategoryOfColimitQuivers(
#!  PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )>
Display( L );
#! [ [ <(L)> ], [  ] ]
#! 
#! An object in CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
b := ColimitQuiversC.b;
#! <A morphism in CategoryOfColimitQuivers(
#!  PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )>
Display( b );
#! Source: [ [ <(P)> ], [  ] ]
#! 
#! An object in CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
#! 
#! Datum:  [ [ [ 0 ], [ (P)-[(b)]->(L) ] ], [  ] ]
#! 
#! Range:  [ [ <(L)> ], [  ] ]
#! 
#! An object in CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
#! 
#! A morphism in CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
F := CreateBouquet( 3, [ 0, 0, 0, 2 ] );
#! <An object in FinBouquets>
Display( F );
#! ( { 0, 1, 2 }, { 0 ↦ 0, 1 ↦ 0, 2 ↦ 0, 3 ↦ 2 } )
F_as_presheaf := ModelingObject( Chat, ModelingObject( FinBouquets, F ) );
#! <An object in PreSheaves( PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ),
#!  SkeletalFinSets )>
Display( F_as_presheaf );
#! Image of <(P)>:
#! { 0, 1, 2 }
#! 
#! Image of <(L)>:
#! { 0,..., 3 }
#! 
#! Image of (P)-[(b)]->(L):
#! { 0,..., 3 } ⱶ[ 0, 0, 0, 2 ]→ { 0, 1, 2 }
#! 
#! An object in PreSheaves( PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ),
#! SkeletalFinSets ) given by the above data
F_as_coequalizer_object := CoYonedaLemmaOnObjects( F_as_presheaf );
#! <An object in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )>
ColimitCompletionC := CapCategory( F_as_coequalizer_object );
#! FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )
Display( ColimitCompletionC );
#! A CAP category with name
#! FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ):
#! 
#! 21 primitive operations were used to derive 63 operations for this category
#! which algorithmically
#! * IsCocartesianCategory
#! and not yet algorithmically
#! * IsFiniteCocompleteCategory
Display( F_as_coequalizer_object );
#! Image of <(V)>:
#! [ 7, [ <(P)>, <(P)>, <(P)>, <(L)>, <(L)>, <(L)>, <(L)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 4, [ <(P)>, <(P)>, <(P)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0,..., 3 } ⱶ[ 0, 0, 0, 2 ]→ { 0,..., 6 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0,..., 3 } ⱶ[ 3, 4, 5, 6 ]→ { 0,..., 6 }
#! 
#! [ (P)-[(b)]->(L), (P)-[(b)]->(L), (P)-[(b)]->(L), (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V-≻A,t:V-≻A]" ) ),
#! FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
F_as_presheaf =
  Coequalizer( AssociatedCoequalizerPairInPreSheaves( F_as_coequalizer_object )[2] );
#! true
F_as_colimit_quiver := AssociatedColimitQuiver( F_as_coequalizer_object );
#! <An object in CategoryOfColimitQuivers(
#!  PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) )>
Display( F_as_colimit_quiver );
#! [ [ <(P)>, <(P)>, <(P)>, <(L)>, <(L)>, <(L)>, <(L)> ],
#!   [ [ 0, (P)-[(b)]->(L), 3 ], [ 0, (P)-[(b)]->(L), 4 ],
#!     [ 0, (P)-[(b)]->(L), 5 ], [ 2, (P)-[(b)]->(L), 6 ] ] ]
#! 
#! An object in CategoryOfColimitQuivers(
#! PathCategory( FinQuiver( "q(P,L)[b:P-≻L]" ) ) ) given by the above data
F_as_presheaf =
  Coequalizer( AssociatedCoequalizerPairInPreSheaves( F_as_colimit_quiver )[2] );
#! true
#! @EndExample
#! @EndChunk
