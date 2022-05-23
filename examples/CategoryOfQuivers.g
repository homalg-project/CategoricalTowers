#! @BeginChunk CategoryOfQuivers

LoadPackage( "FunctorCategories" );

#! In the following we construct the category of quivers:

#! @Example
Quivers;
#! CategoryOfQuiversEnrichedOver( SkeletalFinSets )
V := Quivers.V;
#! <A projective object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( V );
#! Image of <(V)>:
#! { 0 }
#! 
#! Image of <(A)>:
#! ∅
#! 
#! Image of (A)-[(s)]->(V):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! Image of (A)-[(t)]->(V):
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
A := Quivers.A;
#! <A projective object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( A );
#! Image of <(V)>:
#! { 0, 1 }
#! 
#! Image of <(A)>:
#! { 0 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0 } ⱶ[ 0 ]→ { 0, 1 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
T := TerminalObject( Quivers );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( T );
#! Image of <(V)>:
#! { 0 }
#! 
#! Image of <(A)>:
#! { 0 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
G := CreateQuiver( 3, [ 0,1, 0,1, 1,2, 2,1, 2,2 ] );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( G );
#! Image of <(V)>:
#! { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! { 0,..., 4 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0,..., 4 } ⱶ[ 0, 0, 1, 2, 2 ]→ { 0, 1, 2 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0,..., 4 } ⱶ[ 1, 1, 2, 1, 2 ]→ { 0, 1, 2 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
global_G := HomStructure( T, G );
#! |1|
Display( global_G );
#! { 0 }
discrete := DirectProduct( G, V );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( discrete );
#! Image of <(V)>:
#! { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! ∅
#! 
#! Image of (A)-[(s)]->(V):
#! ∅ ⱶ[  ]→ { 0, 1, 2 }
#! 
#! Image of (A)-[(t)]->(V):
#! ∅ ⱶ[  ]→ { 0, 1, 2 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
global_discrete := HomStructure( T, discrete );
#! |0|
Display( global_discrete );
#! ∅
complete := Exponential( V, G );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( complete );
#! Image of <(V)>:
#! { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! { 0,..., 8 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0,..., 8 } ⱶ[ 0, 0, 0, 1, 1, 1, 2, 2, 2 ]→ { 0, 1, 2 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0,..., 8 } ⱶ[ 0, 1, 2, 0, 1, 2, 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
global_complete := HomStructure( T, complete );
#! |3|
Display( global_complete );
#! { 0, 1, 2 }
GA := DirectProduct( G, A );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( GA );
#! Image of <(V)>:
#! { 0,..., 5 }
#! 
#! Image of <(A)>:
#! { 0,..., 4 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0,..., 4 } ⱶ[ 0, 0, 2, 4, 4 ]→ { 0,..., 5 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0,..., 4 } ⱶ[ 3, 3, 5, 3, 5 ]→ { 0,..., 5 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
homAG := HomStructure( A, G );
#! |5|
Display( homAG );
#! { 0,..., 4 }
arrows := Exponential( A, G );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( arrows );
#! Image of <(V)>:
#! { 0,..., 8 }
#! 
#! Image of <(A)>:
#! { 0,..., 44 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0,..., 44 } ⱶ[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2,
#!                  2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6,
#!                  6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8 ]→ { 0,..., 8 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0,..., 44 } ⱶ[ 1, 1, 4, 4, 7, 7, 1, 1, 4, 4, 7, 7, 1, 1, 4,
#!                  4, 7, 7, 2, 5, 8, 2, 5, 8, 2, 5, 8, 1, 2, 4,
#!                  5, 7, 8, 1, 2, 4, 5, 7, 8, 1, 2, 4, 5, 7, 8 ]→ { 0,..., 8 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
global_arrows := HomStructure( T, arrows );
#! |5|
Display( global_arrows );
#! { 0,..., 4 }
prjG := ProjectionInFactorOfDirectProduct( [ G, V ], 1 );
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( prjG );
#! Image of <(V)>:
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0,..., 4 }
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
IsEpimorphism( prjG );
#! false
prj_discrete := ProjectionInFactorOfDirectProduct( [ discrete, V ], 1 );
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( prj_discrete );
#! Image of <(V)>:
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ ∅
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
IsEpimorphism( prj_discrete );
#! true
Display( Exponential( T, G ) );
#! Image of <(V)>:
#! { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! { 0,..., 4 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0,..., 4 } ⱶ[ 0, 0, 1, 2, 2 ]→ { 0, 1, 2 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0,..., 4 } ⱶ[ 1, 1, 2, 1, 2 ]→ { 0, 1, 2 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
t := UniversalMorphismIntoTerminalObject( V );
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( t );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
embG := Exponential( t, G );
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( embG );
#! Image of <(V)>:
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! { 0,..., 4 } ⱶ[ 1, 1, 5, 7, 8 ]→ { 0,..., 8 }
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
IsEpimorphism( embG );
#! false
emb_complete := Exponential( t, complete );
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( emb_complete );
#! Image of <(V)>:
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! Image of <(A)>:
#! { 0,..., 8 } ⱶ[ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]→ { 0,..., 8 }
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
IsEpimorphism( emb_complete );
#! true
s := Quivers.s;
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( s );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0, 1 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
t := Quivers.t;
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( t );
#! Image of <(V)>:
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
omega := SubobjectClassifier( Quivers );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( omega );
#! Image of <(V)>:
#! { 0, 1 }
#! 
#! Image of <(A)>:
#! { 0,..., 4 }
#! 
#! Image of (A)-[(s)]->(V):
#! { 0,..., 4 } ⱶ[ 0, 0, 1, 1, 1 ]→ { 0, 1 }
#! 
#! Image of (A)-[(t)]->(V):
#! { 0,..., 4 } ⱶ[ 0, 1, 0, 1, 1 ]→ { 0, 1 }
#! 
#! An object in FunctorCategory( FreeCategory(
#! RightQuiver( "q_op(V,A)[s:A->V,t:A->V]" ) ), SkeletalFinSets )
#! given by the above data
#! 
#! An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! @EndExample
#! @EndChunk
