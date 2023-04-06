#! @BeginChunk FinBouquetsAsFiniteColimitCocompletion

#! @Example
LoadPackage( "FunctorCategories" );
#! true
FinBouquets;
#! FinBouquets
Cbar := ModelingCategory( FinBouquets );
#! FiniteCocompletion( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
Cbar2 := FiniteColimitCocompletionWithStrictCoproducts(
                 UnderlyingCategory( FinBouquets ) );
#! FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
P := Cbar2.P;
#! <A projective object in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( P );
#! [ [ <(P)> ], [  ] ]

#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
L := Cbar2.L;
#! <A projective object in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( L );
#! [ [ <(L)> ], [  ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
b := Cbar2.b;
#! <A morphism in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( b );
#! Source: [ [ <(P)> ], [  ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Datum:  [ [ [ 0 ], [ (P)-[(b)]->(L) ] ], [  ] ]
#! 
#! Range:  [ [ <(L)> ], [  ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! A morphism in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
source_bouquet := CreateBouquet( 3, [ 0, 0, 1 ] );
#! <An object in FinBouquets>
Display( source_bouquet );
#! ( { 0, 1, 2 }, { 0 ↦ 0, 1 ↦ 0, 2 ↦ 1 } )
source_presheaf := ModelingObject( Cbar,
                           ModelingObject( FinBouquets, source_bouquet ) );
#! <An object in
#!  PreSheaves( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ), SkeletalFinSets )>
source_colimit_quiver := CoYonedaLemmaOnObjects( source_presheaf );
#! <An object in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( source_colimit_quiver );
#! [ [ <(P)>, <(P)>, <(P)>, <(L)>, <(L)>, <(L)> ],
#!   [ [ 0, (P)-[(b)]->(L), 3 ], [ 0, (P)-[(b)]->(L), 4 ],
#!     [ 1, (P)-[(b)]->(L), 5 ] ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
IsWellDefined( source_colimit_quiver );
#! true
source_coeq_pair :=
  ModelingObject( CapCategory( source_colimit_quiver ), source_colimit_quiver );
#! <An object in FiniteCoequalizerClosureOfCocartesianCategory(
#!  FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )>
Display( source_coeq_pair );
#! Image of <(V)>:
#! [ 6, [ <(P)>, <(P)>, <(P)>, <(L)>, <(L)>, <(L)> ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 3, [ <(P)>, <(P)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0, 1, 2 } ⱶ[ 0, 0, 1 ]→ { 0,..., 5 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0, 1, 2 } ⱶ[ 3, 4, 5 ]→ { 0,..., 5 }
#! 
#! [ (P)-[(b)]->(L), (P)-[(b)]->(L), (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteCoequalizerClosureOfCocartesianCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
ModeledObject( CapCategory( source_colimit_quiver ),
        source_coeq_pair ) = source_colimit_quiver;
#! true
target_bouquet := CreateBouquet( 2, [ 0, 0, 0, 0, 1 ] );
#! <An object in FinBouquets>
Display( target_bouquet );
#! ( { 0, 1 }, { 0 ↦ 0, 1 ↦ 0, 2 ↦ 0, 3 ↦ 0, 4 ↦ 1 } )
target_presheaf := ModelingObject( Cbar,
                           ModelingObject( FinBouquets, target_bouquet ) );
#! <An object in
#!  PreSheaves( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ), SkeletalFinSets )>
target_colimit_quiver := CoYonedaLemmaOnObjects( target_presheaf );
#! <An object in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( target_colimit_quiver );
#! [ [ <(P)>, <(P)>, <(L)>, <(L)>, <(L)>, <(L)>, <(L)> ],
#!   [ [ 0, (P)-[(b)]->(L), 2 ], [ 0, (P)-[(b)]->(L), 3 ],
#!     [ 0, (P)-[(b)]->(L), 4 ], [ 0, (P)-[(b)]->(L), 5 ],
#!     [ 1, (P)-[(b)]->(L), 6 ] ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
#! given by the above data
IsWellDefined( target_colimit_quiver );
#! true
target_coeq_pair :=
  ModelingObject( CapCategory( target_colimit_quiver ), target_colimit_quiver );
