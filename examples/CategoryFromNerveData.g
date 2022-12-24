#! @BeginChunk CategoryFromNerveData

LoadPackage( "FunctorCategories" );

#! We compute the nerve of the full subcategory of the simplicial category $\Delta$ on the objects $[0], [1], [2]$.

#! @Example
Delta2 := CategoryFromNerveData( SimplicialCategoryTruncatedInDegree( 2 ) );
#! FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations
N := NerveTruncatedInDegree2( Delta2 );
#! <An object in PreSheaves( FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations,
#!  SkeletalFinSets )>
IsWellDefined( N );
#! true
N.C0;
#! |3|
Display( N.C0 );
#! { 0, 1, 2 }
N.C1;
#! |31|
Display( N.C1 );
#! { 0,..., 30 }
N.C2;
#! |393|
Display( N.C2 );
#! { 0,..., 392 }
N.id;
#! |3| → |31|
Display( N.id );
#! { 0, 1, 2 } ⱶ[ 0, 5, 21 ]→ { 0,..., 30 }
#! @EndExample
#! @EndChunk
