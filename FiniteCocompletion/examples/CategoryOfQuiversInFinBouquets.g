#! @BeginChunk CategoryOfQuiversInFinBouquets

#! @Example
LoadPackage( "FunctorCategories" );
#! true
FinBouquets;
#! FinBouquets
Cbar := ModelingCategory( FinBouquets );
#! FiniteCocompletion( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
source_bouquet := CreateBouquet( 3, [ 0, 0, 1 ] );
#! <An object in FinBouquets>
Display( source_bouquet );
#! ( { 0, 1, 2 }, { 0 ↦ 0, 1 ↦ 0, 2 ↦ 1 } )
source_presheaf := ModelingObject( Cbar,
                           ModelingObject( FinBouquets, source_bouquet ) );
#! <An object in
#!  PreSheaves( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ), SkeletalFinSets )>
source_quiver := CoYonedaLemmaOnObjects( source_presheaf );
#! <An object in CategoryOfQuivers( FreeCategory(
#!  RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( source_quiver );
#! [ [ <(P)>, <(P)>, <(P)>, <(L)>, <(L)>, <(L)> ],
#!   [ [ 0, (P)-[(b)]->(L), 3 ], [ 0, (P)-[(b)]->(L), 4 ],
#!     [ 1, (P)-[(b)]->(L), 5 ] ] ]
#! 
#! An object in CategoryOfQuivers( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
#! given by the above data
IsWellDefined( source_quiver );
#! true
s_coeq_pair := ModelingObject( CapCategory( source_quiver ), source_quiver );
#! <An object in FiniteCoequalizerClosureOfCocartesianCategory(
#!  FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )>
Display( s_coeq_pair );
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
ModeledObject( CapCategory( source_quiver ), s_coeq_pair ) = source_quiver;
#! true
target_bouquet := CreateBouquet( 2, [ 0, 0, 0, 0, 1 ] );
#! <An object in FinBouquets>
Display( target_bouquet );
#! ( { 0, 1 }, { 0 ↦ 0, 1 ↦ 0, 2 ↦ 0, 3 ↦ 0, 4 ↦ 1 } )
target_presheaf := ModelingObject( Cbar,
                           ModelingObject( FinBouquets, target_bouquet ) );
#! <An object in
#!  PreSheaves( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ), SkeletalFinSets )>
target_quiver := CoYonedaLemmaOnObjects( target_presheaf );
#! <An object in CategoryOfQuivers( FreeCategory(
#!  RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( target_quiver );
#! [ [ <(P)>, <(P)>, <(L)>, <(L)>, <(L)>, <(L)>, <(L)> ],
#!   [ [ 0, (P)-[(b)]->(L), 2 ], [ 0, (P)-[(b)]->(L), 3 ],
#!     [ 0, (P)-[(b)]->(L), 4 ], [ 0, (P)-[(b)]->(L), 5 ],
#!     [ 1, (P)-[(b)]->(L), 6 ] ] ]
#! 
#! An object in CategoryOfQuivers( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
#! given by the above data
IsWellDefined( target_quiver );
#! true
t_coeq_pair := ModelingObject( CapCategory( target_quiver ), target_quiver );
#! <An object in FiniteCoequalizerClosureOfCocartesianCategory(
#!  FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )>
Display( t_coeq_pair );
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
ModeledObject( CapCategory( target_quiver ), t_coeq_pair ) = target_quiver;
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
quiver_morphism := CoYonedaLemmaOnMorphisms( presheaf_morphism );
#! <A morphism in
#!  CategoryOfQuivers( FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
IsWellDefined( quiver_morphism );
#! true
coeq_pair_m :=
  ModelingMorphism( CapCategory( quiver_morphism ), quiver_morphism );
#! <A morphism in FiniteCoequalizerClosureOfCocartesianCategory(
#!  FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )>
Display( coeq_pair_m );
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
ModeledMorphism( CapCategory( quiver_morphism ),
        source_quiver, coeq_pair_m, target_quiver ) = quiver_morphism;
#! true
#! @EndExample
#! @EndChunk
