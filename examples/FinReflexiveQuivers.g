#! @BeginChunk FinReflexiveQuivers

#! In the following we construct the category of finite reflexive quivers:

#! @Example
LoadPackage( "FunctorCategories" );
#! true
FinReflexiveQuivers;
#! CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
V := FinReflexiveQuivers.V;
#! <A projective object in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( V );
#! ( { 0 }, { 0 := [ 0 ] } )
A := FinReflexiveQuivers.A;
#! <A projective object in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( A );
#! ( { 0, 1 }, { 0 := [ 0, 1 ], 1 := [ 0 ], 2 := [ 1 ] } )
T := TerminalObject( FinReflexiveQuivers );
#! <An object in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( T );
#! ( { 0 }, { 0 := [ 0 ] } )
T = V;
#! true
G := CreateReflexiveQuiver( 2,
             [ 1, 4 ],
             [ 0,1, 0,0, 0,0, 1,0, 1,1 ] );
#! <An object in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
IsWellDefined( G );
#! true
Display( G );
#! ( { 0, 1 },
#!   { 0 := [ 0, 1 ], 1 := [ 0 ], 2 := [ 0, 0 ], 3 := [ 1, 0 ], 4 := [ 1 ] } )
global_G := HomStructure( T, G );
#! |2|
Display( global_G );
#! { 0, 1 }
DirectProduct( G, V ) = G;
#! true
iso := CartesianEvaluationMorphism( T, G );
#! <A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
IsIsomorphism( iso );
#! true
Display( iso );
#! Image of <(C0)>:
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0,..., 4 } ⱶ[ 1, 2, 3, 0, 4 ]→ { 0,..., 4 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
s := FinReflexiveQuivers.s;
#! <A split monomorphism in
#!  CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( s );
#! Image of <(C0)>:
#! { 0 } ⱶ[ 0 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0 } ⱶ[ 1 ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
t := FinReflexiveQuivers.t;
#! <A split monomorphism in
#!  CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( t );
#! Image of <(C0)>:
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0 } ⱶ[ 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
l := FinReflexiveQuivers.l;
#! <A split epimorphism in
#!  CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( l );
#! Image of <(C0)>:
#! { 0, 1 } ⱶ[ 0, 0 ]→ { 0 }
#! 
#! Image of <(C1)>:
#! { 0, 1, 2 } ⱶ[ 0, 0, 0 ]→ { 0 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
omega := SubobjectClassifier( FinReflexiveQuivers );
#! <An object in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>
Display( omega );
#! ( { 0, 1 },
#!   { 0 := [ 0 ], 1 := [ 1, 0 ], 2 := [ 0, 1 ],
#!     3 := [ 1, 1 ], 4 := [ 1 ] } )
HomStructure( A, omega );
#! |5|
subsA := ListOfSubobjects( A );
#! [ <A monomorphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>,
#!   <A monomorphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>,
#!   <A monomorphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>,
#!   <A monomorphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )>,
#!   <A monomorphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )> ]
Perform( subsA, Display );
#! Image of <(C0)>:
#! ∅ ⱶ[  ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! ∅ ⱶ[  ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! Image of <(C0)>:
#! { 0 } ⱶ[ 0 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0 } ⱶ[ 1 ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! Image of <(C0)>:
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0 } ⱶ[ 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! Image of <(C0)>:
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0, 1 } ⱶ[ 1, 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! Image of <(C0)>:
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! @EndExample
#! @EndChunk
