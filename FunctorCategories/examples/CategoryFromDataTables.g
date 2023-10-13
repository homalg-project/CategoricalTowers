#! @BeginChunk CategoryFromDataTables

#! We compute the nerve of the full subcategory of the simplicial category $\Delta$ on the objects $[0], [1]$.

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
Delta1 := UnderlyingCategory( FinReflexiveQuivers );
#! FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ]
N := NerveTruncatedInDegree2( Delta1 );
#! <An object in PreSheaves( FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations,
#!  SkeletalFinSets )>
IsWellDefined( N );
#! true
N.C0;
#! |2|
Display( N.C0 );
#! { 0, 1 }
N.C1;
#! |7|
Display( N.C1 );
#! { 0,..., 6 }
N.C2;
#! |26|
Display( N.C2 );
#! { 0,..., 25 }
N.id;
#! |2| → |7|
Display( N.id );
#! { 0, 1 } ⱶ[ 0, 4 ]→ { 0,..., 6 }
Display( N.is );
#! { 0,..., 6 } ⱶ[ 0, 1, 11, 12, 17, 18, 19 ]→ { 0,..., 25 }
Display( N.it );
#! { 0,..., 6 } ⱶ[ 0, 4, 7, 8, 17, 20, 23 ]→ { 0,..., 25 }
Delta2 := Source( N );
#! FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations
N( Delta2.it ) = N.it;
#! true
L := [ Delta2.it, Delta2.id, Delta2.t ];
#! [ (C2)-[(it)]->(C1), (C1)-[(id)]->(C0), (C0)-[(t)]->(C1) ]
mor := PreComposeList( L );
#! (C2)-[(is*id*t)]->(C1)
DecompositionOfMorphismInCategory( mor );
#! [ (C2)-[(is)]->(C1), (C1)-[(id)]->(C0), (C0)-[(t)]->(C1) ]
NL := N( mor );
#! |7| → |26|
Display( NL );
#! { 0,..., 6 } ⱶ[ 0, 0, 17, 17, 17, 17, 17 ]→ { 0,..., 25 }
LN := PostComposeList( List( L, N ) );
#! |7| → |26|
Display( LN );
#! { 0,..., 6 } ⱶ[ 0, 0, 17, 17, 17, 17, 17 ]→ { 0,..., 25 }
NL = LN;
#! true
#! @EndExample
#! @EndChunk