#! <An object in FiniteCoequalizerClosureOfCocartesianCategory(
#!  FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )>
Display( target_coeq_pair );
#! Image of <(V)>:
#! [ 7, [ <(P)>, <(P)>, <(L)>, <(L)>, <(L)>, <(L)>, <(L)> ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 5, [ <(P)>, <(P)>, <(P)>, <(P)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0,..., 4 } ⱶ[ 0, 0, 0, 0, 1 ]→ { 0,..., 6 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0,..., 4 } ⱶ[ 2, 3, 4, 5, 6 ]→ { 0,..., 6 }
#! 
#! [ (P)-[(b)]->(L), (P)-[(b)]->(L), (P)-[(b)]->(L), (P)-[(b)]->(L), (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteCoequalizerClosureOfCocartesianCategory(
#! FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
ModeledObject( CapCategory( target_colimit_quiver ),
        target_coeq_pair ) = target_colimit_quiver;
#! true
bouquet_morphism := CreateBouquetMorphism(
                            source_bouquet,
                            [ 0, 1, 1 ], [ 1, 3, 4 ],
                            target_bouquet );
#! <A morphism in FinBouquets>
IsWellDefined( bouquet_morphism );
#! true
presheaf_morphism := ModelingMorphism( Cbar,
                             ModelingMorphism( FinBouquets, bouquet_morphism ) );
#! <A morphism in
#!  PreSheaves( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ), SkeletalFinSets )>
colimit_quiver_morphism := CoYonedaLemmaOnMorphisms( presheaf_morphism );
#! <A morphism in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( colimit_quiver_morphism );
#! Source: [ [ <(P)>, <(P)>, <(P)>, <(L)>, <(L)>, <(L)> ],
#!         [ [ 0, (P)-[(b)]->(L), 3 ], [ 0, (P)-[(b)]->(L), 4 ],
#!           [ 1, (P)-[(b)]->(L), 5 ] ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Datum:  [ [ [ 0, 1, 1, 3, 5, 6 ],
#!             [ (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P),
#!               (L)-[(L)]->(L), (L)-[(L)]->(L), (L)-[(L)]->(L) ] ],
#!           [ 1, 3, 4 ] ]
#! 
#! Range:  [ [ <(P)>, <(P)>, <(L)>, <(L)>, <(L)>, <(L)>, <(L)> ],
#!           [ [ 0, (P)-[(b)]->(L), 2 ], [ 0, (P)-[(b)]->(L), 3 ],
#!             [ 0, (P)-[(b)]->(L), 4 ], [ 0, (P)-[(b)]->(L), 5 ],
#!             [ 1, (P)-[(b)]->(L), 6 ] ] ]
#! 
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! A morphism in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
IsWellDefined( colimit_quiver_morphism );
#! true
coeq_pair_morphism :=
  ModelingMorphism( CapCategory( colimit_quiver_morphism ), colimit_quiver_morphism );
#! <A morphism in FiniteCoequalizerClosureOfCocartesianCategory(
#!  FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )>
Display( coeq_pair_morphism );
#! Image of <(V)>:
#! { 0,..., 5 } ⱶ[ 0, 1, 1, 3, 5, 6 ]→ { 0,..., 6 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P),
#!   (L)-[(L)]->(L), (L)-[(L)]->(L), (L)-[(L)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! { 0, 1, 2 } ⱶ[ 1, 3, 4 ]→ { 0,..., 4 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P), (P)-[(P)]->(P) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! A morphism in FiniteCoequalizerClosureOfCocartesianCategory(
#! FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
ModeledMorphism( CapCategory( colimit_quiver_morphism ),
        source_colimit_quiver,
        coeq_pair_morphism,
        target_colimit_quiver ) = colimit_quiver_morphism;
#! true
#! @EndExample
#! @EndChunk
