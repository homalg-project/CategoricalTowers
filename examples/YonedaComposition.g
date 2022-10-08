#! @BeginChunk YonedaComposition

LoadPackage( "FunctorCategories" );

#! We compute the nerve of the full subcategory of the simplicial category $\Delta$ on the objects $[0], [1], [2]$.

#! @Example
Delta2 := SimplicialCategoryTruncatedInDegree( 2 );
#! FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations
RelationsOfFpCategory( Delta2 );
#! [ [ (s*id), (C0) ], [ (t*id), (C0) ],
#!   [ (ps*is), (C1) ], [ (pt*it), (C1) ],
#!   [ (is*id), (it*id) ], [ (pt*is), (id*t) ],
#!   [ (ps*it), (id*s) ], [ (s*pt), (t*ps) ],
#!   [ (s*mu), (s*ps) ], [ (t*mu), (t*pt) ],
#!   [ (mu*is), (C1) ], [ (mu*it), (C1) ] ]
Size( Delta2 );
#! 31
Ypt := YonedaProjection( Delta2 );
#! <An epimorphism in PreSheaves( FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations,
#!  SkeletalFinSets )>
IsWellDefined( Ypt );
#! true
Ymu := YonedaComposition( Delta2 );
#! <An epimorphism in PreSheaves( FreeCategory( RightQuiver(
#!    "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations,
#!  SkeletalFinSets )>
IsWellDefined( Ymu );
#! true
Ys := YonedaFibration( Delta2 );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver(
#!    "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations,
#!  SkeletalFinSets )>
IsWellDefined( Ys );
#! true
Display( Ys );
#! Image of <(C0)>:
#! { 0,..., 5 } ⱶ[ 0, 1, 1, 2, 2, 2 ]→ { 0, 1, 2 }
#! 
#! Image of <(C1)>:
#! { 0,..., 9 } ⱶ[ 0, 1, 1, 1, 2, 2, 2, 2, 2, 2 ]→ { 0, 1, 2 }
#! 
#! Image of <(C2)>:
#! { 0,..., 14 } ⱶ[ 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations,
#! SkeletalFinSets ) given by the above data
#! @EndExample
#! @EndChunk
