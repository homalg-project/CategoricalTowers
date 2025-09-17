#! @BeginChunk FiniteColimitCompletionWithStrictCoproducts

#! @Example
LoadPackage( "FunctorCategories", ">= 2025.08-03", false );
#! true
FinBouquets;
#! FinBouquets
Display( FinBouquets );
#! A CAP category with name FinBouquets:
#! 
#! 52 primitive operations were used to derive 356 operations for this category \
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsSymmetricMonoidalCategory
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
C := UnderlyingCategory( FinBouquets );
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) )
C_hat := FiniteColimitCompletionWithStrictCoproducts( C );
#! FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )
ModelingCategory( C_hat );
#! CoequalizerCompletion( FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) )
Display( C_hat );
#! A CAP category with name
#! FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ):
#! 
#! 18 primitive operations were used to derive 63 operations for this category
#! which algorithmically
#! * IsCocartesianCategory
#! and not yet algorithmically
#! * IsFiniteCocompleteCategory
MissingOperationsForConstructivenessOfCategory( C_hat, "IsFiniteCocompleteCategory" );
#! [ "UniversalMorphismFromCoequalizer" ]
P := C_hat.P;
#! <A projective object in FiniteColimitCompletionWithStrictCoproducts(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
L := C_hat.L;
#! <A projective object in FiniteColimitCompletionWithStrictCoproducts(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
b := C_hat.b;
#! <A morphism in FiniteColimitCompletionWithStrictCoproducts(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
Source( b ) = P;
#! true
Target( b ) = L;
#! true
Display( P );
#! Image of <(V)>:
#! [ 1, [ <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V→A,t:V→A]" ) ),
#! FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
Display( L );
#! Image of <(V)>:
#! [ 1, [ <(L)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V→A,t:V→A]" ) ),
#! FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
Display( b );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! [ (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ ∅
#! 
#! [  ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! A morphism in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V→A,t:V→A]" ) ),
#! FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) ) given by the above data
#! 
#! A morphism in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
inj := InjectionOfCofactorOfPushout( [ b, b ], 1 );
#! <A morphism in FiniteColimitCompletionWithStrictCoproducts(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
IsWellDefined( inj );
#! true
Source( inj ) = L;
#! true
pushout := Target( inj );
#! <An object in FiniteColimitCompletionWithStrictCoproducts(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
Display( pushout );
#! Image of <(V)>:
#! [ 3, [ <(L)>, <(L)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of <(A)>:
#! [ 2, [ <(P)>, <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0, 1 } ⱶ[ 2, 2 ]→ { 0, 1, 2 }
#! 
#! [ (P)-[(P)]->(P), (P)-[(P)]->(P) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
#! 
#! [ (P)-[(b)]->(L), (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! 
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V→A,t:V→A]" ) ),
#! FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
#! @EndExample
#! @EndChunk
