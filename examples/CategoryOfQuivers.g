#! @BeginChunk CategoryOfQuivers

LoadPackage( "FunctorCategories" );

#! In the following we construct the category of finite quivers:

#! @Example
FinQuivers;
#! CategoryOfQuiversEnrichedOver( SkeletalFinSets )
V := FinQuivers.V;
#! <A projective object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( V );
#! ( { 0 }, { } )
A := FinQuivers.A;
#! <A projective object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( A );
#! ( { 0, 1 }, { 0 := [ 0, 1 ] } )
T := TerminalObject( FinQuivers );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( T );
#! ( { 0 }, { 0 := [ 0, 0 ] } )
G := CreateQuiver( 3, [ 0,1, 0,1, 1,2, 2,1, 2,2 ] );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( G );
#! ( { 0, 1, 2 },
#!   { 0 := [ 0, 1 ], 1 := [ 0, 1 ], 2 := [ 1, 2 ],
#!     3 := [ 2, 1 ], 4 := [ 2, 2 ] } )
global_G := HomStructure( T, G );
#! |1|
Display( global_G );
#! { 0 }
discrete := DirectProduct( G, V );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( discrete );
#! ( { 0, 1, 2 }, { } )
global_discrete := HomStructure( T, discrete );
#! |0|
Display( global_discrete );
#! ∅
complete := Exponential( V, G );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( complete );
#! ( { 0, 1, 2 },
#!   { 0 := [ 0, 0 ], 1 := [ 1, 0 ], 2 := [ 2, 0 ], 3 := [ 0, 1 ], 4 := [ 1, 1 ],
#!     5 := [ 2, 1 ], 6 := [ 0, 2 ], 7 := [ 1, 2 ], 8 := [ 2, 2 ] } )
global_complete := HomStructure( T, complete );
#! |3|
Display( global_complete );
#! { 0, 1, 2 }
GA := DirectProduct( G, A );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( GA );
#! ( { 0,..., 5 },
#!   { 0 := [ 0, 4 ], 1 := [ 0, 4 ], 2 := [ 1, 5 ],
#!     3 := [ 2, 4 ], 4 := [ 2, 5 ] } )
homAG := HomStructure( A, G );
#! |5|
Display( homAG );
#! { 0,..., 4 }
arrows := Exponential( A, G );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( arrows );
#! ( { 0,..., 8 },
#!   { 0 := [ 0, 3 ], 1 := [ 0, 4 ], 2 := [ 0, 5 ], 3 := [ 3, 3 ], 4 := [ 3, 4 ],
#!     5 := [ 3, 5 ], 6 := [ 6, 3 ], 7 := [ 6, 4 ], 8 := [ 6, 5 ], 9 := [ 0, 3 ],
#!     10 := [ 0, 4 ], 11 := [ 0, 5 ], 12 := [ 3, 3 ], 13 := [ 3, 4 ],
#!     14 := [ 3, 5 ], 15 := [ 6, 3 ], 16 := [ 6, 4 ], 17 := [ 6, 5 ],
#!     18 := [ 2, 3 ], 19 := [ 2, 4 ], 20 := [ 2, 5 ], 21 := [ 5, 3 ],
#!     22 := [ 5, 4 ], 23 := [ 5, 5 ], 24 := [ 8, 3 ], 25 := [ 8, 4 ],
#!     26 := [ 8, 5 ], 27 := [ 1, 6 ], 28 := [ 1, 7 ], 29 := [ 1, 8 ],
#!     30 := [ 4, 6 ], 31 := [ 4, 7 ], 32 := [ 4, 8 ], 33 := [ 7, 6 ],
#!     34 := [ 7, 7 ], 35 := [ 7, 8 ], 36 := [ 2, 6 ], 37 := [ 2, 7 ],
#!     38 := [ 2, 8 ], 39 := [ 5, 6 ], 40 := [ 5, 7 ], 41 := [ 5, 8 ],
#!     42 := [ 8, 6 ], 43 := [ 8, 7 ], 44 := [ 8, 8 ] } )
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
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
IsEpimorphism( prj_discrete );
#! true
Display( Exponential( T, G ) );
#! ( { 0, 1, 2 },
#!   { 0 := [ 0, 1 ], 1 := [ 0, 1 ], 2 := [ 2, 1 ],
#!     3 := [ 1, 2 ], 4 := [ 2, 2 ] } )
t := UniversalMorphismIntoTerminalObject( V );
#! <A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( t );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0 }
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
#! { 0,..., 4 } ⱶ[ 3, 3, 5, 7, 8 ]→ { 0,..., 8 }
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
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
IsEpimorphism( emb_complete );
#! true
s := FinQuivers.s;
#! <A monomorphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( s );
#! Image of <(V)>:
#! { 0 } ⱶ[ 0 ]→ { 0, 1 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
t := FinQuivers.t;
#! <A monomorphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( t );
#! Image of <(V)>:
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! 
#! Image of <(A)>:
#! ∅ ⱶ[  ]→ { 0 }
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
omega := SubobjectClassifier( FinQuivers );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( omega );
#! ( { 0, 1 },
#!   { 0 := [ 0, 0 ], 1 := [ 1, 0 ], 2 := [ 0, 1 ],
#!     3 := [ 1, 1 ], 4 := [ 1, 1 ] } )
HomStructure( omega, omega );
#! |39|
#! @EndExample
#! @EndChunk
