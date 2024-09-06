#! @BeginChunk FiniteColimitCompletionWithStrictCoproducts

#! @Example
LoadPackage( "FunctorCategories", ">= 2023.10-04", false );
#! true
FinBouquets;
#! FinBouquets
Display( FinBouquets );
#! A CAP category with name FinBouquets:
#! 
#! 70 primitive operations were used to derive 336 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsElementaryTopos
C := UnderlyingCategory( FinBouquets );
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) )
C_hat := FiniteColimitCompletionWithStrictCoproducts( C );
#! FiniteColimitCompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )
ModelingCategory( C_hat );
#! CoequalizerCompletion( FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) )
Display( C_hat );
#! A CAP category with name
#! FiniteColimitCompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ):
#! 
#! 22 primitive operations were used to derive 64 operations for this category
#! which algorithmically
#! * IsCocartesianCategory
#! and not yet algorithmically
#! * IsFiniteCocompleteCategory
MissingOperationsForConstructivenessOfCategory( C_hat, "IsFiniteCocompleteCategory" );
#! [ "UniversalMorphismFromCoequalizerWithGivenCoequalizer" ]
P := C_hat.P;
#! <A projective object in FiniteColimitCompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
L := C_hat.L;
#! <A projective object in FiniteColimitCompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
b := C_hat.b;
#! <A morphism in FiniteColimitCompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Source( b ) = P;
#! true
Target( b ) = L;
#! true
Display( P );
#! Image of <(V)>:
#! [ 1, [ <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
Display( L );
#! Image of <(V)>:
#! [ 1, [ <(L)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
Display( b );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! [ (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ ∅
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! A morphism in FiniteColimitCompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
inj := InjectionOfCofactorOfPushout( [ b, b ], 1 );
#! <A morphism in FiniteColimitCompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
IsWellDefined( inj );
#! true
Source( inj ) = L;
#! true
pushout := Target( inj );
#! <An object in FiniteColimitCompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) )>
Display( pushout );
#! Image of <(V)>:
#! [ 3, [ <(L)>, <(L)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 2, [ <(P)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0, 1 } ⱶ[ 2, 2 ]→ { 0, 1, 2 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
#! 
#! [ (P)-[(b)]->(L), (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "q(P,L)[b:P->L]" ) ) ) given by the above data
#! @EndExample
#! @EndChunk
