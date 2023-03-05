#! @BeginChunk FinReflexiveQuiversAsFiniteColimitCocompletion

#! @Example
LoadPackage( "FunctorCategories" );
#! true
Delta1 := SimplicialCategoryTruncatedInDegree( 1 );
#! FreeCategory( RightQuiver(
#! "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ]
Size( Delta1 );
#! 7
PSh := PreSheaves( Delta1 );
#! PreSheaves( FreeCategory( RightQuiver(
#!   "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#! SkeletalFinSets )
quiver := CoYonedaLemmaOnObjects( PSh.C1 );
#! <An object in FiniteColimitCocompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#!  / [ s*id = C0, t*id = C0 ] )>
Display( quiver );
#! [ [ <(C0)>, <(C0)>, <(C1)>, <(C1)>, <(C1)> ],
#!   [ [ 3, (C1)-[(id)]->(C0), 0 ], [ 4, (C1)-[(id)]->(C0), 1 ],
#!     [ 0, (C0)-[(s)]->(C1), 2 ], [ 0, (C0)-[(s)]->(C1), 3 ],
#!     [ 1, (C0)-[(s)]->(C1), 4 ], [ 1, (C0)-[(t)]->(C1), 2 ],
#!     [ 0, (C0)-[(t)]->(C1), 3 ], [ 1, (C0)-[(t)]->(C1), 4 ] ] ]
#! An object in FiniteColimitCocompletionWithStrictCoproducts(
#! FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] )
#! given by the above data
IsWellDefined( quiver );
#! true
q := SomeDiagramOfRepresentables( PSh.C1 );;
colimit := Colimit( q[1], q[2] );
#! <An object in PreSheaves( FreeCategory( RightQuiver(
#!  "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#! SkeletalFinSets )>
Display( colimit );
#! Image of <(C0)>:
#! { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0, 1, 2 }
#! 
#! Image of (C1)-[(id)]->(C0):
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
#! 
#! Image of (C0)-[(s)]->(C1):
#! { 0, 1, 2 } ⱶ[ 0, 1, 0 ]→ { 0, 1 }
#! 
#! Image of (C0)-[(t)]->(C1):
#! { 0, 1, 2 } ⱶ[ 0, 1, 1 ]→ { 0, 1 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver(
#! "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#! SkeletalFinSets ) given by the above data
colimit2 := Coequalizer( ColimitPair( PSh, q[1], q[2] )[2] );
#! <An object in PreSheaves( FreeCategory( RightQuiver(
#!  "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#! SkeletalFinSets )>
colimit2 = colimit;
#! true
#! @EndExample
#! @EndChunk
