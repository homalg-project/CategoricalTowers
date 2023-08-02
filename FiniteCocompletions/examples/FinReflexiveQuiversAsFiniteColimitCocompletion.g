#! @BeginChunk FinReflexiveQuiversAsFiniteColimitCocompletion

#! @Example
LoadPackage( "FunctorCategories", ">= 2023.08-20" );
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
Display( PSh.C1 );
#! Image of <(C0)>:
#! { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0, 1, 2 }
#! 
#! Image of (C1)-[(id)]->(C0):
#! { 0, 1 } ⱶ[ 1, 2 ]→ { 0, 1, 2 }
#! 
#! Image of (C0)-[(s)]->(C1):
#! { 0, 1, 2 } ⱶ[ 0, 0, 1 ]→ { 0, 1 }
#! 
#! Image of (C0)-[(t)]->(C1):
#! { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver(
#! "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#! SkeletalFinSets ) given by the above data
coeq_pair := CoYonedaLemmaOnObjects( PSh.C1 );
#! <An object in PairOfParallelArrowsCategory( FiniteStrictCoproductCocompletion(
#!  FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#!  / [ s*id = C0, t*id = C0 ] ) )>
Display( coeq_pair );
#! Image of <(V)>:
#! [ 5, [ <(C0)>, <(C0)>, <(C1)>, <(C1)>, <(C1)> ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] ) given by the above data
#! 
#! Image of <(A)>:
#! [ 8, [ <(C1)>, <(C1)>, <(C0)>, <(C0)>, <(C0)>, <(C0)>, <(C0)>, <(C0)> ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0,..., 7 } ⱶ[ 3, 4, 0, 0, 1, 1, 0, 1 ]→ { 0,..., 4 }
#! 
#! [ (C1)-[(C1)]->(C1), (C1)-[(C1)]->(C1), (C0)-[(C0)]->(C0), (C0)-[(C0)]->(C0),
#!   (C0)-[(C0)]->(C0), (C0)-[(C0)]->(C0), (C0)-[(C0)]->(C0), (C0)-[(C0)]->(C0) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0,..., 7 } ⱶ[ 0, 1, 2, 3, 4, 2, 3, 4 ]→ { 0,..., 4 }
#! 
#! [ (C1)-[(id)]->(C0), (C1)-[(id)]->(C0), (C0)-[(s)]->(C1), (C0)-[(s)]->(C1),
#!   (C0)-[(s)]->(C1), (C0)-[(t)]->(C1), (C0)-[(t)]->(C1), (C0)-[(t)]->(C1) ]
#! 
#! A morphism in FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] ) given by the above data
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) ),
#! FiniteStrictCoproductCocompletion( FreeCategory(
#! RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] ) ) given by the above data
#! 
#! An object in PairOfParallelArrowsCategory( FiniteStrictCoproductCocompletion(
#! FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ] ) ) given by the above data
IsWellDefined( coeq_pair );
#! true
coeq_pair_in_presheaves := CoYonedaLemmaCoequalizerPair( PSh.C1 );;
coeq := Coequalizer( coeq_pair_in_presheaves[2] );
#! <An object in PreSheaves( FreeCategory( RightQuiver(
#!  "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#!  SkeletalFinSets )>
Display( coeq );
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
iso := Filtered( MorphismsOfExternalHom( PSh.C1, coeq ), IsIsomorphism )[1];
#! <An isomorphism in PreSheaves( FreeCategory( RightQuiver(
#!  "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#!  SkeletalFinSets )>
Display( iso );
#! Image of <(C0)>:
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! 
#! Image of <(C1)>:
#! { 0, 1, 2 } ⱶ[ 2, 0, 1 ]→ { 0, 1, 2 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver(
#! "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) ) / [ s*id = C0, t*id = C0 ],
#! SkeletalFinSets ) given by the above data
#! @EndExample
#! @EndChunk
